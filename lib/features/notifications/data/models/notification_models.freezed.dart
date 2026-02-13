// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AppNotification _$AppNotificationFromJson(Map<String, dynamic> json) {
  return _AppNotification.fromJson(json);
}

/// @nodoc
mixin _$AppNotification {
  int get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;

  /// Serializes this AppNotification to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppNotification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppNotificationCopyWith<AppNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppNotificationCopyWith<$Res> {
  factory $AppNotificationCopyWith(
    AppNotification value,
    $Res Function(AppNotification) then,
  ) = _$AppNotificationCopyWithImpl<$Res, AppNotification>;
  @useResult
  $Res call({
    int id,
    String type,
    String title,
    String body,
    String status,
    @JsonKey(name: 'created_at') String createdAt,
  });
}

/// @nodoc
class _$AppNotificationCopyWithImpl<$Res, $Val extends AppNotification>
    implements $AppNotificationCopyWith<$Res> {
  _$AppNotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppNotification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? title = null,
    Object? body = null,
    Object? status = null,
    Object? createdAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            body: null == body
                ? _value.body
                : body // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AppNotificationImplCopyWith<$Res>
    implements $AppNotificationCopyWith<$Res> {
  factory _$$AppNotificationImplCopyWith(
    _$AppNotificationImpl value,
    $Res Function(_$AppNotificationImpl) then,
  ) = __$$AppNotificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String type,
    String title,
    String body,
    String status,
    @JsonKey(name: 'created_at') String createdAt,
  });
}

/// @nodoc
class __$$AppNotificationImplCopyWithImpl<$Res>
    extends _$AppNotificationCopyWithImpl<$Res, _$AppNotificationImpl>
    implements _$$AppNotificationImplCopyWith<$Res> {
  __$$AppNotificationImplCopyWithImpl(
    _$AppNotificationImpl _value,
    $Res Function(_$AppNotificationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppNotification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? title = null,
    Object? body = null,
    Object? status = null,
    Object? createdAt = null,
  }) {
    return _then(
      _$AppNotificationImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        body: null == body
            ? _value.body
            : body // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AppNotificationImpl implements _AppNotification {
  const _$AppNotificationImpl({
    required this.id,
    required this.type,
    required this.title,
    required this.body,
    required this.status,
    @JsonKey(name: 'created_at') required this.createdAt,
  });

  factory _$AppNotificationImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppNotificationImplFromJson(json);

  @override
  final int id;
  @override
  final String type;
  @override
  final String title;
  @override
  final String body;
  @override
  final String status;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;

  @override
  String toString() {
    return 'AppNotification(id: $id, type: $type, title: $title, body: $body, status: $status, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppNotificationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, type, title, body, status, createdAt);

  /// Create a copy of AppNotification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppNotificationImplCopyWith<_$AppNotificationImpl> get copyWith =>
      __$$AppNotificationImplCopyWithImpl<_$AppNotificationImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AppNotificationImplToJson(this);
  }
}

abstract class _AppNotification implements AppNotification {
  const factory _AppNotification({
    required final int id,
    required final String type,
    required final String title,
    required final String body,
    required final String status,
    @JsonKey(name: 'created_at') required final String createdAt,
  }) = _$AppNotificationImpl;

  factory _AppNotification.fromJson(Map<String, dynamic> json) =
      _$AppNotificationImpl.fromJson;

  @override
  int get id;
  @override
  String get type;
  @override
  String get title;
  @override
  String get body;
  @override
  String get status;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;

  /// Create a copy of AppNotification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppNotificationImplCopyWith<_$AppNotificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NotificationListResponse _$NotificationListResponseFromJson(
  Map<String, dynamic> json,
) {
  return _NotificationListResponse.fromJson(json);
}

/// @nodoc
mixin _$NotificationListResponse {
  List<AppNotification> get notifications => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_count')
  int get totalCount => throw _privateConstructorUsedError;

  /// Serializes this NotificationListResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NotificationListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationListResponseCopyWith<NotificationListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationListResponseCopyWith<$Res> {
  factory $NotificationListResponseCopyWith(
    NotificationListResponse value,
    $Res Function(NotificationListResponse) then,
  ) = _$NotificationListResponseCopyWithImpl<$Res, NotificationListResponse>;
  @useResult
  $Res call({
    List<AppNotification> notifications,
    @JsonKey(name: 'total_count') int totalCount,
  });
}

/// @nodoc
class _$NotificationListResponseCopyWithImpl<
  $Res,
  $Val extends NotificationListResponse
>
    implements $NotificationListResponseCopyWith<$Res> {
  _$NotificationListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? notifications = null, Object? totalCount = null}) {
    return _then(
      _value.copyWith(
            notifications: null == notifications
                ? _value.notifications
                : notifications // ignore: cast_nullable_to_non_nullable
                      as List<AppNotification>,
            totalCount: null == totalCount
                ? _value.totalCount
                : totalCount // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NotificationListResponseImplCopyWith<$Res>
    implements $NotificationListResponseCopyWith<$Res> {
  factory _$$NotificationListResponseImplCopyWith(
    _$NotificationListResponseImpl value,
    $Res Function(_$NotificationListResponseImpl) then,
  ) = __$$NotificationListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<AppNotification> notifications,
    @JsonKey(name: 'total_count') int totalCount,
  });
}

/// @nodoc
class __$$NotificationListResponseImplCopyWithImpl<$Res>
    extends
        _$NotificationListResponseCopyWithImpl<
          $Res,
          _$NotificationListResponseImpl
        >
    implements _$$NotificationListResponseImplCopyWith<$Res> {
  __$$NotificationListResponseImplCopyWithImpl(
    _$NotificationListResponseImpl _value,
    $Res Function(_$NotificationListResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotificationListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? notifications = null, Object? totalCount = null}) {
    return _then(
      _$NotificationListResponseImpl(
        notifications: null == notifications
            ? _value._notifications
            : notifications // ignore: cast_nullable_to_non_nullable
                  as List<AppNotification>,
        totalCount: null == totalCount
            ? _value.totalCount
            : totalCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationListResponseImpl implements _NotificationListResponse {
  const _$NotificationListResponseImpl({
    required final List<AppNotification> notifications,
    @JsonKey(name: 'total_count') required this.totalCount,
  }) : _notifications = notifications;

  factory _$NotificationListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationListResponseImplFromJson(json);

  final List<AppNotification> _notifications;
  @override
  List<AppNotification> get notifications {
    if (_notifications is EqualUnmodifiableListView) return _notifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notifications);
  }

  @override
  @JsonKey(name: 'total_count')
  final int totalCount;

  @override
  String toString() {
    return 'NotificationListResponse(notifications: $notifications, totalCount: $totalCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationListResponseImpl &&
            const DeepCollectionEquality().equals(
              other._notifications,
              _notifications,
            ) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_notifications),
    totalCount,
  );

  /// Create a copy of NotificationListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationListResponseImplCopyWith<_$NotificationListResponseImpl>
  get copyWith =>
      __$$NotificationListResponseImplCopyWithImpl<
        _$NotificationListResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationListResponseImplToJson(this);
  }
}

abstract class _NotificationListResponse implements NotificationListResponse {
  const factory _NotificationListResponse({
    required final List<AppNotification> notifications,
    @JsonKey(name: 'total_count') required final int totalCount,
  }) = _$NotificationListResponseImpl;

  factory _NotificationListResponse.fromJson(Map<String, dynamic> json) =
      _$NotificationListResponseImpl.fromJson;

  @override
  List<AppNotification> get notifications;
  @override
  @JsonKey(name: 'total_count')
  int get totalCount;

  /// Create a copy of NotificationListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationListResponseImplCopyWith<_$NotificationListResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

WinningResult _$WinningResultFromJson(Map<String, dynamic> json) {
  return _WinningResult.fromJson(json);
}

/// @nodoc
mixin _$WinningResult {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'recommendation_id')
  int get recommendationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'draw_no')
  int get drawNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'matched_numbers')
  List<int> get matchedNumbers => throw _privateConstructorUsedError;
  @JsonKey(name: 'matched_count')
  int get matchedCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'bonus_matched')
  bool get bonusMatched => throw _privateConstructorUsedError;
  @JsonKey(name: 'prize_rank')
  int? get prizeRank => throw _privateConstructorUsedError;

  /// Serializes this WinningResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WinningResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WinningResultCopyWith<WinningResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WinningResultCopyWith<$Res> {
  factory $WinningResultCopyWith(
    WinningResult value,
    $Res Function(WinningResult) then,
  ) = _$WinningResultCopyWithImpl<$Res, WinningResult>;
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'recommendation_id') int recommendationId,
    @JsonKey(name: 'draw_no') int drawNo,
    @JsonKey(name: 'matched_numbers') List<int> matchedNumbers,
    @JsonKey(name: 'matched_count') int matchedCount,
    @JsonKey(name: 'bonus_matched') bool bonusMatched,
    @JsonKey(name: 'prize_rank') int? prizeRank,
  });
}

/// @nodoc
class _$WinningResultCopyWithImpl<$Res, $Val extends WinningResult>
    implements $WinningResultCopyWith<$Res> {
  _$WinningResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WinningResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? recommendationId = null,
    Object? drawNo = null,
    Object? matchedNumbers = null,
    Object? matchedCount = null,
    Object? bonusMatched = null,
    Object? prizeRank = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            recommendationId: null == recommendationId
                ? _value.recommendationId
                : recommendationId // ignore: cast_nullable_to_non_nullable
                      as int,
            drawNo: null == drawNo
                ? _value.drawNo
                : drawNo // ignore: cast_nullable_to_non_nullable
                      as int,
            matchedNumbers: null == matchedNumbers
                ? _value.matchedNumbers
                : matchedNumbers // ignore: cast_nullable_to_non_nullable
                      as List<int>,
            matchedCount: null == matchedCount
                ? _value.matchedCount
                : matchedCount // ignore: cast_nullable_to_non_nullable
                      as int,
            bonusMatched: null == bonusMatched
                ? _value.bonusMatched
                : bonusMatched // ignore: cast_nullable_to_non_nullable
                      as bool,
            prizeRank: freezed == prizeRank
                ? _value.prizeRank
                : prizeRank // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WinningResultImplCopyWith<$Res>
    implements $WinningResultCopyWith<$Res> {
  factory _$$WinningResultImplCopyWith(
    _$WinningResultImpl value,
    $Res Function(_$WinningResultImpl) then,
  ) = __$$WinningResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'recommendation_id') int recommendationId,
    @JsonKey(name: 'draw_no') int drawNo,
    @JsonKey(name: 'matched_numbers') List<int> matchedNumbers,
    @JsonKey(name: 'matched_count') int matchedCount,
    @JsonKey(name: 'bonus_matched') bool bonusMatched,
    @JsonKey(name: 'prize_rank') int? prizeRank,
  });
}

/// @nodoc
class __$$WinningResultImplCopyWithImpl<$Res>
    extends _$WinningResultCopyWithImpl<$Res, _$WinningResultImpl>
    implements _$$WinningResultImplCopyWith<$Res> {
  __$$WinningResultImplCopyWithImpl(
    _$WinningResultImpl _value,
    $Res Function(_$WinningResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WinningResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? recommendationId = null,
    Object? drawNo = null,
    Object? matchedNumbers = null,
    Object? matchedCount = null,
    Object? bonusMatched = null,
    Object? prizeRank = freezed,
  }) {
    return _then(
      _$WinningResultImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        recommendationId: null == recommendationId
            ? _value.recommendationId
            : recommendationId // ignore: cast_nullable_to_non_nullable
                  as int,
        drawNo: null == drawNo
            ? _value.drawNo
            : drawNo // ignore: cast_nullable_to_non_nullable
                  as int,
        matchedNumbers: null == matchedNumbers
            ? _value._matchedNumbers
            : matchedNumbers // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        matchedCount: null == matchedCount
            ? _value.matchedCount
            : matchedCount // ignore: cast_nullable_to_non_nullable
                  as int,
        bonusMatched: null == bonusMatched
            ? _value.bonusMatched
            : bonusMatched // ignore: cast_nullable_to_non_nullable
                  as bool,
        prizeRank: freezed == prizeRank
            ? _value.prizeRank
            : prizeRank // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WinningResultImpl implements _WinningResult {
  const _$WinningResultImpl({
    required this.id,
    @JsonKey(name: 'recommendation_id') required this.recommendationId,
    @JsonKey(name: 'draw_no') required this.drawNo,
    @JsonKey(name: 'matched_numbers') required final List<int> matchedNumbers,
    @JsonKey(name: 'matched_count') required this.matchedCount,
    @JsonKey(name: 'bonus_matched') required this.bonusMatched,
    @JsonKey(name: 'prize_rank') this.prizeRank,
  }) : _matchedNumbers = matchedNumbers;

  factory _$WinningResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$WinningResultImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'recommendation_id')
  final int recommendationId;
  @override
  @JsonKey(name: 'draw_no')
  final int drawNo;
  final List<int> _matchedNumbers;
  @override
  @JsonKey(name: 'matched_numbers')
  List<int> get matchedNumbers {
    if (_matchedNumbers is EqualUnmodifiableListView) return _matchedNumbers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_matchedNumbers);
  }

  @override
  @JsonKey(name: 'matched_count')
  final int matchedCount;
  @override
  @JsonKey(name: 'bonus_matched')
  final bool bonusMatched;
  @override
  @JsonKey(name: 'prize_rank')
  final int? prizeRank;

  @override
  String toString() {
    return 'WinningResult(id: $id, recommendationId: $recommendationId, drawNo: $drawNo, matchedNumbers: $matchedNumbers, matchedCount: $matchedCount, bonusMatched: $bonusMatched, prizeRank: $prizeRank)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WinningResultImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.recommendationId, recommendationId) ||
                other.recommendationId == recommendationId) &&
            (identical(other.drawNo, drawNo) || other.drawNo == drawNo) &&
            const DeepCollectionEquality().equals(
              other._matchedNumbers,
              _matchedNumbers,
            ) &&
            (identical(other.matchedCount, matchedCount) ||
                other.matchedCount == matchedCount) &&
            (identical(other.bonusMatched, bonusMatched) ||
                other.bonusMatched == bonusMatched) &&
            (identical(other.prizeRank, prizeRank) ||
                other.prizeRank == prizeRank));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    recommendationId,
    drawNo,
    const DeepCollectionEquality().hash(_matchedNumbers),
    matchedCount,
    bonusMatched,
    prizeRank,
  );

  /// Create a copy of WinningResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WinningResultImplCopyWith<_$WinningResultImpl> get copyWith =>
      __$$WinningResultImplCopyWithImpl<_$WinningResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WinningResultImplToJson(this);
  }
}

abstract class _WinningResult implements WinningResult {
  const factory _WinningResult({
    required final int id,
    @JsonKey(name: 'recommendation_id') required final int recommendationId,
    @JsonKey(name: 'draw_no') required final int drawNo,
    @JsonKey(name: 'matched_numbers') required final List<int> matchedNumbers,
    @JsonKey(name: 'matched_count') required final int matchedCount,
    @JsonKey(name: 'bonus_matched') required final bool bonusMatched,
    @JsonKey(name: 'prize_rank') final int? prizeRank,
  }) = _$WinningResultImpl;

  factory _WinningResult.fromJson(Map<String, dynamic> json) =
      _$WinningResultImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'recommendation_id')
  int get recommendationId;
  @override
  @JsonKey(name: 'draw_no')
  int get drawNo;
  @override
  @JsonKey(name: 'matched_numbers')
  List<int> get matchedNumbers;
  @override
  @JsonKey(name: 'matched_count')
  int get matchedCount;
  @override
  @JsonKey(name: 'bonus_matched')
  bool get bonusMatched;
  @override
  @JsonKey(name: 'prize_rank')
  int? get prizeRank;

  /// Create a copy of WinningResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WinningResultImplCopyWith<_$WinningResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WinningListResponse _$WinningListResponseFromJson(Map<String, dynamic> json) {
  return _WinningListResponse.fromJson(json);
}

/// @nodoc
mixin _$WinningListResponse {
  List<WinningResult> get winnings => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_count')
  int get totalCount => throw _privateConstructorUsedError;

  /// Serializes this WinningListResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WinningListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WinningListResponseCopyWith<WinningListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WinningListResponseCopyWith<$Res> {
  factory $WinningListResponseCopyWith(
    WinningListResponse value,
    $Res Function(WinningListResponse) then,
  ) = _$WinningListResponseCopyWithImpl<$Res, WinningListResponse>;
  @useResult
  $Res call({
    List<WinningResult> winnings,
    @JsonKey(name: 'total_count') int totalCount,
  });
}

/// @nodoc
class _$WinningListResponseCopyWithImpl<$Res, $Val extends WinningListResponse>
    implements $WinningListResponseCopyWith<$Res> {
  _$WinningListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WinningListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? winnings = null, Object? totalCount = null}) {
    return _then(
      _value.copyWith(
            winnings: null == winnings
                ? _value.winnings
                : winnings // ignore: cast_nullable_to_non_nullable
                      as List<WinningResult>,
            totalCount: null == totalCount
                ? _value.totalCount
                : totalCount // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WinningListResponseImplCopyWith<$Res>
    implements $WinningListResponseCopyWith<$Res> {
  factory _$$WinningListResponseImplCopyWith(
    _$WinningListResponseImpl value,
    $Res Function(_$WinningListResponseImpl) then,
  ) = __$$WinningListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<WinningResult> winnings,
    @JsonKey(name: 'total_count') int totalCount,
  });
}

/// @nodoc
class __$$WinningListResponseImplCopyWithImpl<$Res>
    extends _$WinningListResponseCopyWithImpl<$Res, _$WinningListResponseImpl>
    implements _$$WinningListResponseImplCopyWith<$Res> {
  __$$WinningListResponseImplCopyWithImpl(
    _$WinningListResponseImpl _value,
    $Res Function(_$WinningListResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WinningListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? winnings = null, Object? totalCount = null}) {
    return _then(
      _$WinningListResponseImpl(
        winnings: null == winnings
            ? _value._winnings
            : winnings // ignore: cast_nullable_to_non_nullable
                  as List<WinningResult>,
        totalCount: null == totalCount
            ? _value.totalCount
            : totalCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WinningListResponseImpl implements _WinningListResponse {
  const _$WinningListResponseImpl({
    required final List<WinningResult> winnings,
    @JsonKey(name: 'total_count') required this.totalCount,
  }) : _winnings = winnings;

  factory _$WinningListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$WinningListResponseImplFromJson(json);

  final List<WinningResult> _winnings;
  @override
  List<WinningResult> get winnings {
    if (_winnings is EqualUnmodifiableListView) return _winnings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_winnings);
  }

  @override
  @JsonKey(name: 'total_count')
  final int totalCount;

  @override
  String toString() {
    return 'WinningListResponse(winnings: $winnings, totalCount: $totalCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WinningListResponseImpl &&
            const DeepCollectionEquality().equals(other._winnings, _winnings) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_winnings),
    totalCount,
  );

  /// Create a copy of WinningListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WinningListResponseImplCopyWith<_$WinningListResponseImpl> get copyWith =>
      __$$WinningListResponseImplCopyWithImpl<_$WinningListResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$WinningListResponseImplToJson(this);
  }
}

abstract class _WinningListResponse implements WinningListResponse {
  const factory _WinningListResponse({
    required final List<WinningResult> winnings,
    @JsonKey(name: 'total_count') required final int totalCount,
  }) = _$WinningListResponseImpl;

  factory _WinningListResponse.fromJson(Map<String, dynamic> json) =
      _$WinningListResponseImpl.fromJson;

  @override
  List<WinningResult> get winnings;
  @override
  @JsonKey(name: 'total_count')
  int get totalCount;

  /// Create a copy of WinningListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WinningListResponseImplCopyWith<_$WinningListResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DeviceTokenRequest _$DeviceTokenRequestFromJson(Map<String, dynamic> json) {
  return _DeviceTokenRequest.fromJson(json);
}

/// @nodoc
mixin _$DeviceTokenRequest {
  String get token => throw _privateConstructorUsedError;
  String get platform => throw _privateConstructorUsedError;

  /// Serializes this DeviceTokenRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeviceTokenRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeviceTokenRequestCopyWith<DeviceTokenRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceTokenRequestCopyWith<$Res> {
  factory $DeviceTokenRequestCopyWith(
    DeviceTokenRequest value,
    $Res Function(DeviceTokenRequest) then,
  ) = _$DeviceTokenRequestCopyWithImpl<$Res, DeviceTokenRequest>;
  @useResult
  $Res call({String token, String platform});
}

/// @nodoc
class _$DeviceTokenRequestCopyWithImpl<$Res, $Val extends DeviceTokenRequest>
    implements $DeviceTokenRequestCopyWith<$Res> {
  _$DeviceTokenRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeviceTokenRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? token = null, Object? platform = null}) {
    return _then(
      _value.copyWith(
            token: null == token
                ? _value.token
                : token // ignore: cast_nullable_to_non_nullable
                      as String,
            platform: null == platform
                ? _value.platform
                : platform // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DeviceTokenRequestImplCopyWith<$Res>
    implements $DeviceTokenRequestCopyWith<$Res> {
  factory _$$DeviceTokenRequestImplCopyWith(
    _$DeviceTokenRequestImpl value,
    $Res Function(_$DeviceTokenRequestImpl) then,
  ) = __$$DeviceTokenRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String token, String platform});
}

/// @nodoc
class __$$DeviceTokenRequestImplCopyWithImpl<$Res>
    extends _$DeviceTokenRequestCopyWithImpl<$Res, _$DeviceTokenRequestImpl>
    implements _$$DeviceTokenRequestImplCopyWith<$Res> {
  __$$DeviceTokenRequestImplCopyWithImpl(
    _$DeviceTokenRequestImpl _value,
    $Res Function(_$DeviceTokenRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DeviceTokenRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? token = null, Object? platform = null}) {
    return _then(
      _$DeviceTokenRequestImpl(
        token: null == token
            ? _value.token
            : token // ignore: cast_nullable_to_non_nullable
                  as String,
        platform: null == platform
            ? _value.platform
            : platform // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceTokenRequestImpl implements _DeviceTokenRequest {
  const _$DeviceTokenRequestImpl({required this.token, required this.platform});

  factory _$DeviceTokenRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeviceTokenRequestImplFromJson(json);

  @override
  final String token;
  @override
  final String platform;

  @override
  String toString() {
    return 'DeviceTokenRequest(token: $token, platform: $platform)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceTokenRequestImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.platform, platform) ||
                other.platform == platform));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token, platform);

  /// Create a copy of DeviceTokenRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceTokenRequestImplCopyWith<_$DeviceTokenRequestImpl> get copyWith =>
      __$$DeviceTokenRequestImplCopyWithImpl<_$DeviceTokenRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceTokenRequestImplToJson(this);
  }
}

abstract class _DeviceTokenRequest implements DeviceTokenRequest {
  const factory _DeviceTokenRequest({
    required final String token,
    required final String platform,
  }) = _$DeviceTokenRequestImpl;

  factory _DeviceTokenRequest.fromJson(Map<String, dynamic> json) =
      _$DeviceTokenRequestImpl.fromJson;

  @override
  String get token;
  @override
  String get platform;

  /// Create a copy of DeviceTokenRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeviceTokenRequestImplCopyWith<_$DeviceTokenRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
