// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppNotificationImpl _$$AppNotificationImplFromJson(
  Map<String, dynamic> json,
) => _$AppNotificationImpl(
  id: (json['id'] as num).toInt(),
  type: json['type'] as String,
  title: json['title'] as String,
  body: json['body'] as String,
  status: json['status'] as String,
  createdAt: json['created_at'] as String,
);

Map<String, dynamic> _$$AppNotificationImplToJson(
  _$AppNotificationImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'type': instance.type,
  'title': instance.title,
  'body': instance.body,
  'status': instance.status,
  'created_at': instance.createdAt,
};

_$NotificationListResponseImpl _$$NotificationListResponseImplFromJson(
  Map<String, dynamic> json,
) => _$NotificationListResponseImpl(
  notifications:
      (json['notifications'] as List<dynamic>?)
          ?.map((e) => AppNotification.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <AppNotification>[],
  totalCount: (json['total_count'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$$NotificationListResponseImplToJson(
  _$NotificationListResponseImpl instance,
) => <String, dynamic>{
  'notifications': instance.notifications,
  'total_count': instance.totalCount,
};

_$WinningResultImpl _$$WinningResultImplFromJson(Map<String, dynamic> json) =>
    _$WinningResultImpl(
      id: (json['id'] as num).toInt(),
      recommendationId: (json['recommendation_id'] as num).toInt(),
      drawNo: (json['draw_no'] as num).toInt(),
      matchedNumbers: (json['matched_numbers'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      matchedCount: (json['matched_count'] as num).toInt(),
      bonusMatched: json['bonus_matched'] as bool,
      prizeRank: (json['prize_rank'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$WinningResultImplToJson(_$WinningResultImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'recommendation_id': instance.recommendationId,
      'draw_no': instance.drawNo,
      'matched_numbers': instance.matchedNumbers,
      'matched_count': instance.matchedCount,
      'bonus_matched': instance.bonusMatched,
      'prize_rank': instance.prizeRank,
    };

_$WinningListResponseImpl _$$WinningListResponseImplFromJson(
  Map<String, dynamic> json,
) => _$WinningListResponseImpl(
  winnings:
      (json['winnings'] as List<dynamic>?)
          ?.map((e) => WinningResult.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <WinningResult>[],
  totalCount: (json['total_count'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$$WinningListResponseImplToJson(
  _$WinningListResponseImpl instance,
) => <String, dynamic>{
  'winnings': instance.winnings,
  'total_count': instance.totalCount,
};

_$UnreadWinImpl _$$UnreadWinImplFromJson(Map<String, dynamic> json) =>
    _$UnreadWinImpl(
      id: (json['id'] as num).toInt(),
      recommendationId: (json['recommendation_id'] as num).toInt(),
      drawNo: (json['draw_no'] as num).toInt(),
      matchedNumbers: (json['matched_numbers'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      matchedCount: (json['matched_count'] as num).toInt(),
      bonusMatched: json['bonus_matched'] as bool,
      prizeRank: (json['prize_rank'] as num).toInt(),
      isNotified: json['is_notified'] as bool? ?? false,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$$UnreadWinImplToJson(_$UnreadWinImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'recommendation_id': instance.recommendationId,
      'draw_no': instance.drawNo,
      'matched_numbers': instance.matchedNumbers,
      'matched_count': instance.matchedCount,
      'bonus_matched': instance.bonusMatched,
      'prize_rank': instance.prizeRank,
      'is_notified': instance.isNotified,
      'created_at': instance.createdAt,
    };

_$UnreadWinsResponseImpl _$$UnreadWinsResponseImplFromJson(
  Map<String, dynamic> json,
) => _$UnreadWinsResponseImpl(
  totalCount: (json['total_count'] as num?)?.toInt() ?? 0,
  wins:
      (json['wins'] as List<dynamic>?)
          ?.map((e) => UnreadWin.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <UnreadWin>[],
);

Map<String, dynamic> _$$UnreadWinsResponseImplToJson(
  _$UnreadWinsResponseImpl instance,
) => <String, dynamic>{
  'total_count': instance.totalCount,
  'wins': instance.wins,
};

_$DeviceTokenRequestImpl _$$DeviceTokenRequestImplFromJson(
  Map<String, dynamic> json,
) => _$DeviceTokenRequestImpl(
  token: json['token'] as String,
  platform: json['platform'] as String,
);

Map<String, dynamic> _$$DeviceTokenRequestImplToJson(
  _$DeviceTokenRequestImpl instance,
) => <String, dynamic>{'token': instance.token, 'platform': instance.platform};
