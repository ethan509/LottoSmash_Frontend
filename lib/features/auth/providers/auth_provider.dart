import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../../core/network/api_exception.dart';
import '../../../core/network/auth_interceptor.dart';
import '../../../core/network/dio_client.dart';
import '../../../core/services/fcm_service.dart';
import '../data/models/auth_models.dart';
import '../data/repositories/auth_repository.dart';

const _deviceIdKey = 'device_id';

/// 인증 상태 관리 (true = 로그인됨)
final authStateNotifierProvider =
    AsyncNotifierProvider<AuthStateNotifier, bool>(() => AuthStateNotifier());

class AuthStateNotifier extends AsyncNotifier<bool> {
  @override
  Future<bool> build() async {
    // 앱 시작 시 Secure Storage → 메모리로 토큰 로드
    final storage = ref.read(secureStorageProvider);
    await TokenStore.loadFromStorage(storage);
    return TokenStore.accessToken != null;
  }

  /// 토큰 저장 (메모리 + Secure Storage)
  Future<void> _saveTokens(AuthResponse auth) async {
    final storage = ref.read(secureStorageProvider);
    await TokenStore.save(
      accessToken: auth.accessToken,
      refreshToken: auth.refreshToken,
      storage: storage,
    );
  }

  /// 토큰 삭제 (메모리 + Secure Storage)
  Future<void> _clearTokens() async {
    final storage = ref.read(secureStorageProvider);
    await TokenStore.clear(storage);
  }

  /// device_id 가져오기 (없으면 생성)
  Future<String> _getOrCreateDeviceId() async {
    final storage = ref.read(secureStorageProvider);
    var deviceId = await storage.read(key: _deviceIdKey);
    if (deviceId == null) {
      deviceId = const Uuid().v4();
      await storage.write(key: _deviceIdKey, value: deviceId);
    }
    return deviceId;
  }

  /// 게스트 로그인
  Future<void> guestLogin() async {
    state = const AsyncLoading();
    try {
      final deviceId = await _getOrCreateDeviceId();
      final repo = ref.read(authRepositoryProvider);
      final auth = await repo.guestLogin(deviceId);
      await _saveTokens(auth);
      ref.invalidate(currentUserProvider);
      state = const AsyncData(true);
    } catch (e, st) {
      debugPrint('[guestLogin] error type: ${e.runtimeType}');
      debugPrint('[guestLogin] error: $e');
      state = AsyncError(e, st);
      rethrow;
    }
  }

  /// 회원가입 + 자동 로그인 (device_id 자동 포함 → 게스트 → 정회원 업그레이드)
  Future<void> register(RegisterRequest request) async {
    state = const AsyncLoading();
    try {
      final deviceId = await _getOrCreateDeviceId();
      final repo = ref.read(authRepositoryProvider);
      final auth = await repo.register(request.copyWith(deviceId: deviceId));
      await _saveTokens(auth);
      ref.invalidate(currentUserProvider);
      state = const AsyncData(true);
    } catch (e, st) {
      debugPrint('[register] error type: ${e.runtimeType}');
      debugPrint('[register] error: $e');
      state = AsyncError(e, st);
      rethrow;
    }
  }

  /// 이메일 로그인
  Future<void> login(String email, String password) async {
    state = const AsyncLoading();
    try {
      final repo = ref.read(authRepositoryProvider);
      final auth = await repo.login(email, password);
      await _saveTokens(auth);
      ref.invalidate(currentUserProvider);
      state = const AsyncData(true);
    } catch (e, st) {
      state = AsyncError(e, st);
      rethrow;
    }
  }

  /// 로그아웃
  Future<void> logout() async {
    // FCM 토큰 삭제 (best-effort)
    try {
      final fcm = ref.read(fcmServiceProvider);
      await fcm.deleteToken();
    } catch (_) {}

    final refreshToken = TokenStore.refreshToken;

    // 서버에 로그아웃 요청 (실패해도 계속 진행)
    if (refreshToken != null) {
      try {
        final repo = ref.read(authRepositoryProvider);
        await repo.logout(refreshToken);
      } catch (_) {
        // best-effort
      }
    }

    await _clearTokens();
    ref.invalidate(currentUserProvider);
    state = const AsyncData(false);
  }
}

/// 현재 유저 정보
final currentUserProvider = FutureProvider<User?>((ref) async {
  final isAuthenticated = ref.watch(authStateNotifierProvider).valueOrNull ?? false;
  if (!isAuthenticated) return null;

  try {
    final repo = ref.read(authRepositoryProvider);
    return await repo.getMe();
  } on ApiException catch (e) {
    if (e.isUnauthorized) {
      final storage = ref.read(secureStorageProvider);
      await TokenStore.clear(storage);
      return null;
    }
    // 네트워크 오류 등 → 게스트 토큰이면 폴백 User 반환
    return _guestFallbackFromToken();
  } catch (_) {
    return _guestFallbackFromToken();
  }
});

/// 저장된 JWT에서 GUEST 여부를 판단해 최소 User 반환
User? _guestFallbackFromToken() {
  final token = TokenStore.accessToken;
  if (token == null) return null;
  try {
    final parts = token.split('.');
    if (parts.length != 3) return null;
    final payload = json.decode(
      utf8.decode(base64Url.decode(base64Url.normalize(parts[1]))),
    ) as Map<String, dynamic>;
    if (payload['tier_code'] == 'GUEST') {
      return const User(
        id: 0,
        tier: UserTier(code: 'GUEST', name: '게스트', level: 0),
      );
    }
    return null;
  } catch (_) {
    return null;
  }
}
