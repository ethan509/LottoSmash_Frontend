import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../../core/network/dio_client.dart';
import '../../../core/services/fcm_service.dart';
import '../data/models/auth_models.dart';
import '../data/repositories/auth_repository.dart';

const _accessTokenKey = 'access_token';
const _refreshTokenKey = 'refresh_token';
const _deviceIdKey = 'device_id';

/// 인증 상태 관리 (true = 로그인됨)
final authStateNotifierProvider =
    AsyncNotifierProvider<AuthStateNotifier, bool>(() => AuthStateNotifier());

class AuthStateNotifier extends AsyncNotifier<bool> {
  @override
  Future<bool> build() async {
    final storage = ref.read(secureStorageProvider);
    final token = await storage.read(key: _accessTokenKey);
    return token != null;
  }

  /// 토큰 저장
  Future<void> _saveTokens(AuthResponse auth) async {
    final storage = ref.read(secureStorageProvider);
    await storage.write(key: _accessTokenKey, value: auth.accessToken);
    await storage.write(key: _refreshTokenKey, value: auth.refreshToken);
  }

  /// 토큰 삭제
  Future<void> _clearTokens() async {
    final storage = ref.read(secureStorageProvider);
    await storage.delete(key: _accessTokenKey);
    await storage.delete(key: _refreshTokenKey);
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
    state = await AsyncValue.guard(() async {
      final deviceId = await _getOrCreateDeviceId();
      final repo = ref.read(authRepositoryProvider);
      final auth = await repo.guestLogin(deviceId);
      await _saveTokens(auth);
      // currentUserProvider 갱신
      ref.invalidate(currentUserProvider);
      return true;
    });
  }

  /// 이메일 로그인
  Future<void> login(String email, String password) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(authRepositoryProvider);
      final auth = await repo.login(email, password);
      await _saveTokens(auth);
      ref.invalidate(currentUserProvider);
      return true;
    });
  }

  /// 회원가입
  Future<void> register(RegisterRequest request) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(authRepositoryProvider);
      final auth = await repo.register(request);
      await _saveTokens(auth);
      ref.invalidate(currentUserProvider);
      return true;
    });
  }

  /// 로그아웃
  Future<void> logout() async {
    // FCM 토큰 삭제 (best-effort)
    try {
      final fcm = ref.read(fcmServiceProvider);
      await fcm.deleteToken();
    } catch (_) {}

    final storage = ref.read(secureStorageProvider);
    final refreshToken = await storage.read(key: _refreshTokenKey);

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

  final repo = ref.read(authRepositoryProvider);
  return await repo.getMe();
});
