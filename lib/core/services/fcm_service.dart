import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/notifications/data/models/notification_models.dart';
import '../../features/notifications/data/repositories/notification_repository.dart';
import '../router/app_router.dart';

/// 백그라운드 메시지 핸들러 (top-level 함수여야 함)
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  debugPrint('[FCM] 백그라운드 메시지: ${message.messageId}');
}

/// 포그라운드 수신 메시지 — BottomNavShell에서 구독해 배너 표시
final fcmForegroundMessageProvider =
    StateProvider<RemoteMessage?>((ref) => null);

final fcmServiceProvider = Provider<FcmService>((ref) {
  return FcmService(ref);
});

class FcmService {
  final Ref _ref;
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  FcmService(this._ref);

  /// FCM 초기화 — 앱 시작 후 로그인 상태에서 호출
  Future<void> initialize() async {
    // 알림 권한 요청
    final settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.denied) {
      debugPrint('[FCM] 알림 권한이 거부되었습니다.');
      return;
    }

    // FCM 토큰 획득 및 서버 등록
    final token = await _messaging.getToken();
    if (token != null) {
      await _registerToken(token);
    }

    // 토큰 갱신 리스너
    _messaging.onTokenRefresh.listen(_registerToken);

    // 포그라운드 메시지 처리
    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);

    // 백그라운드에서 알림 탭 시 처리
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessageOpenedApp);

    // 앱이 종료된 상태에서 알림 탭으로 열린 경우
    final initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) {
      _handleMessageOpenedApp(initialMessage);
    }
  }

  /// FCM 토큰을 서버에 등록
  Future<void> _registerToken(String token) async {
    try {
      final platform = Platform.isAndroid ? 'android' : 'ios';
      final repo = _ref.read(notificationRepositoryProvider);
      await repo.registerDeviceToken(
        DeviceTokenRequest(token: token, platform: platform),
      );
      debugPrint('[FCM] 토큰 등록 성공');
    } catch (e) {
      debugPrint('[FCM] 토큰 등록 실패: $e');
    }
  }

  /// 포그라운드 메시지 — provider에 저장해 BottomNavShell이 배너로 표시
  void _handleForegroundMessage(RemoteMessage message) {
    debugPrint('[FCM] 포그라운드 메시지: ${message.notification?.title}');
    _ref.read(fcmForegroundMessageProvider.notifier).state = message;
  }

  /// 알림 탭으로 앱이 열렸을 때 — data.type 기준으로 화면 이동
  void _handleMessageOpenedApp(RemoteMessage message) {
    debugPrint('[FCM] 알림 탭: ${message.data}');
    _navigateForMessage(message);
  }

  void _navigateForMessage(RemoteMessage message) {
    final type = message.data['type'] as String?;
    final router = _ref.read(routerProvider);

    switch (type) {
      case 'new_draw':
        final drawNo = message.data['draw_no'] as String?;
        if (drawNo != null) {
          router.push('/draws/$drawNo');
        } else {
          router.push('/draws');
        }
      case 'winning':
        router.push('/notifications?tab=1');
      default:
        router.push('/notifications');
    }
  }

  /// 현재 FCM 토큰 반환
  Future<String?> getToken() => _messaging.getToken();

  /// 서버에서 디바이스 토큰 삭제 (로그아웃 시 호출)
  Future<void> deleteToken() async {
    try {
      final token = await _messaging.getToken();
      if (token != null) {
        final repo = _ref.read(notificationRepositoryProvider);
        await repo.deleteDeviceToken(token);
      }
      await _messaging.deleteToken();
      debugPrint('[FCM] 토큰 삭제 성공');
    } catch (e) {
      debugPrint('[FCM] 토큰 삭제 실패: $e');
    }
  }
}
