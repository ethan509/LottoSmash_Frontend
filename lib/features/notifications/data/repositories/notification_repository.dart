import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/network/dio_client.dart';
import '../models/notification_models.dart';

final notificationRepositoryProvider =
    Provider<NotificationRepository>((ref) {
  return NotificationRepository(ref.watch(dioProvider));
});

class NotificationRepository {
  final Dio _dio;

  NotificationRepository(this._dio);

  /// 알림 목록
  Future<NotificationListResponse> getNotifications({
    int limit = 20,
    int offset = 0,
  }) async {
    return apiCall(() async {
      final response = await _dio.get(
        ApiEndpoints.notifications,
        queryParameters: {'limit': limit, 'offset': offset},
      );
      return NotificationListResponse.fromJson(response.data);
    });
  }

  /// 당첨 확인 목록
  Future<WinningListResponse> getWinnings({
    int limit = 20,
    int offset = 0,
  }) async {
    return apiCall(() async {
      final response = await _dio.get(
        ApiEndpoints.winnings,
        queryParameters: {'limit': limit, 'offset': offset},
      );
      return WinningListResponse.fromJson(response.data);
    });
  }

  /// 디바이스 토큰 등록
  Future<void> registerDeviceToken(DeviceTokenRequest request) async {
    return apiCall(() async {
      await _dio.post(
        ApiEndpoints.deviceToken,
        data: request.toJson(),
      );
    });
  }

  /// 미확인 당첨 결과 조회
  Future<UnreadWinsResponse> getUnreadWins() async {
    return apiCall(() async {
      final response = await _dio.get(ApiEndpoints.winsUnread);
      return UnreadWinsResponse.fromJson(response.data);
    });
  }

  /// 당첨 결과 읽음 처리
  Future<int> markWinsAsRead() async {
    return apiCall(() async {
      final response = await _dio.post(ApiEndpoints.winsRead);
      return (response.data['marked'] as int?) ?? 0;
    });
  }

  /// 디바이스 토큰 삭제
  Future<void> deleteDeviceToken(String token) async {
    return apiCall(() async {
      await _dio.delete(
        ApiEndpoints.deviceToken,
        data: {'token': token},
      );
    });
  }
}
