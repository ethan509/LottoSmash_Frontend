import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_models.freezed.dart';
part 'notification_models.g.dart';

@freezed
class AppNotification with _$AppNotification {
  const factory AppNotification({
    required int id,
    required String type,
    required String title,
    required String body,
    required String status,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _AppNotification;

  factory AppNotification.fromJson(Map<String, dynamic> json) =>
      _$AppNotificationFromJson(json);
}

@freezed
class NotificationListResponse with _$NotificationListResponse {
  const factory NotificationListResponse({
    required List<AppNotification> notifications,
    @JsonKey(name: 'total_count') required int totalCount,
  }) = _NotificationListResponse;

  factory NotificationListResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationListResponseFromJson(json);
}

@freezed
class WinningResult with _$WinningResult {
  const factory WinningResult({
    required int id,
    @JsonKey(name: 'recommendation_id') required int recommendationId,
    @JsonKey(name: 'draw_no') required int drawNo,
    @JsonKey(name: 'matched_numbers') required List<int> matchedNumbers,
    @JsonKey(name: 'matched_count') required int matchedCount,
    @JsonKey(name: 'bonus_matched') required bool bonusMatched,
    @JsonKey(name: 'prize_rank') int? prizeRank,
  }) = _WinningResult;

  factory WinningResult.fromJson(Map<String, dynamic> json) =>
      _$WinningResultFromJson(json);
}

@freezed
class WinningListResponse with _$WinningListResponse {
  const factory WinningListResponse({
    required List<WinningResult> winnings,
    @JsonKey(name: 'total_count') required int totalCount,
  }) = _WinningListResponse;

  factory WinningListResponse.fromJson(Map<String, dynamic> json) =>
      _$WinningListResponseFromJson(json);
}

@freezed
class DeviceTokenRequest with _$DeviceTokenRequest {
  const factory DeviceTokenRequest({
    required String token,
    required String platform,
  }) = _DeviceTokenRequest;

  factory DeviceTokenRequest.fromJson(Map<String, dynamic> json) =>
      _$DeviceTokenRequestFromJson(json);
}
