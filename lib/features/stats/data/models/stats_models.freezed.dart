// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stats_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

NumberStat _$NumberStatFromJson(Map<String, dynamic> json) {
  return _NumberStat.fromJson(json);
}

/// @nodoc
mixin _$NumberStat {
  int get number => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_count')
  int get totalCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'bonus_count')
  int get bonusCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_draw_no')
  int get lastDrawNo => throw _privateConstructorUsedError;

  /// Serializes this NumberStat to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NumberStat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NumberStatCopyWith<NumberStat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NumberStatCopyWith<$Res> {
  factory $NumberStatCopyWith(
    NumberStat value,
    $Res Function(NumberStat) then,
  ) = _$NumberStatCopyWithImpl<$Res, NumberStat>;
  @useResult
  $Res call({
    int number,
    @JsonKey(name: 'total_count') int totalCount,
    @JsonKey(name: 'bonus_count') int bonusCount,
    @JsonKey(name: 'last_draw_no') int lastDrawNo,
  });
}

/// @nodoc
class _$NumberStatCopyWithImpl<$Res, $Val extends NumberStat>
    implements $NumberStatCopyWith<$Res> {
  _$NumberStatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NumberStat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? totalCount = null,
    Object? bonusCount = null,
    Object? lastDrawNo = null,
  }) {
    return _then(
      _value.copyWith(
            number: null == number
                ? _value.number
                : number // ignore: cast_nullable_to_non_nullable
                      as int,
            totalCount: null == totalCount
                ? _value.totalCount
                : totalCount // ignore: cast_nullable_to_non_nullable
                      as int,
            bonusCount: null == bonusCount
                ? _value.bonusCount
                : bonusCount // ignore: cast_nullable_to_non_nullable
                      as int,
            lastDrawNo: null == lastDrawNo
                ? _value.lastDrawNo
                : lastDrawNo // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NumberStatImplCopyWith<$Res>
    implements $NumberStatCopyWith<$Res> {
  factory _$$NumberStatImplCopyWith(
    _$NumberStatImpl value,
    $Res Function(_$NumberStatImpl) then,
  ) = __$$NumberStatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int number,
    @JsonKey(name: 'total_count') int totalCount,
    @JsonKey(name: 'bonus_count') int bonusCount,
    @JsonKey(name: 'last_draw_no') int lastDrawNo,
  });
}

/// @nodoc
class __$$NumberStatImplCopyWithImpl<$Res>
    extends _$NumberStatCopyWithImpl<$Res, _$NumberStatImpl>
    implements _$$NumberStatImplCopyWith<$Res> {
  __$$NumberStatImplCopyWithImpl(
    _$NumberStatImpl _value,
    $Res Function(_$NumberStatImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NumberStat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? totalCount = null,
    Object? bonusCount = null,
    Object? lastDrawNo = null,
  }) {
    return _then(
      _$NumberStatImpl(
        number: null == number
            ? _value.number
            : number // ignore: cast_nullable_to_non_nullable
                  as int,
        totalCount: null == totalCount
            ? _value.totalCount
            : totalCount // ignore: cast_nullable_to_non_nullable
                  as int,
        bonusCount: null == bonusCount
            ? _value.bonusCount
            : bonusCount // ignore: cast_nullable_to_non_nullable
                  as int,
        lastDrawNo: null == lastDrawNo
            ? _value.lastDrawNo
            : lastDrawNo // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$NumberStatImpl implements _NumberStat {
  const _$NumberStatImpl({
    required this.number,
    @JsonKey(name: 'total_count') required this.totalCount,
    @JsonKey(name: 'bonus_count') this.bonusCount = 0,
    @JsonKey(name: 'last_draw_no') this.lastDrawNo = 0,
  });

  factory _$NumberStatImpl.fromJson(Map<String, dynamic> json) =>
      _$$NumberStatImplFromJson(json);

  @override
  final int number;
  @override
  @JsonKey(name: 'total_count')
  final int totalCount;
  @override
  @JsonKey(name: 'bonus_count')
  final int bonusCount;
  @override
  @JsonKey(name: 'last_draw_no')
  final int lastDrawNo;

  @override
  String toString() {
    return 'NumberStat(number: $number, totalCount: $totalCount, bonusCount: $bonusCount, lastDrawNo: $lastDrawNo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NumberStatImpl &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.bonusCount, bonusCount) ||
                other.bonusCount == bonusCount) &&
            (identical(other.lastDrawNo, lastDrawNo) ||
                other.lastDrawNo == lastDrawNo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, number, totalCount, bonusCount, lastDrawNo);

  /// Create a copy of NumberStat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NumberStatImplCopyWith<_$NumberStatImpl> get copyWith =>
      __$$NumberStatImplCopyWithImpl<_$NumberStatImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NumberStatImplToJson(this);
  }
}

abstract class _NumberStat implements NumberStat {
  const factory _NumberStat({
    required final int number,
    @JsonKey(name: 'total_count') required final int totalCount,
    @JsonKey(name: 'bonus_count') final int bonusCount,
    @JsonKey(name: 'last_draw_no') final int lastDrawNo,
  }) = _$NumberStatImpl;

  factory _NumberStat.fromJson(Map<String, dynamic> json) =
      _$NumberStatImpl.fromJson;

  @override
  int get number;
  @override
  @JsonKey(name: 'total_count')
  int get totalCount;
  @override
  @JsonKey(name: 'bonus_count')
  int get bonusCount;
  @override
  @JsonKey(name: 'last_draw_no')
  int get lastDrawNo;

  /// Create a copy of NumberStat
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NumberStatImplCopyWith<_$NumberStatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReappearStat _$ReappearStatFromJson(Map<String, dynamic> json) {
  return _ReappearStat.fromJson(json);
}

/// @nodoc
mixin _$ReappearStat {
  int get number => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_appear')
  int get totalAppear => throw _privateConstructorUsedError;
  @JsonKey(name: 'reappear_count')
  int get reappearCount => throw _privateConstructorUsedError;
  double get probability => throw _privateConstructorUsedError;

  /// Serializes this ReappearStat to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReappearStat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReappearStatCopyWith<ReappearStat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReappearStatCopyWith<$Res> {
  factory $ReappearStatCopyWith(
    ReappearStat value,
    $Res Function(ReappearStat) then,
  ) = _$ReappearStatCopyWithImpl<$Res, ReappearStat>;
  @useResult
  $Res call({
    int number,
    @JsonKey(name: 'total_appear') int totalAppear,
    @JsonKey(name: 'reappear_count') int reappearCount,
    double probability,
  });
}

/// @nodoc
class _$ReappearStatCopyWithImpl<$Res, $Val extends ReappearStat>
    implements $ReappearStatCopyWith<$Res> {
  _$ReappearStatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReappearStat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? totalAppear = null,
    Object? reappearCount = null,
    Object? probability = null,
  }) {
    return _then(
      _value.copyWith(
            number: null == number
                ? _value.number
                : number // ignore: cast_nullable_to_non_nullable
                      as int,
            totalAppear: null == totalAppear
                ? _value.totalAppear
                : totalAppear // ignore: cast_nullable_to_non_nullable
                      as int,
            reappearCount: null == reappearCount
                ? _value.reappearCount
                : reappearCount // ignore: cast_nullable_to_non_nullable
                      as int,
            probability: null == probability
                ? _value.probability
                : probability // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ReappearStatImplCopyWith<$Res>
    implements $ReappearStatCopyWith<$Res> {
  factory _$$ReappearStatImplCopyWith(
    _$ReappearStatImpl value,
    $Res Function(_$ReappearStatImpl) then,
  ) = __$$ReappearStatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int number,
    @JsonKey(name: 'total_appear') int totalAppear,
    @JsonKey(name: 'reappear_count') int reappearCount,
    double probability,
  });
}

/// @nodoc
class __$$ReappearStatImplCopyWithImpl<$Res>
    extends _$ReappearStatCopyWithImpl<$Res, _$ReappearStatImpl>
    implements _$$ReappearStatImplCopyWith<$Res> {
  __$$ReappearStatImplCopyWithImpl(
    _$ReappearStatImpl _value,
    $Res Function(_$ReappearStatImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReappearStat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? totalAppear = null,
    Object? reappearCount = null,
    Object? probability = null,
  }) {
    return _then(
      _$ReappearStatImpl(
        number: null == number
            ? _value.number
            : number // ignore: cast_nullable_to_non_nullable
                  as int,
        totalAppear: null == totalAppear
            ? _value.totalAppear
            : totalAppear // ignore: cast_nullable_to_non_nullable
                  as int,
        reappearCount: null == reappearCount
            ? _value.reappearCount
            : reappearCount // ignore: cast_nullable_to_non_nullable
                  as int,
        probability: null == probability
            ? _value.probability
            : probability // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ReappearStatImpl implements _ReappearStat {
  const _$ReappearStatImpl({
    required this.number,
    @JsonKey(name: 'total_appear') required this.totalAppear,
    @JsonKey(name: 'reappear_count') required this.reappearCount,
    required this.probability,
  });

  factory _$ReappearStatImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReappearStatImplFromJson(json);

  @override
  final int number;
  @override
  @JsonKey(name: 'total_appear')
  final int totalAppear;
  @override
  @JsonKey(name: 'reappear_count')
  final int reappearCount;
  @override
  final double probability;

  @override
  String toString() {
    return 'ReappearStat(number: $number, totalAppear: $totalAppear, reappearCount: $reappearCount, probability: $probability)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReappearStatImpl &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.totalAppear, totalAppear) ||
                other.totalAppear == totalAppear) &&
            (identical(other.reappearCount, reappearCount) ||
                other.reappearCount == reappearCount) &&
            (identical(other.probability, probability) ||
                other.probability == probability));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, number, totalAppear, reappearCount, probability);

  /// Create a copy of ReappearStat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReappearStatImplCopyWith<_$ReappearStatImpl> get copyWith =>
      __$$ReappearStatImplCopyWithImpl<_$ReappearStatImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReappearStatImplToJson(this);
  }
}

abstract class _ReappearStat implements ReappearStat {
  const factory _ReappearStat({
    required final int number,
    @JsonKey(name: 'total_appear') required final int totalAppear,
    @JsonKey(name: 'reappear_count') required final int reappearCount,
    required final double probability,
  }) = _$ReappearStatImpl;

  factory _ReappearStat.fromJson(Map<String, dynamic> json) =
      _$ReappearStatImpl.fromJson;

  @override
  int get number;
  @override
  @JsonKey(name: 'total_appear')
  int get totalAppear;
  @override
  @JsonKey(name: 'reappear_count')
  int get reappearCount;
  @override
  double get probability;

  /// Create a copy of ReappearStat
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReappearStatImplCopyWith<_$ReappearStatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StatsResponse _$StatsResponseFromJson(Map<String, dynamic> json) {
  return _StatsResponse.fromJson(json);
}

/// @nodoc
mixin _$StatsResponse {
  @JsonKey(name: 'number_stats')
  List<NumberStat> get numberStats => throw _privateConstructorUsedError;
  @JsonKey(name: 'reappear_stats')
  List<ReappearStat> get reappearStats => throw _privateConstructorUsedError;
  @JsonKey(name: 'latest_draw_no')
  int get latestDrawNo => throw _privateConstructorUsedError;

  /// Serializes this StatsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StatsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StatsResponseCopyWith<StatsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatsResponseCopyWith<$Res> {
  factory $StatsResponseCopyWith(
    StatsResponse value,
    $Res Function(StatsResponse) then,
  ) = _$StatsResponseCopyWithImpl<$Res, StatsResponse>;
  @useResult
  $Res call({
    @JsonKey(name: 'number_stats') List<NumberStat> numberStats,
    @JsonKey(name: 'reappear_stats') List<ReappearStat> reappearStats,
    @JsonKey(name: 'latest_draw_no') int latestDrawNo,
  });
}

/// @nodoc
class _$StatsResponseCopyWithImpl<$Res, $Val extends StatsResponse>
    implements $StatsResponseCopyWith<$Res> {
  _$StatsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StatsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numberStats = null,
    Object? reappearStats = null,
    Object? latestDrawNo = null,
  }) {
    return _then(
      _value.copyWith(
            numberStats: null == numberStats
                ? _value.numberStats
                : numberStats // ignore: cast_nullable_to_non_nullable
                      as List<NumberStat>,
            reappearStats: null == reappearStats
                ? _value.reappearStats
                : reappearStats // ignore: cast_nullable_to_non_nullable
                      as List<ReappearStat>,
            latestDrawNo: null == latestDrawNo
                ? _value.latestDrawNo
                : latestDrawNo // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StatsResponseImplCopyWith<$Res>
    implements $StatsResponseCopyWith<$Res> {
  factory _$$StatsResponseImplCopyWith(
    _$StatsResponseImpl value,
    $Res Function(_$StatsResponseImpl) then,
  ) = __$$StatsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'number_stats') List<NumberStat> numberStats,
    @JsonKey(name: 'reappear_stats') List<ReappearStat> reappearStats,
    @JsonKey(name: 'latest_draw_no') int latestDrawNo,
  });
}

/// @nodoc
class __$$StatsResponseImplCopyWithImpl<$Res>
    extends _$StatsResponseCopyWithImpl<$Res, _$StatsResponseImpl>
    implements _$$StatsResponseImplCopyWith<$Res> {
  __$$StatsResponseImplCopyWithImpl(
    _$StatsResponseImpl _value,
    $Res Function(_$StatsResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StatsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numberStats = null,
    Object? reappearStats = null,
    Object? latestDrawNo = null,
  }) {
    return _then(
      _$StatsResponseImpl(
        numberStats: null == numberStats
            ? _value._numberStats
            : numberStats // ignore: cast_nullable_to_non_nullable
                  as List<NumberStat>,
        reappearStats: null == reappearStats
            ? _value._reappearStats
            : reappearStats // ignore: cast_nullable_to_non_nullable
                  as List<ReappearStat>,
        latestDrawNo: null == latestDrawNo
            ? _value.latestDrawNo
            : latestDrawNo // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StatsResponseImpl implements _StatsResponse {
  const _$StatsResponseImpl({
    @JsonKey(name: 'number_stats') required final List<NumberStat> numberStats,
    @JsonKey(name: 'reappear_stats')
    required final List<ReappearStat> reappearStats,
    @JsonKey(name: 'latest_draw_no') required this.latestDrawNo,
  }) : _numberStats = numberStats,
       _reappearStats = reappearStats;

  factory _$StatsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatsResponseImplFromJson(json);

  final List<NumberStat> _numberStats;
  @override
  @JsonKey(name: 'number_stats')
  List<NumberStat> get numberStats {
    if (_numberStats is EqualUnmodifiableListView) return _numberStats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_numberStats);
  }

  final List<ReappearStat> _reappearStats;
  @override
  @JsonKey(name: 'reappear_stats')
  List<ReappearStat> get reappearStats {
    if (_reappearStats is EqualUnmodifiableListView) return _reappearStats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reappearStats);
  }

  @override
  @JsonKey(name: 'latest_draw_no')
  final int latestDrawNo;

  @override
  String toString() {
    return 'StatsResponse(numberStats: $numberStats, reappearStats: $reappearStats, latestDrawNo: $latestDrawNo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatsResponseImpl &&
            const DeepCollectionEquality().equals(
              other._numberStats,
              _numberStats,
            ) &&
            const DeepCollectionEquality().equals(
              other._reappearStats,
              _reappearStats,
            ) &&
            (identical(other.latestDrawNo, latestDrawNo) ||
                other.latestDrawNo == latestDrawNo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_numberStats),
    const DeepCollectionEquality().hash(_reappearStats),
    latestDrawNo,
  );

  /// Create a copy of StatsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatsResponseImplCopyWith<_$StatsResponseImpl> get copyWith =>
      __$$StatsResponseImplCopyWithImpl<_$StatsResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatsResponseImplToJson(this);
  }
}

abstract class _StatsResponse implements StatsResponse {
  const factory _StatsResponse({
    @JsonKey(name: 'number_stats') required final List<NumberStat> numberStats,
    @JsonKey(name: 'reappear_stats')
    required final List<ReappearStat> reappearStats,
    @JsonKey(name: 'latest_draw_no') required final int latestDrawNo,
  }) = _$StatsResponseImpl;

  factory _StatsResponse.fromJson(Map<String, dynamic> json) =
      _$StatsResponseImpl.fromJson;

  @override
  @JsonKey(name: 'number_stats')
  List<NumberStat> get numberStats;
  @override
  @JsonKey(name: 'reappear_stats')
  List<ReappearStat> get reappearStats;
  @override
  @JsonKey(name: 'latest_draw_no')
  int get latestDrawNo;

  /// Create a copy of StatsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatsResponseImplCopyWith<_$StatsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NumberStatsResponse _$NumberStatsResponseFromJson(Map<String, dynamic> json) {
  return _NumberStatsResponse.fromJson(json);
}

/// @nodoc
mixin _$NumberStatsResponse {
  @JsonKey(name: 'number_stats')
  List<NumberStat> get numberStats => throw _privateConstructorUsedError;

  /// Serializes this NumberStatsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NumberStatsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NumberStatsResponseCopyWith<NumberStatsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NumberStatsResponseCopyWith<$Res> {
  factory $NumberStatsResponseCopyWith(
    NumberStatsResponse value,
    $Res Function(NumberStatsResponse) then,
  ) = _$NumberStatsResponseCopyWithImpl<$Res, NumberStatsResponse>;
  @useResult
  $Res call({@JsonKey(name: 'number_stats') List<NumberStat> numberStats});
}

/// @nodoc
class _$NumberStatsResponseCopyWithImpl<$Res, $Val extends NumberStatsResponse>
    implements $NumberStatsResponseCopyWith<$Res> {
  _$NumberStatsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NumberStatsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? numberStats = null}) {
    return _then(
      _value.copyWith(
            numberStats: null == numberStats
                ? _value.numberStats
                : numberStats // ignore: cast_nullable_to_non_nullable
                      as List<NumberStat>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NumberStatsResponseImplCopyWith<$Res>
    implements $NumberStatsResponseCopyWith<$Res> {
  factory _$$NumberStatsResponseImplCopyWith(
    _$NumberStatsResponseImpl value,
    $Res Function(_$NumberStatsResponseImpl) then,
  ) = __$$NumberStatsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'number_stats') List<NumberStat> numberStats});
}

/// @nodoc
class __$$NumberStatsResponseImplCopyWithImpl<$Res>
    extends _$NumberStatsResponseCopyWithImpl<$Res, _$NumberStatsResponseImpl>
    implements _$$NumberStatsResponseImplCopyWith<$Res> {
  __$$NumberStatsResponseImplCopyWithImpl(
    _$NumberStatsResponseImpl _value,
    $Res Function(_$NumberStatsResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NumberStatsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? numberStats = null}) {
    return _then(
      _$NumberStatsResponseImpl(
        numberStats: null == numberStats
            ? _value._numberStats
            : numberStats // ignore: cast_nullable_to_non_nullable
                  as List<NumberStat>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$NumberStatsResponseImpl implements _NumberStatsResponse {
  const _$NumberStatsResponseImpl({
    @JsonKey(name: 'number_stats') required final List<NumberStat> numberStats,
  }) : _numberStats = numberStats;

  factory _$NumberStatsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$NumberStatsResponseImplFromJson(json);

  final List<NumberStat> _numberStats;
  @override
  @JsonKey(name: 'number_stats')
  List<NumberStat> get numberStats {
    if (_numberStats is EqualUnmodifiableListView) return _numberStats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_numberStats);
  }

  @override
  String toString() {
    return 'NumberStatsResponse(numberStats: $numberStats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NumberStatsResponseImpl &&
            const DeepCollectionEquality().equals(
              other._numberStats,
              _numberStats,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_numberStats),
  );

  /// Create a copy of NumberStatsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NumberStatsResponseImplCopyWith<_$NumberStatsResponseImpl> get copyWith =>
      __$$NumberStatsResponseImplCopyWithImpl<_$NumberStatsResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$NumberStatsResponseImplToJson(this);
  }
}

abstract class _NumberStatsResponse implements NumberStatsResponse {
  const factory _NumberStatsResponse({
    @JsonKey(name: 'number_stats') required final List<NumberStat> numberStats,
  }) = _$NumberStatsResponseImpl;

  factory _NumberStatsResponse.fromJson(Map<String, dynamic> json) =
      _$NumberStatsResponseImpl.fromJson;

  @override
  @JsonKey(name: 'number_stats')
  List<NumberStat> get numberStats;

  /// Create a copy of NumberStatsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NumberStatsResponseImplCopyWith<_$NumberStatsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FirstLastStat _$FirstLastStatFromJson(Map<String, dynamic> json) {
  return _FirstLastStat.fromJson(json);
}

/// @nodoc
mixin _$FirstLastStat {
  int get number => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  double get probability => throw _privateConstructorUsedError;

  /// Serializes this FirstLastStat to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FirstLastStat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FirstLastStatCopyWith<FirstLastStat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirstLastStatCopyWith<$Res> {
  factory $FirstLastStatCopyWith(
    FirstLastStat value,
    $Res Function(FirstLastStat) then,
  ) = _$FirstLastStatCopyWithImpl<$Res, FirstLastStat>;
  @useResult
  $Res call({int number, int count, double probability});
}

/// @nodoc
class _$FirstLastStatCopyWithImpl<$Res, $Val extends FirstLastStat>
    implements $FirstLastStatCopyWith<$Res> {
  _$FirstLastStatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FirstLastStat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? count = null,
    Object? probability = null,
  }) {
    return _then(
      _value.copyWith(
            number: null == number
                ? _value.number
                : number // ignore: cast_nullable_to_non_nullable
                      as int,
            count: null == count
                ? _value.count
                : count // ignore: cast_nullable_to_non_nullable
                      as int,
            probability: null == probability
                ? _value.probability
                : probability // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FirstLastStatImplCopyWith<$Res>
    implements $FirstLastStatCopyWith<$Res> {
  factory _$$FirstLastStatImplCopyWith(
    _$FirstLastStatImpl value,
    $Res Function(_$FirstLastStatImpl) then,
  ) = __$$FirstLastStatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int number, int count, double probability});
}

/// @nodoc
class __$$FirstLastStatImplCopyWithImpl<$Res>
    extends _$FirstLastStatCopyWithImpl<$Res, _$FirstLastStatImpl>
    implements _$$FirstLastStatImplCopyWith<$Res> {
  __$$FirstLastStatImplCopyWithImpl(
    _$FirstLastStatImpl _value,
    $Res Function(_$FirstLastStatImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FirstLastStat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? count = null,
    Object? probability = null,
  }) {
    return _then(
      _$FirstLastStatImpl(
        number: null == number
            ? _value.number
            : number // ignore: cast_nullable_to_non_nullable
                  as int,
        count: null == count
            ? _value.count
            : count // ignore: cast_nullable_to_non_nullable
                  as int,
        probability: null == probability
            ? _value.probability
            : probability // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FirstLastStatImpl implements _FirstLastStat {
  const _$FirstLastStatImpl({
    required this.number,
    required this.count,
    required this.probability,
  });

  factory _$FirstLastStatImpl.fromJson(Map<String, dynamic> json) =>
      _$$FirstLastStatImplFromJson(json);

  @override
  final int number;
  @override
  final int count;
  @override
  final double probability;

  @override
  String toString() {
    return 'FirstLastStat(number: $number, count: $count, probability: $probability)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirstLastStatImpl &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.probability, probability) ||
                other.probability == probability));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, number, count, probability);

  /// Create a copy of FirstLastStat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FirstLastStatImplCopyWith<_$FirstLastStatImpl> get copyWith =>
      __$$FirstLastStatImplCopyWithImpl<_$FirstLastStatImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FirstLastStatImplToJson(this);
  }
}

abstract class _FirstLastStat implements FirstLastStat {
  const factory _FirstLastStat({
    required final int number,
    required final int count,
    required final double probability,
  }) = _$FirstLastStatImpl;

  factory _FirstLastStat.fromJson(Map<String, dynamic> json) =
      _$FirstLastStatImpl.fromJson;

  @override
  int get number;
  @override
  int get count;
  @override
  double get probability;

  /// Create a copy of FirstLastStat
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FirstLastStatImplCopyWith<_$FirstLastStatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FirstLastResponse _$FirstLastResponseFromJson(Map<String, dynamic> json) {
  return _FirstLastResponse.fromJson(json);
}

/// @nodoc
mixin _$FirstLastResponse {
  @JsonKey(name: 'first_stats')
  List<FirstLastStat> get firstStats => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_stats')
  List<FirstLastStat> get lastStats => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_draws')
  int get totalDraws => throw _privateConstructorUsedError;

  /// Serializes this FirstLastResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FirstLastResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FirstLastResponseCopyWith<FirstLastResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirstLastResponseCopyWith<$Res> {
  factory $FirstLastResponseCopyWith(
    FirstLastResponse value,
    $Res Function(FirstLastResponse) then,
  ) = _$FirstLastResponseCopyWithImpl<$Res, FirstLastResponse>;
  @useResult
  $Res call({
    @JsonKey(name: 'first_stats') List<FirstLastStat> firstStats,
    @JsonKey(name: 'last_stats') List<FirstLastStat> lastStats,
    @JsonKey(name: 'total_draws') int totalDraws,
  });
}

/// @nodoc
class _$FirstLastResponseCopyWithImpl<$Res, $Val extends FirstLastResponse>
    implements $FirstLastResponseCopyWith<$Res> {
  _$FirstLastResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FirstLastResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstStats = null,
    Object? lastStats = null,
    Object? totalDraws = null,
  }) {
    return _then(
      _value.copyWith(
            firstStats: null == firstStats
                ? _value.firstStats
                : firstStats // ignore: cast_nullable_to_non_nullable
                      as List<FirstLastStat>,
            lastStats: null == lastStats
                ? _value.lastStats
                : lastStats // ignore: cast_nullable_to_non_nullable
                      as List<FirstLastStat>,
            totalDraws: null == totalDraws
                ? _value.totalDraws
                : totalDraws // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FirstLastResponseImplCopyWith<$Res>
    implements $FirstLastResponseCopyWith<$Res> {
  factory _$$FirstLastResponseImplCopyWith(
    _$FirstLastResponseImpl value,
    $Res Function(_$FirstLastResponseImpl) then,
  ) = __$$FirstLastResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'first_stats') List<FirstLastStat> firstStats,
    @JsonKey(name: 'last_stats') List<FirstLastStat> lastStats,
    @JsonKey(name: 'total_draws') int totalDraws,
  });
}

/// @nodoc
class __$$FirstLastResponseImplCopyWithImpl<$Res>
    extends _$FirstLastResponseCopyWithImpl<$Res, _$FirstLastResponseImpl>
    implements _$$FirstLastResponseImplCopyWith<$Res> {
  __$$FirstLastResponseImplCopyWithImpl(
    _$FirstLastResponseImpl _value,
    $Res Function(_$FirstLastResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FirstLastResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstStats = null,
    Object? lastStats = null,
    Object? totalDraws = null,
  }) {
    return _then(
      _$FirstLastResponseImpl(
        firstStats: null == firstStats
            ? _value._firstStats
            : firstStats // ignore: cast_nullable_to_non_nullable
                  as List<FirstLastStat>,
        lastStats: null == lastStats
            ? _value._lastStats
            : lastStats // ignore: cast_nullable_to_non_nullable
                  as List<FirstLastStat>,
        totalDraws: null == totalDraws
            ? _value.totalDraws
            : totalDraws // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FirstLastResponseImpl implements _FirstLastResponse {
  const _$FirstLastResponseImpl({
    @JsonKey(name: 'first_stats') required final List<FirstLastStat> firstStats,
    @JsonKey(name: 'last_stats') required final List<FirstLastStat> lastStats,
    @JsonKey(name: 'total_draws') required this.totalDraws,
  }) : _firstStats = firstStats,
       _lastStats = lastStats;

  factory _$FirstLastResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FirstLastResponseImplFromJson(json);

  final List<FirstLastStat> _firstStats;
  @override
  @JsonKey(name: 'first_stats')
  List<FirstLastStat> get firstStats {
    if (_firstStats is EqualUnmodifiableListView) return _firstStats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_firstStats);
  }

  final List<FirstLastStat> _lastStats;
  @override
  @JsonKey(name: 'last_stats')
  List<FirstLastStat> get lastStats {
    if (_lastStats is EqualUnmodifiableListView) return _lastStats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lastStats);
  }

  @override
  @JsonKey(name: 'total_draws')
  final int totalDraws;

  @override
  String toString() {
    return 'FirstLastResponse(firstStats: $firstStats, lastStats: $lastStats, totalDraws: $totalDraws)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirstLastResponseImpl &&
            const DeepCollectionEquality().equals(
              other._firstStats,
              _firstStats,
            ) &&
            const DeepCollectionEquality().equals(
              other._lastStats,
              _lastStats,
            ) &&
            (identical(other.totalDraws, totalDraws) ||
                other.totalDraws == totalDraws));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_firstStats),
    const DeepCollectionEquality().hash(_lastStats),
    totalDraws,
  );

  /// Create a copy of FirstLastResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FirstLastResponseImplCopyWith<_$FirstLastResponseImpl> get copyWith =>
      __$$FirstLastResponseImplCopyWithImpl<_$FirstLastResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$FirstLastResponseImplToJson(this);
  }
}

abstract class _FirstLastResponse implements FirstLastResponse {
  const factory _FirstLastResponse({
    @JsonKey(name: 'first_stats') required final List<FirstLastStat> firstStats,
    @JsonKey(name: 'last_stats') required final List<FirstLastStat> lastStats,
    @JsonKey(name: 'total_draws') required final int totalDraws,
  }) = _$FirstLastResponseImpl;

  factory _FirstLastResponse.fromJson(Map<String, dynamic> json) =
      _$FirstLastResponseImpl.fromJson;

  @override
  @JsonKey(name: 'first_stats')
  List<FirstLastStat> get firstStats;
  @override
  @JsonKey(name: 'last_stats')
  List<FirstLastStat> get lastStats;
  @override
  @JsonKey(name: 'total_draws')
  int get totalDraws;

  /// Create a copy of FirstLastResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FirstLastResponseImplCopyWith<_$FirstLastResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PairStat _$PairStatFromJson(Map<String, dynamic> json) {
  return _PairStat.fromJson(json);
}

/// @nodoc
mixin _$PairStat {
  @JsonKey(name: 'number1')
  int get number1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'number2')
  int get number2 => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  double get probability => throw _privateConstructorUsedError;

  /// Serializes this PairStat to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PairStat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PairStatCopyWith<PairStat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PairStatCopyWith<$Res> {
  factory $PairStatCopyWith(PairStat value, $Res Function(PairStat) then) =
      _$PairStatCopyWithImpl<$Res, PairStat>;
  @useResult
  $Res call({
    @JsonKey(name: 'number1') int number1,
    @JsonKey(name: 'number2') int number2,
    int count,
    double probability,
  });
}

/// @nodoc
class _$PairStatCopyWithImpl<$Res, $Val extends PairStat>
    implements $PairStatCopyWith<$Res> {
  _$PairStatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PairStat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number1 = null,
    Object? number2 = null,
    Object? count = null,
    Object? probability = null,
  }) {
    return _then(
      _value.copyWith(
            number1: null == number1
                ? _value.number1
                : number1 // ignore: cast_nullable_to_non_nullable
                      as int,
            number2: null == number2
                ? _value.number2
                : number2 // ignore: cast_nullable_to_non_nullable
                      as int,
            count: null == count
                ? _value.count
                : count // ignore: cast_nullable_to_non_nullable
                      as int,
            probability: null == probability
                ? _value.probability
                : probability // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PairStatImplCopyWith<$Res>
    implements $PairStatCopyWith<$Res> {
  factory _$$PairStatImplCopyWith(
    _$PairStatImpl value,
    $Res Function(_$PairStatImpl) then,
  ) = __$$PairStatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'number1') int number1,
    @JsonKey(name: 'number2') int number2,
    int count,
    double probability,
  });
}

/// @nodoc
class __$$PairStatImplCopyWithImpl<$Res>
    extends _$PairStatCopyWithImpl<$Res, _$PairStatImpl>
    implements _$$PairStatImplCopyWith<$Res> {
  __$$PairStatImplCopyWithImpl(
    _$PairStatImpl _value,
    $Res Function(_$PairStatImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PairStat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number1 = null,
    Object? number2 = null,
    Object? count = null,
    Object? probability = null,
  }) {
    return _then(
      _$PairStatImpl(
        number1: null == number1
            ? _value.number1
            : number1 // ignore: cast_nullable_to_non_nullable
                  as int,
        number2: null == number2
            ? _value.number2
            : number2 // ignore: cast_nullable_to_non_nullable
                  as int,
        count: null == count
            ? _value.count
            : count // ignore: cast_nullable_to_non_nullable
                  as int,
        probability: null == probability
            ? _value.probability
            : probability // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PairStatImpl implements _PairStat {
  const _$PairStatImpl({
    @JsonKey(name: 'number1') required this.number1,
    @JsonKey(name: 'number2') required this.number2,
    required this.count,
    required this.probability,
  });

  factory _$PairStatImpl.fromJson(Map<String, dynamic> json) =>
      _$$PairStatImplFromJson(json);

  @override
  @JsonKey(name: 'number1')
  final int number1;
  @override
  @JsonKey(name: 'number2')
  final int number2;
  @override
  final int count;
  @override
  final double probability;

  @override
  String toString() {
    return 'PairStat(number1: $number1, number2: $number2, count: $count, probability: $probability)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PairStatImpl &&
            (identical(other.number1, number1) || other.number1 == number1) &&
            (identical(other.number2, number2) || other.number2 == number2) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.probability, probability) ||
                other.probability == probability));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, number1, number2, count, probability);

  /// Create a copy of PairStat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PairStatImplCopyWith<_$PairStatImpl> get copyWith =>
      __$$PairStatImplCopyWithImpl<_$PairStatImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PairStatImplToJson(this);
  }
}

abstract class _PairStat implements PairStat {
  const factory _PairStat({
    @JsonKey(name: 'number1') required final int number1,
    @JsonKey(name: 'number2') required final int number2,
    required final int count,
    required final double probability,
  }) = _$PairStatImpl;

  factory _PairStat.fromJson(Map<String, dynamic> json) =
      _$PairStatImpl.fromJson;

  @override
  @JsonKey(name: 'number1')
  int get number1;
  @override
  @JsonKey(name: 'number2')
  int get number2;
  @override
  int get count;
  @override
  double get probability;

  /// Create a copy of PairStat
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PairStatImplCopyWith<_$PairStatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PairStatsResponse _$PairStatsResponseFromJson(Map<String, dynamic> json) {
  return _PairStatsResponse.fromJson(json);
}

/// @nodoc
mixin _$PairStatsResponse {
  @JsonKey(name: 'top_pairs')
  List<PairStat> get topPairs => throw _privateConstructorUsedError;
  @JsonKey(name: 'bottom_pairs')
  List<PairStat> get bottomPairs => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_draws')
  int get totalDraws => throw _privateConstructorUsedError;

  /// Serializes this PairStatsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PairStatsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PairStatsResponseCopyWith<PairStatsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PairStatsResponseCopyWith<$Res> {
  factory $PairStatsResponseCopyWith(
    PairStatsResponse value,
    $Res Function(PairStatsResponse) then,
  ) = _$PairStatsResponseCopyWithImpl<$Res, PairStatsResponse>;
  @useResult
  $Res call({
    @JsonKey(name: 'top_pairs') List<PairStat> topPairs,
    @JsonKey(name: 'bottom_pairs') List<PairStat> bottomPairs,
    @JsonKey(name: 'total_draws') int totalDraws,
  });
}

/// @nodoc
class _$PairStatsResponseCopyWithImpl<$Res, $Val extends PairStatsResponse>
    implements $PairStatsResponseCopyWith<$Res> {
  _$PairStatsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PairStatsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topPairs = null,
    Object? bottomPairs = null,
    Object? totalDraws = null,
  }) {
    return _then(
      _value.copyWith(
            topPairs: null == topPairs
                ? _value.topPairs
                : topPairs // ignore: cast_nullable_to_non_nullable
                      as List<PairStat>,
            bottomPairs: null == bottomPairs
                ? _value.bottomPairs
                : bottomPairs // ignore: cast_nullable_to_non_nullable
                      as List<PairStat>,
            totalDraws: null == totalDraws
                ? _value.totalDraws
                : totalDraws // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PairStatsResponseImplCopyWith<$Res>
    implements $PairStatsResponseCopyWith<$Res> {
  factory _$$PairStatsResponseImplCopyWith(
    _$PairStatsResponseImpl value,
    $Res Function(_$PairStatsResponseImpl) then,
  ) = __$$PairStatsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'top_pairs') List<PairStat> topPairs,
    @JsonKey(name: 'bottom_pairs') List<PairStat> bottomPairs,
    @JsonKey(name: 'total_draws') int totalDraws,
  });
}

/// @nodoc
class __$$PairStatsResponseImplCopyWithImpl<$Res>
    extends _$PairStatsResponseCopyWithImpl<$Res, _$PairStatsResponseImpl>
    implements _$$PairStatsResponseImplCopyWith<$Res> {
  __$$PairStatsResponseImplCopyWithImpl(
    _$PairStatsResponseImpl _value,
    $Res Function(_$PairStatsResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PairStatsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topPairs = null,
    Object? bottomPairs = null,
    Object? totalDraws = null,
  }) {
    return _then(
      _$PairStatsResponseImpl(
        topPairs: null == topPairs
            ? _value._topPairs
            : topPairs // ignore: cast_nullable_to_non_nullable
                  as List<PairStat>,
        bottomPairs: null == bottomPairs
            ? _value._bottomPairs
            : bottomPairs // ignore: cast_nullable_to_non_nullable
                  as List<PairStat>,
        totalDraws: null == totalDraws
            ? _value.totalDraws
            : totalDraws // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PairStatsResponseImpl implements _PairStatsResponse {
  const _$PairStatsResponseImpl({
    @JsonKey(name: 'top_pairs') required final List<PairStat> topPairs,
    @JsonKey(name: 'bottom_pairs') required final List<PairStat> bottomPairs,
    @JsonKey(name: 'total_draws') required this.totalDraws,
  }) : _topPairs = topPairs,
       _bottomPairs = bottomPairs;

  factory _$PairStatsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PairStatsResponseImplFromJson(json);

  final List<PairStat> _topPairs;
  @override
  @JsonKey(name: 'top_pairs')
  List<PairStat> get topPairs {
    if (_topPairs is EqualUnmodifiableListView) return _topPairs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topPairs);
  }

  final List<PairStat> _bottomPairs;
  @override
  @JsonKey(name: 'bottom_pairs')
  List<PairStat> get bottomPairs {
    if (_bottomPairs is EqualUnmodifiableListView) return _bottomPairs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bottomPairs);
  }

  @override
  @JsonKey(name: 'total_draws')
  final int totalDraws;

  @override
  String toString() {
    return 'PairStatsResponse(topPairs: $topPairs, bottomPairs: $bottomPairs, totalDraws: $totalDraws)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PairStatsResponseImpl &&
            const DeepCollectionEquality().equals(other._topPairs, _topPairs) &&
            const DeepCollectionEquality().equals(
              other._bottomPairs,
              _bottomPairs,
            ) &&
            (identical(other.totalDraws, totalDraws) ||
                other.totalDraws == totalDraws));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_topPairs),
    const DeepCollectionEquality().hash(_bottomPairs),
    totalDraws,
  );

  /// Create a copy of PairStatsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PairStatsResponseImplCopyWith<_$PairStatsResponseImpl> get copyWith =>
      __$$PairStatsResponseImplCopyWithImpl<_$PairStatsResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PairStatsResponseImplToJson(this);
  }
}

abstract class _PairStatsResponse implements PairStatsResponse {
  const factory _PairStatsResponse({
    @JsonKey(name: 'top_pairs') required final List<PairStat> topPairs,
    @JsonKey(name: 'bottom_pairs') required final List<PairStat> bottomPairs,
    @JsonKey(name: 'total_draws') required final int totalDraws,
  }) = _$PairStatsResponseImpl;

  factory _PairStatsResponse.fromJson(Map<String, dynamic> json) =
      _$PairStatsResponseImpl.fromJson;

  @override
  @JsonKey(name: 'top_pairs')
  List<PairStat> get topPairs;
  @override
  @JsonKey(name: 'bottom_pairs')
  List<PairStat> get bottomPairs;
  @override
  @JsonKey(name: 'total_draws')
  int get totalDraws;

  /// Create a copy of PairStatsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PairStatsResponseImplCopyWith<_$PairStatsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ConsecutiveCountStat _$ConsecutiveCountStatFromJson(Map<String, dynamic> json) {
  return _ConsecutiveCountStat.fromJson(json);
}

/// @nodoc
mixin _$ConsecutiveCountStat {
  @JsonKey(name: 'consecutive_count')
  int get consecutiveCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'draw_count')
  int get drawCount => throw _privateConstructorUsedError;
  double get probability => throw _privateConstructorUsedError;

  /// Serializes this ConsecutiveCountStat to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConsecutiveCountStat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConsecutiveCountStatCopyWith<ConsecutiveCountStat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsecutiveCountStatCopyWith<$Res> {
  factory $ConsecutiveCountStatCopyWith(
    ConsecutiveCountStat value,
    $Res Function(ConsecutiveCountStat) then,
  ) = _$ConsecutiveCountStatCopyWithImpl<$Res, ConsecutiveCountStat>;
  @useResult
  $Res call({
    @JsonKey(name: 'consecutive_count') int consecutiveCount,
    @JsonKey(name: 'draw_count') int drawCount,
    double probability,
  });
}

/// @nodoc
class _$ConsecutiveCountStatCopyWithImpl<
  $Res,
  $Val extends ConsecutiveCountStat
>
    implements $ConsecutiveCountStatCopyWith<$Res> {
  _$ConsecutiveCountStatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConsecutiveCountStat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? consecutiveCount = null,
    Object? drawCount = null,
    Object? probability = null,
  }) {
    return _then(
      _value.copyWith(
            consecutiveCount: null == consecutiveCount
                ? _value.consecutiveCount
                : consecutiveCount // ignore: cast_nullable_to_non_nullable
                      as int,
            drawCount: null == drawCount
                ? _value.drawCount
                : drawCount // ignore: cast_nullable_to_non_nullable
                      as int,
            probability: null == probability
                ? _value.probability
                : probability // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ConsecutiveCountStatImplCopyWith<$Res>
    implements $ConsecutiveCountStatCopyWith<$Res> {
  factory _$$ConsecutiveCountStatImplCopyWith(
    _$ConsecutiveCountStatImpl value,
    $Res Function(_$ConsecutiveCountStatImpl) then,
  ) = __$$ConsecutiveCountStatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'consecutive_count') int consecutiveCount,
    @JsonKey(name: 'draw_count') int drawCount,
    double probability,
  });
}

/// @nodoc
class __$$ConsecutiveCountStatImplCopyWithImpl<$Res>
    extends _$ConsecutiveCountStatCopyWithImpl<$Res, _$ConsecutiveCountStatImpl>
    implements _$$ConsecutiveCountStatImplCopyWith<$Res> {
  __$$ConsecutiveCountStatImplCopyWithImpl(
    _$ConsecutiveCountStatImpl _value,
    $Res Function(_$ConsecutiveCountStatImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ConsecutiveCountStat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? consecutiveCount = null,
    Object? drawCount = null,
    Object? probability = null,
  }) {
    return _then(
      _$ConsecutiveCountStatImpl(
        consecutiveCount: null == consecutiveCount
            ? _value.consecutiveCount
            : consecutiveCount // ignore: cast_nullable_to_non_nullable
                  as int,
        drawCount: null == drawCount
            ? _value.drawCount
            : drawCount // ignore: cast_nullable_to_non_nullable
                  as int,
        probability: null == probability
            ? _value.probability
            : probability // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ConsecutiveCountStatImpl implements _ConsecutiveCountStat {
  const _$ConsecutiveCountStatImpl({
    @JsonKey(name: 'consecutive_count') required this.consecutiveCount,
    @JsonKey(name: 'draw_count') required this.drawCount,
    required this.probability,
  });

  factory _$ConsecutiveCountStatImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConsecutiveCountStatImplFromJson(json);

  @override
  @JsonKey(name: 'consecutive_count')
  final int consecutiveCount;
  @override
  @JsonKey(name: 'draw_count')
  final int drawCount;
  @override
  final double probability;

  @override
  String toString() {
    return 'ConsecutiveCountStat(consecutiveCount: $consecutiveCount, drawCount: $drawCount, probability: $probability)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConsecutiveCountStatImpl &&
            (identical(other.consecutiveCount, consecutiveCount) ||
                other.consecutiveCount == consecutiveCount) &&
            (identical(other.drawCount, drawCount) ||
                other.drawCount == drawCount) &&
            (identical(other.probability, probability) ||
                other.probability == probability));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, consecutiveCount, drawCount, probability);

  /// Create a copy of ConsecutiveCountStat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsecutiveCountStatImplCopyWith<_$ConsecutiveCountStatImpl>
  get copyWith =>
      __$$ConsecutiveCountStatImplCopyWithImpl<_$ConsecutiveCountStatImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsecutiveCountStatImplToJson(this);
  }
}

abstract class _ConsecutiveCountStat implements ConsecutiveCountStat {
  const factory _ConsecutiveCountStat({
    @JsonKey(name: 'consecutive_count') required final int consecutiveCount,
    @JsonKey(name: 'draw_count') required final int drawCount,
    required final double probability,
  }) = _$ConsecutiveCountStatImpl;

  factory _ConsecutiveCountStat.fromJson(Map<String, dynamic> json) =
      _$ConsecutiveCountStatImpl.fromJson;

  @override
  @JsonKey(name: 'consecutive_count')
  int get consecutiveCount;
  @override
  @JsonKey(name: 'draw_count')
  int get drawCount;
  @override
  double get probability;

  /// Create a copy of ConsecutiveCountStat
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConsecutiveCountStatImplCopyWith<_$ConsecutiveCountStatImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ConsecutiveExample _$ConsecutiveExampleFromJson(Map<String, dynamic> json) {
  return _ConsecutiveExample.fromJson(json);
}

/// @nodoc
mixin _$ConsecutiveExample {
  @JsonKey(name: 'draw_no')
  int get drawNo => throw _privateConstructorUsedError;
  List<int> get numbers => throw _privateConstructorUsedError;
  @JsonKey(name: 'consecutive_count')
  int get consecutiveCount => throw _privateConstructorUsedError;

  /// Serializes this ConsecutiveExample to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConsecutiveExample
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConsecutiveExampleCopyWith<ConsecutiveExample> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsecutiveExampleCopyWith<$Res> {
  factory $ConsecutiveExampleCopyWith(
    ConsecutiveExample value,
    $Res Function(ConsecutiveExample) then,
  ) = _$ConsecutiveExampleCopyWithImpl<$Res, ConsecutiveExample>;
  @useResult
  $Res call({
    @JsonKey(name: 'draw_no') int drawNo,
    List<int> numbers,
    @JsonKey(name: 'consecutive_count') int consecutiveCount,
  });
}

/// @nodoc
class _$ConsecutiveExampleCopyWithImpl<$Res, $Val extends ConsecutiveExample>
    implements $ConsecutiveExampleCopyWith<$Res> {
  _$ConsecutiveExampleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConsecutiveExample
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? drawNo = null,
    Object? numbers = null,
    Object? consecutiveCount = null,
  }) {
    return _then(
      _value.copyWith(
            drawNo: null == drawNo
                ? _value.drawNo
                : drawNo // ignore: cast_nullable_to_non_nullable
                      as int,
            numbers: null == numbers
                ? _value.numbers
                : numbers // ignore: cast_nullable_to_non_nullable
                      as List<int>,
            consecutiveCount: null == consecutiveCount
                ? _value.consecutiveCount
                : consecutiveCount // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ConsecutiveExampleImplCopyWith<$Res>
    implements $ConsecutiveExampleCopyWith<$Res> {
  factory _$$ConsecutiveExampleImplCopyWith(
    _$ConsecutiveExampleImpl value,
    $Res Function(_$ConsecutiveExampleImpl) then,
  ) = __$$ConsecutiveExampleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'draw_no') int drawNo,
    List<int> numbers,
    @JsonKey(name: 'consecutive_count') int consecutiveCount,
  });
}

/// @nodoc
class __$$ConsecutiveExampleImplCopyWithImpl<$Res>
    extends _$ConsecutiveExampleCopyWithImpl<$Res, _$ConsecutiveExampleImpl>
    implements _$$ConsecutiveExampleImplCopyWith<$Res> {
  __$$ConsecutiveExampleImplCopyWithImpl(
    _$ConsecutiveExampleImpl _value,
    $Res Function(_$ConsecutiveExampleImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ConsecutiveExample
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? drawNo = null,
    Object? numbers = null,
    Object? consecutiveCount = null,
  }) {
    return _then(
      _$ConsecutiveExampleImpl(
        drawNo: null == drawNo
            ? _value.drawNo
            : drawNo // ignore: cast_nullable_to_non_nullable
                  as int,
        numbers: null == numbers
            ? _value._numbers
            : numbers // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        consecutiveCount: null == consecutiveCount
            ? _value.consecutiveCount
            : consecutiveCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ConsecutiveExampleImpl implements _ConsecutiveExample {
  const _$ConsecutiveExampleImpl({
    @JsonKey(name: 'draw_no') required this.drawNo,
    required final List<int> numbers,
    @JsonKey(name: 'consecutive_count') required this.consecutiveCount,
  }) : _numbers = numbers;

  factory _$ConsecutiveExampleImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConsecutiveExampleImplFromJson(json);

  @override
  @JsonKey(name: 'draw_no')
  final int drawNo;
  final List<int> _numbers;
  @override
  List<int> get numbers {
    if (_numbers is EqualUnmodifiableListView) return _numbers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_numbers);
  }

  @override
  @JsonKey(name: 'consecutive_count')
  final int consecutiveCount;

  @override
  String toString() {
    return 'ConsecutiveExample(drawNo: $drawNo, numbers: $numbers, consecutiveCount: $consecutiveCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConsecutiveExampleImpl &&
            (identical(other.drawNo, drawNo) || other.drawNo == drawNo) &&
            const DeepCollectionEquality().equals(other._numbers, _numbers) &&
            (identical(other.consecutiveCount, consecutiveCount) ||
                other.consecutiveCount == consecutiveCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    drawNo,
    const DeepCollectionEquality().hash(_numbers),
    consecutiveCount,
  );

  /// Create a copy of ConsecutiveExample
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsecutiveExampleImplCopyWith<_$ConsecutiveExampleImpl> get copyWith =>
      __$$ConsecutiveExampleImplCopyWithImpl<_$ConsecutiveExampleImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsecutiveExampleImplToJson(this);
  }
}

abstract class _ConsecutiveExample implements ConsecutiveExample {
  const factory _ConsecutiveExample({
    @JsonKey(name: 'draw_no') required final int drawNo,
    required final List<int> numbers,
    @JsonKey(name: 'consecutive_count') required final int consecutiveCount,
  }) = _$ConsecutiveExampleImpl;

  factory _ConsecutiveExample.fromJson(Map<String, dynamic> json) =
      _$ConsecutiveExampleImpl.fromJson;

  @override
  @JsonKey(name: 'draw_no')
  int get drawNo;
  @override
  List<int> get numbers;
  @override
  @JsonKey(name: 'consecutive_count')
  int get consecutiveCount;

  /// Create a copy of ConsecutiveExample
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConsecutiveExampleImplCopyWith<_$ConsecutiveExampleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ConsecutiveResponse _$ConsecutiveResponseFromJson(Map<String, dynamic> json) {
  return _ConsecutiveResponse.fromJson(json);
}

/// @nodoc
mixin _$ConsecutiveResponse {
  @JsonKey(name: 'count_stats')
  List<ConsecutiveCountStat> get countStats =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'recent_examples')
  List<ConsecutiveExample> get recentExamples =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'total_draws')
  int get totalDraws => throw _privateConstructorUsedError;

  /// Serializes this ConsecutiveResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConsecutiveResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConsecutiveResponseCopyWith<ConsecutiveResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsecutiveResponseCopyWith<$Res> {
  factory $ConsecutiveResponseCopyWith(
    ConsecutiveResponse value,
    $Res Function(ConsecutiveResponse) then,
  ) = _$ConsecutiveResponseCopyWithImpl<$Res, ConsecutiveResponse>;
  @useResult
  $Res call({
    @JsonKey(name: 'count_stats') List<ConsecutiveCountStat> countStats,
    @JsonKey(name: 'recent_examples') List<ConsecutiveExample> recentExamples,
    @JsonKey(name: 'total_draws') int totalDraws,
  });
}

/// @nodoc
class _$ConsecutiveResponseCopyWithImpl<$Res, $Val extends ConsecutiveResponse>
    implements $ConsecutiveResponseCopyWith<$Res> {
  _$ConsecutiveResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConsecutiveResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countStats = null,
    Object? recentExamples = null,
    Object? totalDraws = null,
  }) {
    return _then(
      _value.copyWith(
            countStats: null == countStats
                ? _value.countStats
                : countStats // ignore: cast_nullable_to_non_nullable
                      as List<ConsecutiveCountStat>,
            recentExamples: null == recentExamples
                ? _value.recentExamples
                : recentExamples // ignore: cast_nullable_to_non_nullable
                      as List<ConsecutiveExample>,
            totalDraws: null == totalDraws
                ? _value.totalDraws
                : totalDraws // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ConsecutiveResponseImplCopyWith<$Res>
    implements $ConsecutiveResponseCopyWith<$Res> {
  factory _$$ConsecutiveResponseImplCopyWith(
    _$ConsecutiveResponseImpl value,
    $Res Function(_$ConsecutiveResponseImpl) then,
  ) = __$$ConsecutiveResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'count_stats') List<ConsecutiveCountStat> countStats,
    @JsonKey(name: 'recent_examples') List<ConsecutiveExample> recentExamples,
    @JsonKey(name: 'total_draws') int totalDraws,
  });
}

/// @nodoc
class __$$ConsecutiveResponseImplCopyWithImpl<$Res>
    extends _$ConsecutiveResponseCopyWithImpl<$Res, _$ConsecutiveResponseImpl>
    implements _$$ConsecutiveResponseImplCopyWith<$Res> {
  __$$ConsecutiveResponseImplCopyWithImpl(
    _$ConsecutiveResponseImpl _value,
    $Res Function(_$ConsecutiveResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ConsecutiveResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countStats = null,
    Object? recentExamples = null,
    Object? totalDraws = null,
  }) {
    return _then(
      _$ConsecutiveResponseImpl(
        countStats: null == countStats
            ? _value._countStats
            : countStats // ignore: cast_nullable_to_non_nullable
                  as List<ConsecutiveCountStat>,
        recentExamples: null == recentExamples
            ? _value._recentExamples
            : recentExamples // ignore: cast_nullable_to_non_nullable
                  as List<ConsecutiveExample>,
        totalDraws: null == totalDraws
            ? _value.totalDraws
            : totalDraws // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ConsecutiveResponseImpl implements _ConsecutiveResponse {
  const _$ConsecutiveResponseImpl({
    @JsonKey(name: 'count_stats')
    required final List<ConsecutiveCountStat> countStats,
    @JsonKey(name: 'recent_examples')
    required final List<ConsecutiveExample> recentExamples,
    @JsonKey(name: 'total_draws') required this.totalDraws,
  }) : _countStats = countStats,
       _recentExamples = recentExamples;

  factory _$ConsecutiveResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConsecutiveResponseImplFromJson(json);

  final List<ConsecutiveCountStat> _countStats;
  @override
  @JsonKey(name: 'count_stats')
  List<ConsecutiveCountStat> get countStats {
    if (_countStats is EqualUnmodifiableListView) return _countStats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_countStats);
  }

  final List<ConsecutiveExample> _recentExamples;
  @override
  @JsonKey(name: 'recent_examples')
  List<ConsecutiveExample> get recentExamples {
    if (_recentExamples is EqualUnmodifiableListView) return _recentExamples;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentExamples);
  }

  @override
  @JsonKey(name: 'total_draws')
  final int totalDraws;

  @override
  String toString() {
    return 'ConsecutiveResponse(countStats: $countStats, recentExamples: $recentExamples, totalDraws: $totalDraws)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConsecutiveResponseImpl &&
            const DeepCollectionEquality().equals(
              other._countStats,
              _countStats,
            ) &&
            const DeepCollectionEquality().equals(
              other._recentExamples,
              _recentExamples,
            ) &&
            (identical(other.totalDraws, totalDraws) ||
                other.totalDraws == totalDraws));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_countStats),
    const DeepCollectionEquality().hash(_recentExamples),
    totalDraws,
  );

  /// Create a copy of ConsecutiveResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsecutiveResponseImplCopyWith<_$ConsecutiveResponseImpl> get copyWith =>
      __$$ConsecutiveResponseImplCopyWithImpl<_$ConsecutiveResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsecutiveResponseImplToJson(this);
  }
}

abstract class _ConsecutiveResponse implements ConsecutiveResponse {
  const factory _ConsecutiveResponse({
    @JsonKey(name: 'count_stats')
    required final List<ConsecutiveCountStat> countStats,
    @JsonKey(name: 'recent_examples')
    required final List<ConsecutiveExample> recentExamples,
    @JsonKey(name: 'total_draws') required final int totalDraws,
  }) = _$ConsecutiveResponseImpl;

  factory _ConsecutiveResponse.fromJson(Map<String, dynamic> json) =
      _$ConsecutiveResponseImpl.fromJson;

  @override
  @JsonKey(name: 'count_stats')
  List<ConsecutiveCountStat> get countStats;
  @override
  @JsonKey(name: 'recent_examples')
  List<ConsecutiveExample> get recentExamples;
  @override
  @JsonKey(name: 'total_draws')
  int get totalDraws;

  /// Create a copy of ConsecutiveResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConsecutiveResponseImplCopyWith<_$ConsecutiveResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RatioStat _$RatioStatFromJson(Map<String, dynamic> json) {
  return _RatioStat.fromJson(json);
}

/// @nodoc
mixin _$RatioStat {
  String get ratio => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  double get probability => throw _privateConstructorUsedError;

  /// Serializes this RatioStat to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RatioStat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RatioStatCopyWith<RatioStat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RatioStatCopyWith<$Res> {
  factory $RatioStatCopyWith(RatioStat value, $Res Function(RatioStat) then) =
      _$RatioStatCopyWithImpl<$Res, RatioStat>;
  @useResult
  $Res call({String ratio, int count, double probability});
}

/// @nodoc
class _$RatioStatCopyWithImpl<$Res, $Val extends RatioStat>
    implements $RatioStatCopyWith<$Res> {
  _$RatioStatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RatioStat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ratio = null,
    Object? count = null,
    Object? probability = null,
  }) {
    return _then(
      _value.copyWith(
            ratio: null == ratio
                ? _value.ratio
                : ratio // ignore: cast_nullable_to_non_nullable
                      as String,
            count: null == count
                ? _value.count
                : count // ignore: cast_nullable_to_non_nullable
                      as int,
            probability: null == probability
                ? _value.probability
                : probability // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RatioStatImplCopyWith<$Res>
    implements $RatioStatCopyWith<$Res> {
  factory _$$RatioStatImplCopyWith(
    _$RatioStatImpl value,
    $Res Function(_$RatioStatImpl) then,
  ) = __$$RatioStatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String ratio, int count, double probability});
}

/// @nodoc
class __$$RatioStatImplCopyWithImpl<$Res>
    extends _$RatioStatCopyWithImpl<$Res, _$RatioStatImpl>
    implements _$$RatioStatImplCopyWith<$Res> {
  __$$RatioStatImplCopyWithImpl(
    _$RatioStatImpl _value,
    $Res Function(_$RatioStatImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RatioStat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ratio = null,
    Object? count = null,
    Object? probability = null,
  }) {
    return _then(
      _$RatioStatImpl(
        ratio: null == ratio
            ? _value.ratio
            : ratio // ignore: cast_nullable_to_non_nullable
                  as String,
        count: null == count
            ? _value.count
            : count // ignore: cast_nullable_to_non_nullable
                  as int,
        probability: null == probability
            ? _value.probability
            : probability // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RatioStatImpl implements _RatioStat {
  const _$RatioStatImpl({
    required this.ratio,
    required this.count,
    required this.probability,
  });

  factory _$RatioStatImpl.fromJson(Map<String, dynamic> json) =>
      _$$RatioStatImplFromJson(json);

  @override
  final String ratio;
  @override
  final int count;
  @override
  final double probability;

  @override
  String toString() {
    return 'RatioStat(ratio: $ratio, count: $count, probability: $probability)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RatioStatImpl &&
            (identical(other.ratio, ratio) || other.ratio == ratio) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.probability, probability) ||
                other.probability == probability));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, ratio, count, probability);

  /// Create a copy of RatioStat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RatioStatImplCopyWith<_$RatioStatImpl> get copyWith =>
      __$$RatioStatImplCopyWithImpl<_$RatioStatImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RatioStatImplToJson(this);
  }
}

abstract class _RatioStat implements RatioStat {
  const factory _RatioStat({
    required final String ratio,
    required final int count,
    required final double probability,
  }) = _$RatioStatImpl;

  factory _RatioStat.fromJson(Map<String, dynamic> json) =
      _$RatioStatImpl.fromJson;

  @override
  String get ratio;
  @override
  int get count;
  @override
  double get probability;

  /// Create a copy of RatioStat
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RatioStatImplCopyWith<_$RatioStatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RatioResponse _$RatioResponseFromJson(Map<String, dynamic> json) {
  return _RatioResponse.fromJson(json);
}

/// @nodoc
mixin _$RatioResponse {
  @JsonKey(name: 'odd_even_stats')
  List<RatioStat> get oddEvenStats => throw _privateConstructorUsedError;
  @JsonKey(name: 'high_low_stats')
  List<RatioStat> get highLowStats => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_draws')
  int get totalDraws => throw _privateConstructorUsedError;

  /// Serializes this RatioResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RatioResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RatioResponseCopyWith<RatioResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RatioResponseCopyWith<$Res> {
  factory $RatioResponseCopyWith(
    RatioResponse value,
    $Res Function(RatioResponse) then,
  ) = _$RatioResponseCopyWithImpl<$Res, RatioResponse>;
  @useResult
  $Res call({
    @JsonKey(name: 'odd_even_stats') List<RatioStat> oddEvenStats,
    @JsonKey(name: 'high_low_stats') List<RatioStat> highLowStats,
    @JsonKey(name: 'total_draws') int totalDraws,
  });
}

/// @nodoc
class _$RatioResponseCopyWithImpl<$Res, $Val extends RatioResponse>
    implements $RatioResponseCopyWith<$Res> {
  _$RatioResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RatioResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oddEvenStats = null,
    Object? highLowStats = null,
    Object? totalDraws = null,
  }) {
    return _then(
      _value.copyWith(
            oddEvenStats: null == oddEvenStats
                ? _value.oddEvenStats
                : oddEvenStats // ignore: cast_nullable_to_non_nullable
                      as List<RatioStat>,
            highLowStats: null == highLowStats
                ? _value.highLowStats
                : highLowStats // ignore: cast_nullable_to_non_nullable
                      as List<RatioStat>,
            totalDraws: null == totalDraws
                ? _value.totalDraws
                : totalDraws // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RatioResponseImplCopyWith<$Res>
    implements $RatioResponseCopyWith<$Res> {
  factory _$$RatioResponseImplCopyWith(
    _$RatioResponseImpl value,
    $Res Function(_$RatioResponseImpl) then,
  ) = __$$RatioResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'odd_even_stats') List<RatioStat> oddEvenStats,
    @JsonKey(name: 'high_low_stats') List<RatioStat> highLowStats,
    @JsonKey(name: 'total_draws') int totalDraws,
  });
}

/// @nodoc
class __$$RatioResponseImplCopyWithImpl<$Res>
    extends _$RatioResponseCopyWithImpl<$Res, _$RatioResponseImpl>
    implements _$$RatioResponseImplCopyWith<$Res> {
  __$$RatioResponseImplCopyWithImpl(
    _$RatioResponseImpl _value,
    $Res Function(_$RatioResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RatioResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oddEvenStats = null,
    Object? highLowStats = null,
    Object? totalDraws = null,
  }) {
    return _then(
      _$RatioResponseImpl(
        oddEvenStats: null == oddEvenStats
            ? _value._oddEvenStats
            : oddEvenStats // ignore: cast_nullable_to_non_nullable
                  as List<RatioStat>,
        highLowStats: null == highLowStats
            ? _value._highLowStats
            : highLowStats // ignore: cast_nullable_to_non_nullable
                  as List<RatioStat>,
        totalDraws: null == totalDraws
            ? _value.totalDraws
            : totalDraws // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RatioResponseImpl implements _RatioResponse {
  const _$RatioResponseImpl({
    @JsonKey(name: 'odd_even_stats')
    required final List<RatioStat> oddEvenStats,
    @JsonKey(name: 'high_low_stats')
    required final List<RatioStat> highLowStats,
    @JsonKey(name: 'total_draws') required this.totalDraws,
  }) : _oddEvenStats = oddEvenStats,
       _highLowStats = highLowStats;

  factory _$RatioResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RatioResponseImplFromJson(json);

  final List<RatioStat> _oddEvenStats;
  @override
  @JsonKey(name: 'odd_even_stats')
  List<RatioStat> get oddEvenStats {
    if (_oddEvenStats is EqualUnmodifiableListView) return _oddEvenStats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_oddEvenStats);
  }

  final List<RatioStat> _highLowStats;
  @override
  @JsonKey(name: 'high_low_stats')
  List<RatioStat> get highLowStats {
    if (_highLowStats is EqualUnmodifiableListView) return _highLowStats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_highLowStats);
  }

  @override
  @JsonKey(name: 'total_draws')
  final int totalDraws;

  @override
  String toString() {
    return 'RatioResponse(oddEvenStats: $oddEvenStats, highLowStats: $highLowStats, totalDraws: $totalDraws)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RatioResponseImpl &&
            const DeepCollectionEquality().equals(
              other._oddEvenStats,
              _oddEvenStats,
            ) &&
            const DeepCollectionEquality().equals(
              other._highLowStats,
              _highLowStats,
            ) &&
            (identical(other.totalDraws, totalDraws) ||
                other.totalDraws == totalDraws));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_oddEvenStats),
    const DeepCollectionEquality().hash(_highLowStats),
    totalDraws,
  );

  /// Create a copy of RatioResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RatioResponseImplCopyWith<_$RatioResponseImpl> get copyWith =>
      __$$RatioResponseImplCopyWithImpl<_$RatioResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RatioResponseImplToJson(this);
  }
}

abstract class _RatioResponse implements RatioResponse {
  const factory _RatioResponse({
    @JsonKey(name: 'odd_even_stats')
    required final List<RatioStat> oddEvenStats,
    @JsonKey(name: 'high_low_stats')
    required final List<RatioStat> highLowStats,
    @JsonKey(name: 'total_draws') required final int totalDraws,
  }) = _$RatioResponseImpl;

  factory _RatioResponse.fromJson(Map<String, dynamic> json) =
      _$RatioResponseImpl.fromJson;

  @override
  @JsonKey(name: 'odd_even_stats')
  List<RatioStat> get oddEvenStats;
  @override
  @JsonKey(name: 'high_low_stats')
  List<RatioStat> get highLowStats;
  @override
  @JsonKey(name: 'total_draws')
  int get totalDraws;

  /// Create a copy of RatioResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RatioResponseImplCopyWith<_$RatioResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ColorPattern _$ColorPatternFromJson(Map<String, dynamic> json) {
  return _ColorPattern.fromJson(json);
}

/// @nodoc
mixin _$ColorPattern {
  String get pattern => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  double get probability => throw _privateConstructorUsedError;

  /// Serializes this ColorPattern to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ColorPattern
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ColorPatternCopyWith<ColorPattern> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ColorPatternCopyWith<$Res> {
  factory $ColorPatternCopyWith(
    ColorPattern value,
    $Res Function(ColorPattern) then,
  ) = _$ColorPatternCopyWithImpl<$Res, ColorPattern>;
  @useResult
  $Res call({String pattern, int count, double probability});
}

/// @nodoc
class _$ColorPatternCopyWithImpl<$Res, $Val extends ColorPattern>
    implements $ColorPatternCopyWith<$Res> {
  _$ColorPatternCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ColorPattern
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pattern = null,
    Object? count = null,
    Object? probability = null,
  }) {
    return _then(
      _value.copyWith(
            pattern: null == pattern
                ? _value.pattern
                : pattern // ignore: cast_nullable_to_non_nullable
                      as String,
            count: null == count
                ? _value.count
                : count // ignore: cast_nullable_to_non_nullable
                      as int,
            probability: null == probability
                ? _value.probability
                : probability // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ColorPatternImplCopyWith<$Res>
    implements $ColorPatternCopyWith<$Res> {
  factory _$$ColorPatternImplCopyWith(
    _$ColorPatternImpl value,
    $Res Function(_$ColorPatternImpl) then,
  ) = __$$ColorPatternImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String pattern, int count, double probability});
}

/// @nodoc
class __$$ColorPatternImplCopyWithImpl<$Res>
    extends _$ColorPatternCopyWithImpl<$Res, _$ColorPatternImpl>
    implements _$$ColorPatternImplCopyWith<$Res> {
  __$$ColorPatternImplCopyWithImpl(
    _$ColorPatternImpl _value,
    $Res Function(_$ColorPatternImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ColorPattern
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pattern = null,
    Object? count = null,
    Object? probability = null,
  }) {
    return _then(
      _$ColorPatternImpl(
        pattern: null == pattern
            ? _value.pattern
            : pattern // ignore: cast_nullable_to_non_nullable
                  as String,
        count: null == count
            ? _value.count
            : count // ignore: cast_nullable_to_non_nullable
                  as int,
        probability: null == probability
            ? _value.probability
            : probability // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ColorPatternImpl implements _ColorPattern {
  const _$ColorPatternImpl({
    required this.pattern,
    required this.count,
    required this.probability,
  });

  factory _$ColorPatternImpl.fromJson(Map<String, dynamic> json) =>
      _$$ColorPatternImplFromJson(json);

  @override
  final String pattern;
  @override
  final int count;
  @override
  final double probability;

  @override
  String toString() {
    return 'ColorPattern(pattern: $pattern, count: $count, probability: $probability)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ColorPatternImpl &&
            (identical(other.pattern, pattern) || other.pattern == pattern) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.probability, probability) ||
                other.probability == probability));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, pattern, count, probability);

  /// Create a copy of ColorPattern
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ColorPatternImplCopyWith<_$ColorPatternImpl> get copyWith =>
      __$$ColorPatternImplCopyWithImpl<_$ColorPatternImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ColorPatternImplToJson(this);
  }
}

abstract class _ColorPattern implements ColorPattern {
  const factory _ColorPattern({
    required final String pattern,
    required final int count,
    required final double probability,
  }) = _$ColorPatternImpl;

  factory _ColorPattern.fromJson(Map<String, dynamic> json) =
      _$ColorPatternImpl.fromJson;

  @override
  String get pattern;
  @override
  int get count;
  @override
  double get probability;

  /// Create a copy of ColorPattern
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ColorPatternImplCopyWith<_$ColorPatternImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ColorStatsResponse _$ColorStatsResponseFromJson(Map<String, dynamic> json) {
  return _ColorStatsResponse.fromJson(json);
}

/// @nodoc
mixin _$ColorStatsResponse {
  @JsonKey(name: 'top_patterns')
  List<ColorPattern> get topPatterns => throw _privateConstructorUsedError;
  @JsonKey(name: 'color_counts')
  Map<String, int> get colorCounts => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_draws')
  int get totalDraws => throw _privateConstructorUsedError;

  /// Serializes this ColorStatsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ColorStatsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ColorStatsResponseCopyWith<ColorStatsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ColorStatsResponseCopyWith<$Res> {
  factory $ColorStatsResponseCopyWith(
    ColorStatsResponse value,
    $Res Function(ColorStatsResponse) then,
  ) = _$ColorStatsResponseCopyWithImpl<$Res, ColorStatsResponse>;
  @useResult
  $Res call({
    @JsonKey(name: 'top_patterns') List<ColorPattern> topPatterns,
    @JsonKey(name: 'color_counts') Map<String, int> colorCounts,
    @JsonKey(name: 'total_draws') int totalDraws,
  });
}

/// @nodoc
class _$ColorStatsResponseCopyWithImpl<$Res, $Val extends ColorStatsResponse>
    implements $ColorStatsResponseCopyWith<$Res> {
  _$ColorStatsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ColorStatsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topPatterns = null,
    Object? colorCounts = null,
    Object? totalDraws = null,
  }) {
    return _then(
      _value.copyWith(
            topPatterns: null == topPatterns
                ? _value.topPatterns
                : topPatterns // ignore: cast_nullable_to_non_nullable
                      as List<ColorPattern>,
            colorCounts: null == colorCounts
                ? _value.colorCounts
                : colorCounts // ignore: cast_nullable_to_non_nullable
                      as Map<String, int>,
            totalDraws: null == totalDraws
                ? _value.totalDraws
                : totalDraws // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ColorStatsResponseImplCopyWith<$Res>
    implements $ColorStatsResponseCopyWith<$Res> {
  factory _$$ColorStatsResponseImplCopyWith(
    _$ColorStatsResponseImpl value,
    $Res Function(_$ColorStatsResponseImpl) then,
  ) = __$$ColorStatsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'top_patterns') List<ColorPattern> topPatterns,
    @JsonKey(name: 'color_counts') Map<String, int> colorCounts,
    @JsonKey(name: 'total_draws') int totalDraws,
  });
}

/// @nodoc
class __$$ColorStatsResponseImplCopyWithImpl<$Res>
    extends _$ColorStatsResponseCopyWithImpl<$Res, _$ColorStatsResponseImpl>
    implements _$$ColorStatsResponseImplCopyWith<$Res> {
  __$$ColorStatsResponseImplCopyWithImpl(
    _$ColorStatsResponseImpl _value,
    $Res Function(_$ColorStatsResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ColorStatsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topPatterns = null,
    Object? colorCounts = null,
    Object? totalDraws = null,
  }) {
    return _then(
      _$ColorStatsResponseImpl(
        topPatterns: null == topPatterns
            ? _value._topPatterns
            : topPatterns // ignore: cast_nullable_to_non_nullable
                  as List<ColorPattern>,
        colorCounts: null == colorCounts
            ? _value._colorCounts
            : colorCounts // ignore: cast_nullable_to_non_nullable
                  as Map<String, int>,
        totalDraws: null == totalDraws
            ? _value.totalDraws
            : totalDraws // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ColorStatsResponseImpl implements _ColorStatsResponse {
  const _$ColorStatsResponseImpl({
    @JsonKey(name: 'top_patterns')
    required final List<ColorPattern> topPatterns,
    @JsonKey(name: 'color_counts') required final Map<String, int> colorCounts,
    @JsonKey(name: 'total_draws') required this.totalDraws,
  }) : _topPatterns = topPatterns,
       _colorCounts = colorCounts;

  factory _$ColorStatsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ColorStatsResponseImplFromJson(json);

  final List<ColorPattern> _topPatterns;
  @override
  @JsonKey(name: 'top_patterns')
  List<ColorPattern> get topPatterns {
    if (_topPatterns is EqualUnmodifiableListView) return _topPatterns;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topPatterns);
  }

  final Map<String, int> _colorCounts;
  @override
  @JsonKey(name: 'color_counts')
  Map<String, int> get colorCounts {
    if (_colorCounts is EqualUnmodifiableMapView) return _colorCounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_colorCounts);
  }

  @override
  @JsonKey(name: 'total_draws')
  final int totalDraws;

  @override
  String toString() {
    return 'ColorStatsResponse(topPatterns: $topPatterns, colorCounts: $colorCounts, totalDraws: $totalDraws)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ColorStatsResponseImpl &&
            const DeepCollectionEquality().equals(
              other._topPatterns,
              _topPatterns,
            ) &&
            const DeepCollectionEquality().equals(
              other._colorCounts,
              _colorCounts,
            ) &&
            (identical(other.totalDraws, totalDraws) ||
                other.totalDraws == totalDraws));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_topPatterns),
    const DeepCollectionEquality().hash(_colorCounts),
    totalDraws,
  );

  /// Create a copy of ColorStatsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ColorStatsResponseImplCopyWith<_$ColorStatsResponseImpl> get copyWith =>
      __$$ColorStatsResponseImplCopyWithImpl<_$ColorStatsResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ColorStatsResponseImplToJson(this);
  }
}

abstract class _ColorStatsResponse implements ColorStatsResponse {
  const factory _ColorStatsResponse({
    @JsonKey(name: 'top_patterns')
    required final List<ColorPattern> topPatterns,
    @JsonKey(name: 'color_counts') required final Map<String, int> colorCounts,
    @JsonKey(name: 'total_draws') required final int totalDraws,
  }) = _$ColorStatsResponseImpl;

  factory _ColorStatsResponse.fromJson(Map<String, dynamic> json) =
      _$ColorStatsResponseImpl.fromJson;

  @override
  @JsonKey(name: 'top_patterns')
  List<ColorPattern> get topPatterns;
  @override
  @JsonKey(name: 'color_counts')
  Map<String, int> get colorCounts;
  @override
  @JsonKey(name: 'total_draws')
  int get totalDraws;

  /// Create a copy of ColorStatsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ColorStatsResponseImplCopyWith<_$ColorStatsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GridLineStat _$GridLineStatFromJson(Map<String, dynamic> json) {
  return _GridLineStat.fromJson(json);
}

/// @nodoc
mixin _$GridLineStat {
  int get line => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  double get probability => throw _privateConstructorUsedError;

  /// Serializes this GridLineStat to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GridLineStat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GridLineStatCopyWith<GridLineStat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GridLineStatCopyWith<$Res> {
  factory $GridLineStatCopyWith(
    GridLineStat value,
    $Res Function(GridLineStat) then,
  ) = _$GridLineStatCopyWithImpl<$Res, GridLineStat>;
  @useResult
  $Res call({int line, int count, double probability});
}

/// @nodoc
class _$GridLineStatCopyWithImpl<$Res, $Val extends GridLineStat>
    implements $GridLineStatCopyWith<$Res> {
  _$GridLineStatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GridLineStat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? line = null,
    Object? count = null,
    Object? probability = null,
  }) {
    return _then(
      _value.copyWith(
            line: null == line
                ? _value.line
                : line // ignore: cast_nullable_to_non_nullable
                      as int,
            count: null == count
                ? _value.count
                : count // ignore: cast_nullable_to_non_nullable
                      as int,
            probability: null == probability
                ? _value.probability
                : probability // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GridLineStatImplCopyWith<$Res>
    implements $GridLineStatCopyWith<$Res> {
  factory _$$GridLineStatImplCopyWith(
    _$GridLineStatImpl value,
    $Res Function(_$GridLineStatImpl) then,
  ) = __$$GridLineStatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int line, int count, double probability});
}

/// @nodoc
class __$$GridLineStatImplCopyWithImpl<$Res>
    extends _$GridLineStatCopyWithImpl<$Res, _$GridLineStatImpl>
    implements _$$GridLineStatImplCopyWith<$Res> {
  __$$GridLineStatImplCopyWithImpl(
    _$GridLineStatImpl _value,
    $Res Function(_$GridLineStatImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GridLineStat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? line = null,
    Object? count = null,
    Object? probability = null,
  }) {
    return _then(
      _$GridLineStatImpl(
        line: null == line
            ? _value.line
            : line // ignore: cast_nullable_to_non_nullable
                  as int,
        count: null == count
            ? _value.count
            : count // ignore: cast_nullable_to_non_nullable
                  as int,
        probability: null == probability
            ? _value.probability
            : probability // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GridLineStatImpl implements _GridLineStat {
  const _$GridLineStatImpl({
    required this.line,
    required this.count,
    required this.probability,
  });

  factory _$GridLineStatImpl.fromJson(Map<String, dynamic> json) =>
      _$$GridLineStatImplFromJson(json);

  @override
  final int line;
  @override
  final int count;
  @override
  final double probability;

  @override
  String toString() {
    return 'GridLineStat(line: $line, count: $count, probability: $probability)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GridLineStatImpl &&
            (identical(other.line, line) || other.line == line) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.probability, probability) ||
                other.probability == probability));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, line, count, probability);

  /// Create a copy of GridLineStat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GridLineStatImplCopyWith<_$GridLineStatImpl> get copyWith =>
      __$$GridLineStatImplCopyWithImpl<_$GridLineStatImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GridLineStatImplToJson(this);
  }
}

abstract class _GridLineStat implements GridLineStat {
  const factory _GridLineStat({
    required final int line,
    required final int count,
    required final double probability,
  }) = _$GridLineStatImpl;

  factory _GridLineStat.fromJson(Map<String, dynamic> json) =
      _$GridLineStatImpl.fromJson;

  @override
  int get line;
  @override
  int get count;
  @override
  double get probability;

  /// Create a copy of GridLineStat
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GridLineStatImplCopyWith<_$GridLineStatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GridPatternStat _$GridPatternStatFromJson(Map<String, dynamic> json) {
  return _GridPatternStat.fromJson(json);
}

/// @nodoc
mixin _$GridPatternStat {
  String get distribution => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  double get probability => throw _privateConstructorUsedError;

  /// Serializes this GridPatternStat to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GridPatternStat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GridPatternStatCopyWith<GridPatternStat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GridPatternStatCopyWith<$Res> {
  factory $GridPatternStatCopyWith(
    GridPatternStat value,
    $Res Function(GridPatternStat) then,
  ) = _$GridPatternStatCopyWithImpl<$Res, GridPatternStat>;
  @useResult
  $Res call({String distribution, int count, double probability});
}

/// @nodoc
class _$GridPatternStatCopyWithImpl<$Res, $Val extends GridPatternStat>
    implements $GridPatternStatCopyWith<$Res> {
  _$GridPatternStatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GridPatternStat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? distribution = null,
    Object? count = null,
    Object? probability = null,
  }) {
    return _then(
      _value.copyWith(
            distribution: null == distribution
                ? _value.distribution
                : distribution // ignore: cast_nullable_to_non_nullable
                      as String,
            count: null == count
                ? _value.count
                : count // ignore: cast_nullable_to_non_nullable
                      as int,
            probability: null == probability
                ? _value.probability
                : probability // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GridPatternStatImplCopyWith<$Res>
    implements $GridPatternStatCopyWith<$Res> {
  factory _$$GridPatternStatImplCopyWith(
    _$GridPatternStatImpl value,
    $Res Function(_$GridPatternStatImpl) then,
  ) = __$$GridPatternStatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String distribution, int count, double probability});
}

/// @nodoc
class __$$GridPatternStatImplCopyWithImpl<$Res>
    extends _$GridPatternStatCopyWithImpl<$Res, _$GridPatternStatImpl>
    implements _$$GridPatternStatImplCopyWith<$Res> {
  __$$GridPatternStatImplCopyWithImpl(
    _$GridPatternStatImpl _value,
    $Res Function(_$GridPatternStatImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GridPatternStat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? distribution = null,
    Object? count = null,
    Object? probability = null,
  }) {
    return _then(
      _$GridPatternStatImpl(
        distribution: null == distribution
            ? _value.distribution
            : distribution // ignore: cast_nullable_to_non_nullable
                  as String,
        count: null == count
            ? _value.count
            : count // ignore: cast_nullable_to_non_nullable
                  as int,
        probability: null == probability
            ? _value.probability
            : probability // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GridPatternStatImpl implements _GridPatternStat {
  const _$GridPatternStatImpl({
    required this.distribution,
    required this.count,
    required this.probability,
  });

  factory _$GridPatternStatImpl.fromJson(Map<String, dynamic> json) =>
      _$$GridPatternStatImplFromJson(json);

  @override
  final String distribution;
  @override
  final int count;
  @override
  final double probability;

  @override
  String toString() {
    return 'GridPatternStat(distribution: $distribution, count: $count, probability: $probability)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GridPatternStatImpl &&
            (identical(other.distribution, distribution) ||
                other.distribution == distribution) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.probability, probability) ||
                other.probability == probability));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, distribution, count, probability);

  /// Create a copy of GridPatternStat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GridPatternStatImplCopyWith<_$GridPatternStatImpl> get copyWith =>
      __$$GridPatternStatImplCopyWithImpl<_$GridPatternStatImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$GridPatternStatImplToJson(this);
  }
}

abstract class _GridPatternStat implements GridPatternStat {
  const factory _GridPatternStat({
    required final String distribution,
    required final int count,
    required final double probability,
  }) = _$GridPatternStatImpl;

  factory _GridPatternStat.fromJson(Map<String, dynamic> json) =
      _$GridPatternStatImpl.fromJson;

  @override
  String get distribution;
  @override
  int get count;
  @override
  double get probability;

  /// Create a copy of GridPatternStat
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GridPatternStatImplCopyWith<_$GridPatternStatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GridResponse _$GridResponseFromJson(Map<String, dynamic> json) {
  return _GridResponse.fromJson(json);
}

/// @nodoc
mixin _$GridResponse {
  @JsonKey(name: 'row_stats')
  List<GridLineStat> get rowStats => throw _privateConstructorUsedError;
  @JsonKey(name: 'col_stats')
  List<GridLineStat> get colStats => throw _privateConstructorUsedError;
  @JsonKey(name: 'top_row_patterns')
  List<GridPatternStat> get topRowPatterns =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'top_col_patterns')
  List<GridPatternStat> get topColPatterns =>
      throw _privateConstructorUsedError;

  /// Serializes this GridResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GridResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GridResponseCopyWith<GridResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GridResponseCopyWith<$Res> {
  factory $GridResponseCopyWith(
    GridResponse value,
    $Res Function(GridResponse) then,
  ) = _$GridResponseCopyWithImpl<$Res, GridResponse>;
  @useResult
  $Res call({
    @JsonKey(name: 'row_stats') List<GridLineStat> rowStats,
    @JsonKey(name: 'col_stats') List<GridLineStat> colStats,
    @JsonKey(name: 'top_row_patterns') List<GridPatternStat> topRowPatterns,
    @JsonKey(name: 'top_col_patterns') List<GridPatternStat> topColPatterns,
  });
}

/// @nodoc
class _$GridResponseCopyWithImpl<$Res, $Val extends GridResponse>
    implements $GridResponseCopyWith<$Res> {
  _$GridResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GridResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rowStats = null,
    Object? colStats = null,
    Object? topRowPatterns = null,
    Object? topColPatterns = null,
  }) {
    return _then(
      _value.copyWith(
            rowStats: null == rowStats
                ? _value.rowStats
                : rowStats // ignore: cast_nullable_to_non_nullable
                      as List<GridLineStat>,
            colStats: null == colStats
                ? _value.colStats
                : colStats // ignore: cast_nullable_to_non_nullable
                      as List<GridLineStat>,
            topRowPatterns: null == topRowPatterns
                ? _value.topRowPatterns
                : topRowPatterns // ignore: cast_nullable_to_non_nullable
                      as List<GridPatternStat>,
            topColPatterns: null == topColPatterns
                ? _value.topColPatterns
                : topColPatterns // ignore: cast_nullable_to_non_nullable
                      as List<GridPatternStat>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GridResponseImplCopyWith<$Res>
    implements $GridResponseCopyWith<$Res> {
  factory _$$GridResponseImplCopyWith(
    _$GridResponseImpl value,
    $Res Function(_$GridResponseImpl) then,
  ) = __$$GridResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'row_stats') List<GridLineStat> rowStats,
    @JsonKey(name: 'col_stats') List<GridLineStat> colStats,
    @JsonKey(name: 'top_row_patterns') List<GridPatternStat> topRowPatterns,
    @JsonKey(name: 'top_col_patterns') List<GridPatternStat> topColPatterns,
  });
}

/// @nodoc
class __$$GridResponseImplCopyWithImpl<$Res>
    extends _$GridResponseCopyWithImpl<$Res, _$GridResponseImpl>
    implements _$$GridResponseImplCopyWith<$Res> {
  __$$GridResponseImplCopyWithImpl(
    _$GridResponseImpl _value,
    $Res Function(_$GridResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GridResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rowStats = null,
    Object? colStats = null,
    Object? topRowPatterns = null,
    Object? topColPatterns = null,
  }) {
    return _then(
      _$GridResponseImpl(
        rowStats: null == rowStats
            ? _value._rowStats
            : rowStats // ignore: cast_nullable_to_non_nullable
                  as List<GridLineStat>,
        colStats: null == colStats
            ? _value._colStats
            : colStats // ignore: cast_nullable_to_non_nullable
                  as List<GridLineStat>,
        topRowPatterns: null == topRowPatterns
            ? _value._topRowPatterns
            : topRowPatterns // ignore: cast_nullable_to_non_nullable
                  as List<GridPatternStat>,
        topColPatterns: null == topColPatterns
            ? _value._topColPatterns
            : topColPatterns // ignore: cast_nullable_to_non_nullable
                  as List<GridPatternStat>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GridResponseImpl implements _GridResponse {
  const _$GridResponseImpl({
    @JsonKey(name: 'row_stats') required final List<GridLineStat> rowStats,
    @JsonKey(name: 'col_stats') required final List<GridLineStat> colStats,
    @JsonKey(name: 'top_row_patterns')
    required final List<GridPatternStat> topRowPatterns,
    @JsonKey(name: 'top_col_patterns')
    required final List<GridPatternStat> topColPatterns,
  }) : _rowStats = rowStats,
       _colStats = colStats,
       _topRowPatterns = topRowPatterns,
       _topColPatterns = topColPatterns;

  factory _$GridResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GridResponseImplFromJson(json);

  final List<GridLineStat> _rowStats;
  @override
  @JsonKey(name: 'row_stats')
  List<GridLineStat> get rowStats {
    if (_rowStats is EqualUnmodifiableListView) return _rowStats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rowStats);
  }

  final List<GridLineStat> _colStats;
  @override
  @JsonKey(name: 'col_stats')
  List<GridLineStat> get colStats {
    if (_colStats is EqualUnmodifiableListView) return _colStats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_colStats);
  }

  final List<GridPatternStat> _topRowPatterns;
  @override
  @JsonKey(name: 'top_row_patterns')
  List<GridPatternStat> get topRowPatterns {
    if (_topRowPatterns is EqualUnmodifiableListView) return _topRowPatterns;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topRowPatterns);
  }

  final List<GridPatternStat> _topColPatterns;
  @override
  @JsonKey(name: 'top_col_patterns')
  List<GridPatternStat> get topColPatterns {
    if (_topColPatterns is EqualUnmodifiableListView) return _topColPatterns;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topColPatterns);
  }

  @override
  String toString() {
    return 'GridResponse(rowStats: $rowStats, colStats: $colStats, topRowPatterns: $topRowPatterns, topColPatterns: $topColPatterns)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GridResponseImpl &&
            const DeepCollectionEquality().equals(other._rowStats, _rowStats) &&
            const DeepCollectionEquality().equals(other._colStats, _colStats) &&
            const DeepCollectionEquality().equals(
              other._topRowPatterns,
              _topRowPatterns,
            ) &&
            const DeepCollectionEquality().equals(
              other._topColPatterns,
              _topColPatterns,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_rowStats),
    const DeepCollectionEquality().hash(_colStats),
    const DeepCollectionEquality().hash(_topRowPatterns),
    const DeepCollectionEquality().hash(_topColPatterns),
  );

  /// Create a copy of GridResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GridResponseImplCopyWith<_$GridResponseImpl> get copyWith =>
      __$$GridResponseImplCopyWithImpl<_$GridResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GridResponseImplToJson(this);
  }
}

abstract class _GridResponse implements GridResponse {
  const factory _GridResponse({
    @JsonKey(name: 'row_stats') required final List<GridLineStat> rowStats,
    @JsonKey(name: 'col_stats') required final List<GridLineStat> colStats,
    @JsonKey(name: 'top_row_patterns')
    required final List<GridPatternStat> topRowPatterns,
    @JsonKey(name: 'top_col_patterns')
    required final List<GridPatternStat> topColPatterns,
  }) = _$GridResponseImpl;

  factory _GridResponse.fromJson(Map<String, dynamic> json) =
      _$GridResponseImpl.fromJson;

  @override
  @JsonKey(name: 'row_stats')
  List<GridLineStat> get rowStats;
  @override
  @JsonKey(name: 'col_stats')
  List<GridLineStat> get colStats;
  @override
  @JsonKey(name: 'top_row_patterns')
  List<GridPatternStat> get topRowPatterns;
  @override
  @JsonKey(name: 'top_col_patterns')
  List<GridPatternStat> get topColPatterns;

  /// Create a copy of GridResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GridResponseImplCopyWith<_$GridResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GridPatternCell _$GridPatternCellFromJson(Map<String, dynamic> json) {
  return _GridPatternCell.fromJson(json);
}

/// @nodoc
mixin _$GridPatternCell {
  int get number => throw _privateConstructorUsedError;
  int get row => throw _privateConstructorUsedError;
  int get col => throw _privateConstructorUsedError;
  @JsonKey(name: 'row_prob')
  double get rowProb => throw _privateConstructorUsedError;
  @JsonKey(name: 'col_prob')
  double get colProb => throw _privateConstructorUsedError;
  double get score => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_empty')
  bool get isEmpty => throw _privateConstructorUsedError;

  /// Serializes this GridPatternCell to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GridPatternCell
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GridPatternCellCopyWith<GridPatternCell> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GridPatternCellCopyWith<$Res> {
  factory $GridPatternCellCopyWith(
    GridPatternCell value,
    $Res Function(GridPatternCell) then,
  ) = _$GridPatternCellCopyWithImpl<$Res, GridPatternCell>;
  @useResult
  $Res call({
    int number,
    int row,
    int col,
    @JsonKey(name: 'row_prob') double rowProb,
    @JsonKey(name: 'col_prob') double colProb,
    double score,
    @JsonKey(name: 'is_empty') bool isEmpty,
  });
}

/// @nodoc
class _$GridPatternCellCopyWithImpl<$Res, $Val extends GridPatternCell>
    implements $GridPatternCellCopyWith<$Res> {
  _$GridPatternCellCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GridPatternCell
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? row = null,
    Object? col = null,
    Object? rowProb = null,
    Object? colProb = null,
    Object? score = null,
    Object? isEmpty = null,
  }) {
    return _then(
      _value.copyWith(
            number: null == number
                ? _value.number
                : number // ignore: cast_nullable_to_non_nullable
                      as int,
            row: null == row
                ? _value.row
                : row // ignore: cast_nullable_to_non_nullable
                      as int,
            col: null == col
                ? _value.col
                : col // ignore: cast_nullable_to_non_nullable
                      as int,
            rowProb: null == rowProb
                ? _value.rowProb
                : rowProb // ignore: cast_nullable_to_non_nullable
                      as double,
            colProb: null == colProb
                ? _value.colProb
                : colProb // ignore: cast_nullable_to_non_nullable
                      as double,
            score: null == score
                ? _value.score
                : score // ignore: cast_nullable_to_non_nullable
                      as double,
            isEmpty: null == isEmpty
                ? _value.isEmpty
                : isEmpty // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GridPatternCellImplCopyWith<$Res>
    implements $GridPatternCellCopyWith<$Res> {
  factory _$$GridPatternCellImplCopyWith(
    _$GridPatternCellImpl value,
    $Res Function(_$GridPatternCellImpl) then,
  ) = __$$GridPatternCellImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int number,
    int row,
    int col,
    @JsonKey(name: 'row_prob') double rowProb,
    @JsonKey(name: 'col_prob') double colProb,
    double score,
    @JsonKey(name: 'is_empty') bool isEmpty,
  });
}

/// @nodoc
class __$$GridPatternCellImplCopyWithImpl<$Res>
    extends _$GridPatternCellCopyWithImpl<$Res, _$GridPatternCellImpl>
    implements _$$GridPatternCellImplCopyWith<$Res> {
  __$$GridPatternCellImplCopyWithImpl(
    _$GridPatternCellImpl _value,
    $Res Function(_$GridPatternCellImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GridPatternCell
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? row = null,
    Object? col = null,
    Object? rowProb = null,
    Object? colProb = null,
    Object? score = null,
    Object? isEmpty = null,
  }) {
    return _then(
      _$GridPatternCellImpl(
        number: null == number
            ? _value.number
            : number // ignore: cast_nullable_to_non_nullable
                  as int,
        row: null == row
            ? _value.row
            : row // ignore: cast_nullable_to_non_nullable
                  as int,
        col: null == col
            ? _value.col
            : col // ignore: cast_nullable_to_non_nullable
                  as int,
        rowProb: null == rowProb
            ? _value.rowProb
            : rowProb // ignore: cast_nullable_to_non_nullable
                  as double,
        colProb: null == colProb
            ? _value.colProb
            : colProb // ignore: cast_nullable_to_non_nullable
                  as double,
        score: null == score
            ? _value.score
            : score // ignore: cast_nullable_to_non_nullable
                  as double,
        isEmpty: null == isEmpty
            ? _value.isEmpty
            : isEmpty // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GridPatternCellImpl implements _GridPatternCell {
  const _$GridPatternCellImpl({
    required this.number,
    required this.row,
    required this.col,
    @JsonKey(name: 'row_prob') required this.rowProb,
    @JsonKey(name: 'col_prob') required this.colProb,
    required this.score,
    @JsonKey(name: 'is_empty') required this.isEmpty,
  });

  factory _$GridPatternCellImpl.fromJson(Map<String, dynamic> json) =>
      _$$GridPatternCellImplFromJson(json);

  @override
  final int number;
  @override
  final int row;
  @override
  final int col;
  @override
  @JsonKey(name: 'row_prob')
  final double rowProb;
  @override
  @JsonKey(name: 'col_prob')
  final double colProb;
  @override
  final double score;
  @override
  @JsonKey(name: 'is_empty')
  final bool isEmpty;

  @override
  String toString() {
    return 'GridPatternCell(number: $number, row: $row, col: $col, rowProb: $rowProb, colProb: $colProb, score: $score, isEmpty: $isEmpty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GridPatternCellImpl &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.row, row) || other.row == row) &&
            (identical(other.col, col) || other.col == col) &&
            (identical(other.rowProb, rowProb) || other.rowProb == rowProb) &&
            (identical(other.colProb, colProb) || other.colProb == colProb) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.isEmpty, isEmpty) || other.isEmpty == isEmpty));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    number,
    row,
    col,
    rowProb,
    colProb,
    score,
    isEmpty,
  );

  /// Create a copy of GridPatternCell
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GridPatternCellImplCopyWith<_$GridPatternCellImpl> get copyWith =>
      __$$GridPatternCellImplCopyWithImpl<_$GridPatternCellImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$GridPatternCellImplToJson(this);
  }
}

abstract class _GridPatternCell implements GridPatternCell {
  const factory _GridPatternCell({
    required final int number,
    required final int row,
    required final int col,
    @JsonKey(name: 'row_prob') required final double rowProb,
    @JsonKey(name: 'col_prob') required final double colProb,
    required final double score,
    @JsonKey(name: 'is_empty') required final bool isEmpty,
  }) = _$GridPatternCellImpl;

  factory _GridPatternCell.fromJson(Map<String, dynamic> json) =
      _$GridPatternCellImpl.fromJson;

  @override
  int get number;
  @override
  int get row;
  @override
  int get col;
  @override
  @JsonKey(name: 'row_prob')
  double get rowProb;
  @override
  @JsonKey(name: 'col_prob')
  double get colProb;
  @override
  double get score;
  @override
  @JsonKey(name: 'is_empty')
  bool get isEmpty;

  /// Create a copy of GridPatternCell
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GridPatternCellImplCopyWith<_$GridPatternCellImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GridPatternResponse _$GridPatternResponseFromJson(Map<String, dynamic> json) {
  return _GridPatternResponse.fromJson(json);
}

/// @nodoc
mixin _$GridPatternResponse {
  List<List<GridPatternCell>> get cells => throw _privateConstructorUsedError;
  @JsonKey(name: 'row_scores')
  List<double> get rowScores => throw _privateConstructorUsedError;
  @JsonKey(name: 'col_scores')
  List<double> get colScores => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_score')
  double get maxScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'latest_draw_no')
  int get latestDrawNo => throw _privateConstructorUsedError;

  /// Serializes this GridPatternResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GridPatternResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GridPatternResponseCopyWith<GridPatternResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GridPatternResponseCopyWith<$Res> {
  factory $GridPatternResponseCopyWith(
    GridPatternResponse value,
    $Res Function(GridPatternResponse) then,
  ) = _$GridPatternResponseCopyWithImpl<$Res, GridPatternResponse>;
  @useResult
  $Res call({
    List<List<GridPatternCell>> cells,
    @JsonKey(name: 'row_scores') List<double> rowScores,
    @JsonKey(name: 'col_scores') List<double> colScores,
    @JsonKey(name: 'max_score') double maxScore,
    @JsonKey(name: 'latest_draw_no') int latestDrawNo,
  });
}

/// @nodoc
class _$GridPatternResponseCopyWithImpl<$Res, $Val extends GridPatternResponse>
    implements $GridPatternResponseCopyWith<$Res> {
  _$GridPatternResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GridPatternResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cells = null,
    Object? rowScores = null,
    Object? colScores = null,
    Object? maxScore = null,
    Object? latestDrawNo = null,
  }) {
    return _then(
      _value.copyWith(
            cells: null == cells
                ? _value.cells
                : cells // ignore: cast_nullable_to_non_nullable
                      as List<List<GridPatternCell>>,
            rowScores: null == rowScores
                ? _value.rowScores
                : rowScores // ignore: cast_nullable_to_non_nullable
                      as List<double>,
            colScores: null == colScores
                ? _value.colScores
                : colScores // ignore: cast_nullable_to_non_nullable
                      as List<double>,
            maxScore: null == maxScore
                ? _value.maxScore
                : maxScore // ignore: cast_nullable_to_non_nullable
                      as double,
            latestDrawNo: null == latestDrawNo
                ? _value.latestDrawNo
                : latestDrawNo // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GridPatternResponseImplCopyWith<$Res>
    implements $GridPatternResponseCopyWith<$Res> {
  factory _$$GridPatternResponseImplCopyWith(
    _$GridPatternResponseImpl value,
    $Res Function(_$GridPatternResponseImpl) then,
  ) = __$$GridPatternResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<List<GridPatternCell>> cells,
    @JsonKey(name: 'row_scores') List<double> rowScores,
    @JsonKey(name: 'col_scores') List<double> colScores,
    @JsonKey(name: 'max_score') double maxScore,
    @JsonKey(name: 'latest_draw_no') int latestDrawNo,
  });
}

/// @nodoc
class __$$GridPatternResponseImplCopyWithImpl<$Res>
    extends _$GridPatternResponseCopyWithImpl<$Res, _$GridPatternResponseImpl>
    implements _$$GridPatternResponseImplCopyWith<$Res> {
  __$$GridPatternResponseImplCopyWithImpl(
    _$GridPatternResponseImpl _value,
    $Res Function(_$GridPatternResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GridPatternResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cells = null,
    Object? rowScores = null,
    Object? colScores = null,
    Object? maxScore = null,
    Object? latestDrawNo = null,
  }) {
    return _then(
      _$GridPatternResponseImpl(
        cells: null == cells
            ? _value._cells
            : cells // ignore: cast_nullable_to_non_nullable
                  as List<List<GridPatternCell>>,
        rowScores: null == rowScores
            ? _value._rowScores
            : rowScores // ignore: cast_nullable_to_non_nullable
                  as List<double>,
        colScores: null == colScores
            ? _value._colScores
            : colScores // ignore: cast_nullable_to_non_nullable
                  as List<double>,
        maxScore: null == maxScore
            ? _value.maxScore
            : maxScore // ignore: cast_nullable_to_non_nullable
                  as double,
        latestDrawNo: null == latestDrawNo
            ? _value.latestDrawNo
            : latestDrawNo // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GridPatternResponseImpl implements _GridPatternResponse {
  const _$GridPatternResponseImpl({
    required final List<List<GridPatternCell>> cells,
    @JsonKey(name: 'row_scores') required final List<double> rowScores,
    @JsonKey(name: 'col_scores') required final List<double> colScores,
    @JsonKey(name: 'max_score') required this.maxScore,
    @JsonKey(name: 'latest_draw_no') required this.latestDrawNo,
  }) : _cells = cells,
       _rowScores = rowScores,
       _colScores = colScores;

  factory _$GridPatternResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GridPatternResponseImplFromJson(json);

  final List<List<GridPatternCell>> _cells;
  @override
  List<List<GridPatternCell>> get cells {
    if (_cells is EqualUnmodifiableListView) return _cells;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cells);
  }

  final List<double> _rowScores;
  @override
  @JsonKey(name: 'row_scores')
  List<double> get rowScores {
    if (_rowScores is EqualUnmodifiableListView) return _rowScores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rowScores);
  }

  final List<double> _colScores;
  @override
  @JsonKey(name: 'col_scores')
  List<double> get colScores {
    if (_colScores is EqualUnmodifiableListView) return _colScores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_colScores);
  }

  @override
  @JsonKey(name: 'max_score')
  final double maxScore;
  @override
  @JsonKey(name: 'latest_draw_no')
  final int latestDrawNo;

  @override
  String toString() {
    return 'GridPatternResponse(cells: $cells, rowScores: $rowScores, colScores: $colScores, maxScore: $maxScore, latestDrawNo: $latestDrawNo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GridPatternResponseImpl &&
            const DeepCollectionEquality().equals(other._cells, _cells) &&
            const DeepCollectionEquality().equals(
              other._rowScores,
              _rowScores,
            ) &&
            const DeepCollectionEquality().equals(
              other._colScores,
              _colScores,
            ) &&
            (identical(other.maxScore, maxScore) ||
                other.maxScore == maxScore) &&
            (identical(other.latestDrawNo, latestDrawNo) ||
                other.latestDrawNo == latestDrawNo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_cells),
    const DeepCollectionEquality().hash(_rowScores),
    const DeepCollectionEquality().hash(_colScores),
    maxScore,
    latestDrawNo,
  );

  /// Create a copy of GridPatternResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GridPatternResponseImplCopyWith<_$GridPatternResponseImpl> get copyWith =>
      __$$GridPatternResponseImplCopyWithImpl<_$GridPatternResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$GridPatternResponseImplToJson(this);
  }
}

abstract class _GridPatternResponse implements GridPatternResponse {
  const factory _GridPatternResponse({
    required final List<List<GridPatternCell>> cells,
    @JsonKey(name: 'row_scores') required final List<double> rowScores,
    @JsonKey(name: 'col_scores') required final List<double> colScores,
    @JsonKey(name: 'max_score') required final double maxScore,
    @JsonKey(name: 'latest_draw_no') required final int latestDrawNo,
  }) = _$GridPatternResponseImpl;

  factory _GridPatternResponse.fromJson(Map<String, dynamic> json) =
      _$GridPatternResponseImpl.fromJson;

  @override
  List<List<GridPatternCell>> get cells;
  @override
  @JsonKey(name: 'row_scores')
  List<double> get rowScores;
  @override
  @JsonKey(name: 'col_scores')
  List<double> get colScores;
  @override
  @JsonKey(name: 'max_score')
  double get maxScore;
  @override
  @JsonKey(name: 'latest_draw_no')
  int get latestDrawNo;

  /// Create a copy of GridPatternResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GridPatternResponseImplCopyWith<_$GridPatternResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BayesianNumber _$BayesianNumberFromJson(Map<String, dynamic> json) {
  return _BayesianNumber.fromJson(json);
}

/// @nodoc
mixin _$BayesianNumber {
  int get number => throw _privateConstructorUsedError;
  double get prior => throw _privateConstructorUsedError;
  double get likelihood => throw _privateConstructorUsedError;
  double get posterior => throw _privateConstructorUsedError;
  @JsonKey(name: 'recent_count')
  int get recentCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'expected_count')
  double get expectedCount => throw _privateConstructorUsedError;
  double get deviation => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_appear_draw')
  int get lastAppearDraw => throw _privateConstructorUsedError;
  @JsonKey(name: 'gap_since_last')
  int get gapSinceLast => throw _privateConstructorUsedError;

  /// Serializes this BayesianNumber to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BayesianNumber
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BayesianNumberCopyWith<BayesianNumber> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BayesianNumberCopyWith<$Res> {
  factory $BayesianNumberCopyWith(
    BayesianNumber value,
    $Res Function(BayesianNumber) then,
  ) = _$BayesianNumberCopyWithImpl<$Res, BayesianNumber>;
  @useResult
  $Res call({
    int number,
    double prior,
    double likelihood,
    double posterior,
    @JsonKey(name: 'recent_count') int recentCount,
    @JsonKey(name: 'expected_count') double expectedCount,
    double deviation,
    String status,
    @JsonKey(name: 'last_appear_draw') int lastAppearDraw,
    @JsonKey(name: 'gap_since_last') int gapSinceLast,
  });
}

/// @nodoc
class _$BayesianNumberCopyWithImpl<$Res, $Val extends BayesianNumber>
    implements $BayesianNumberCopyWith<$Res> {
  _$BayesianNumberCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BayesianNumber
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? prior = null,
    Object? likelihood = null,
    Object? posterior = null,
    Object? recentCount = null,
    Object? expectedCount = null,
    Object? deviation = null,
    Object? status = null,
    Object? lastAppearDraw = null,
    Object? gapSinceLast = null,
  }) {
    return _then(
      _value.copyWith(
            number: null == number
                ? _value.number
                : number // ignore: cast_nullable_to_non_nullable
                      as int,
            prior: null == prior
                ? _value.prior
                : prior // ignore: cast_nullable_to_non_nullable
                      as double,
            likelihood: null == likelihood
                ? _value.likelihood
                : likelihood // ignore: cast_nullable_to_non_nullable
                      as double,
            posterior: null == posterior
                ? _value.posterior
                : posterior // ignore: cast_nullable_to_non_nullable
                      as double,
            recentCount: null == recentCount
                ? _value.recentCount
                : recentCount // ignore: cast_nullable_to_non_nullable
                      as int,
            expectedCount: null == expectedCount
                ? _value.expectedCount
                : expectedCount // ignore: cast_nullable_to_non_nullable
                      as double,
            deviation: null == deviation
                ? _value.deviation
                : deviation // ignore: cast_nullable_to_non_nullable
                      as double,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            lastAppearDraw: null == lastAppearDraw
                ? _value.lastAppearDraw
                : lastAppearDraw // ignore: cast_nullable_to_non_nullable
                      as int,
            gapSinceLast: null == gapSinceLast
                ? _value.gapSinceLast
                : gapSinceLast // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BayesianNumberImplCopyWith<$Res>
    implements $BayesianNumberCopyWith<$Res> {
  factory _$$BayesianNumberImplCopyWith(
    _$BayesianNumberImpl value,
    $Res Function(_$BayesianNumberImpl) then,
  ) = __$$BayesianNumberImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int number,
    double prior,
    double likelihood,
    double posterior,
    @JsonKey(name: 'recent_count') int recentCount,
    @JsonKey(name: 'expected_count') double expectedCount,
    double deviation,
    String status,
    @JsonKey(name: 'last_appear_draw') int lastAppearDraw,
    @JsonKey(name: 'gap_since_last') int gapSinceLast,
  });
}

/// @nodoc
class __$$BayesianNumberImplCopyWithImpl<$Res>
    extends _$BayesianNumberCopyWithImpl<$Res, _$BayesianNumberImpl>
    implements _$$BayesianNumberImplCopyWith<$Res> {
  __$$BayesianNumberImplCopyWithImpl(
    _$BayesianNumberImpl _value,
    $Res Function(_$BayesianNumberImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BayesianNumber
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? prior = null,
    Object? likelihood = null,
    Object? posterior = null,
    Object? recentCount = null,
    Object? expectedCount = null,
    Object? deviation = null,
    Object? status = null,
    Object? lastAppearDraw = null,
    Object? gapSinceLast = null,
  }) {
    return _then(
      _$BayesianNumberImpl(
        number: null == number
            ? _value.number
            : number // ignore: cast_nullable_to_non_nullable
                  as int,
        prior: null == prior
            ? _value.prior
            : prior // ignore: cast_nullable_to_non_nullable
                  as double,
        likelihood: null == likelihood
            ? _value.likelihood
            : likelihood // ignore: cast_nullable_to_non_nullable
                  as double,
        posterior: null == posterior
            ? _value.posterior
            : posterior // ignore: cast_nullable_to_non_nullable
                  as double,
        recentCount: null == recentCount
            ? _value.recentCount
            : recentCount // ignore: cast_nullable_to_non_nullable
                  as int,
        expectedCount: null == expectedCount
            ? _value.expectedCount
            : expectedCount // ignore: cast_nullable_to_non_nullable
                  as double,
        deviation: null == deviation
            ? _value.deviation
            : deviation // ignore: cast_nullable_to_non_nullable
                  as double,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        lastAppearDraw: null == lastAppearDraw
            ? _value.lastAppearDraw
            : lastAppearDraw // ignore: cast_nullable_to_non_nullable
                  as int,
        gapSinceLast: null == gapSinceLast
            ? _value.gapSinceLast
            : gapSinceLast // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BayesianNumberImpl implements _BayesianNumber {
  const _$BayesianNumberImpl({
    required this.number,
    required this.prior,
    required this.likelihood,
    required this.posterior,
    @JsonKey(name: 'recent_count') required this.recentCount,
    @JsonKey(name: 'expected_count') required this.expectedCount,
    required this.deviation,
    required this.status,
    @JsonKey(name: 'last_appear_draw') required this.lastAppearDraw,
    @JsonKey(name: 'gap_since_last') required this.gapSinceLast,
  });

  factory _$BayesianNumberImpl.fromJson(Map<String, dynamic> json) =>
      _$$BayesianNumberImplFromJson(json);

  @override
  final int number;
  @override
  final double prior;
  @override
  final double likelihood;
  @override
  final double posterior;
  @override
  @JsonKey(name: 'recent_count')
  final int recentCount;
  @override
  @JsonKey(name: 'expected_count')
  final double expectedCount;
  @override
  final double deviation;
  @override
  final String status;
  @override
  @JsonKey(name: 'last_appear_draw')
  final int lastAppearDraw;
  @override
  @JsonKey(name: 'gap_since_last')
  final int gapSinceLast;

  @override
  String toString() {
    return 'BayesianNumber(number: $number, prior: $prior, likelihood: $likelihood, posterior: $posterior, recentCount: $recentCount, expectedCount: $expectedCount, deviation: $deviation, status: $status, lastAppearDraw: $lastAppearDraw, gapSinceLast: $gapSinceLast)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BayesianNumberImpl &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.prior, prior) || other.prior == prior) &&
            (identical(other.likelihood, likelihood) ||
                other.likelihood == likelihood) &&
            (identical(other.posterior, posterior) ||
                other.posterior == posterior) &&
            (identical(other.recentCount, recentCount) ||
                other.recentCount == recentCount) &&
            (identical(other.expectedCount, expectedCount) ||
                other.expectedCount == expectedCount) &&
            (identical(other.deviation, deviation) ||
                other.deviation == deviation) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.lastAppearDraw, lastAppearDraw) ||
                other.lastAppearDraw == lastAppearDraw) &&
            (identical(other.gapSinceLast, gapSinceLast) ||
                other.gapSinceLast == gapSinceLast));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    number,
    prior,
    likelihood,
    posterior,
    recentCount,
    expectedCount,
    deviation,
    status,
    lastAppearDraw,
    gapSinceLast,
  );

  /// Create a copy of BayesianNumber
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BayesianNumberImplCopyWith<_$BayesianNumberImpl> get copyWith =>
      __$$BayesianNumberImplCopyWithImpl<_$BayesianNumberImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$BayesianNumberImplToJson(this);
  }
}

abstract class _BayesianNumber implements BayesianNumber {
  const factory _BayesianNumber({
    required final int number,
    required final double prior,
    required final double likelihood,
    required final double posterior,
    @JsonKey(name: 'recent_count') required final int recentCount,
    @JsonKey(name: 'expected_count') required final double expectedCount,
    required final double deviation,
    required final String status,
    @JsonKey(name: 'last_appear_draw') required final int lastAppearDraw,
    @JsonKey(name: 'gap_since_last') required final int gapSinceLast,
  }) = _$BayesianNumberImpl;

  factory _BayesianNumber.fromJson(Map<String, dynamic> json) =
      _$BayesianNumberImpl.fromJson;

  @override
  int get number;
  @override
  double get prior;
  @override
  double get likelihood;
  @override
  double get posterior;
  @override
  @JsonKey(name: 'recent_count')
  int get recentCount;
  @override
  @JsonKey(name: 'expected_count')
  double get expectedCount;
  @override
  double get deviation;
  @override
  String get status;
  @override
  @JsonKey(name: 'last_appear_draw')
  int get lastAppearDraw;
  @override
  @JsonKey(name: 'gap_since_last')
  int get gapSinceLast;

  /// Create a copy of BayesianNumber
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BayesianNumberImplCopyWith<_$BayesianNumberImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BayesianResponse _$BayesianResponseFromJson(Map<String, dynamic> json) {
  return _BayesianResponse.fromJson(json);
}

/// @nodoc
mixin _$BayesianResponse {
  List<BayesianNumber> get numbers => throw _privateConstructorUsedError;
  @JsonKey(name: 'hot_numbers')
  List<BayesianNumber> get hotNumbers => throw _privateConstructorUsedError;
  @JsonKey(name: 'cold_numbers')
  List<BayesianNumber> get coldNumbers => throw _privateConstructorUsedError;
  @JsonKey(name: 'window_size')
  int get windowSize => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_draws')
  int get totalDraws => throw _privateConstructorUsedError;

  /// Serializes this BayesianResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BayesianResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BayesianResponseCopyWith<BayesianResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BayesianResponseCopyWith<$Res> {
  factory $BayesianResponseCopyWith(
    BayesianResponse value,
    $Res Function(BayesianResponse) then,
  ) = _$BayesianResponseCopyWithImpl<$Res, BayesianResponse>;
  @useResult
  $Res call({
    List<BayesianNumber> numbers,
    @JsonKey(name: 'hot_numbers') List<BayesianNumber> hotNumbers,
    @JsonKey(name: 'cold_numbers') List<BayesianNumber> coldNumbers,
    @JsonKey(name: 'window_size') int windowSize,
    @JsonKey(name: 'total_draws') int totalDraws,
  });
}

/// @nodoc
class _$BayesianResponseCopyWithImpl<$Res, $Val extends BayesianResponse>
    implements $BayesianResponseCopyWith<$Res> {
  _$BayesianResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BayesianResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numbers = null,
    Object? hotNumbers = null,
    Object? coldNumbers = null,
    Object? windowSize = null,
    Object? totalDraws = null,
  }) {
    return _then(
      _value.copyWith(
            numbers: null == numbers
                ? _value.numbers
                : numbers // ignore: cast_nullable_to_non_nullable
                      as List<BayesianNumber>,
            hotNumbers: null == hotNumbers
                ? _value.hotNumbers
                : hotNumbers // ignore: cast_nullable_to_non_nullable
                      as List<BayesianNumber>,
            coldNumbers: null == coldNumbers
                ? _value.coldNumbers
                : coldNumbers // ignore: cast_nullable_to_non_nullable
                      as List<BayesianNumber>,
            windowSize: null == windowSize
                ? _value.windowSize
                : windowSize // ignore: cast_nullable_to_non_nullable
                      as int,
            totalDraws: null == totalDraws
                ? _value.totalDraws
                : totalDraws // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BayesianResponseImplCopyWith<$Res>
    implements $BayesianResponseCopyWith<$Res> {
  factory _$$BayesianResponseImplCopyWith(
    _$BayesianResponseImpl value,
    $Res Function(_$BayesianResponseImpl) then,
  ) = __$$BayesianResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<BayesianNumber> numbers,
    @JsonKey(name: 'hot_numbers') List<BayesianNumber> hotNumbers,
    @JsonKey(name: 'cold_numbers') List<BayesianNumber> coldNumbers,
    @JsonKey(name: 'window_size') int windowSize,
    @JsonKey(name: 'total_draws') int totalDraws,
  });
}

/// @nodoc
class __$$BayesianResponseImplCopyWithImpl<$Res>
    extends _$BayesianResponseCopyWithImpl<$Res, _$BayesianResponseImpl>
    implements _$$BayesianResponseImplCopyWith<$Res> {
  __$$BayesianResponseImplCopyWithImpl(
    _$BayesianResponseImpl _value,
    $Res Function(_$BayesianResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BayesianResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numbers = null,
    Object? hotNumbers = null,
    Object? coldNumbers = null,
    Object? windowSize = null,
    Object? totalDraws = null,
  }) {
    return _then(
      _$BayesianResponseImpl(
        numbers: null == numbers
            ? _value._numbers
            : numbers // ignore: cast_nullable_to_non_nullable
                  as List<BayesianNumber>,
        hotNumbers: null == hotNumbers
            ? _value._hotNumbers
            : hotNumbers // ignore: cast_nullable_to_non_nullable
                  as List<BayesianNumber>,
        coldNumbers: null == coldNumbers
            ? _value._coldNumbers
            : coldNumbers // ignore: cast_nullable_to_non_nullable
                  as List<BayesianNumber>,
        windowSize: null == windowSize
            ? _value.windowSize
            : windowSize // ignore: cast_nullable_to_non_nullable
                  as int,
        totalDraws: null == totalDraws
            ? _value.totalDraws
            : totalDraws // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BayesianResponseImpl implements _BayesianResponse {
  const _$BayesianResponseImpl({
    required final List<BayesianNumber> numbers,
    @JsonKey(name: 'hot_numbers')
    required final List<BayesianNumber> hotNumbers,
    @JsonKey(name: 'cold_numbers')
    required final List<BayesianNumber> coldNumbers,
    @JsonKey(name: 'window_size') required this.windowSize,
    @JsonKey(name: 'total_draws') required this.totalDraws,
  }) : _numbers = numbers,
       _hotNumbers = hotNumbers,
       _coldNumbers = coldNumbers;

  factory _$BayesianResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BayesianResponseImplFromJson(json);

  final List<BayesianNumber> _numbers;
  @override
  List<BayesianNumber> get numbers {
    if (_numbers is EqualUnmodifiableListView) return _numbers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_numbers);
  }

  final List<BayesianNumber> _hotNumbers;
  @override
  @JsonKey(name: 'hot_numbers')
  List<BayesianNumber> get hotNumbers {
    if (_hotNumbers is EqualUnmodifiableListView) return _hotNumbers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hotNumbers);
  }

  final List<BayesianNumber> _coldNumbers;
  @override
  @JsonKey(name: 'cold_numbers')
  List<BayesianNumber> get coldNumbers {
    if (_coldNumbers is EqualUnmodifiableListView) return _coldNumbers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_coldNumbers);
  }

  @override
  @JsonKey(name: 'window_size')
  final int windowSize;
  @override
  @JsonKey(name: 'total_draws')
  final int totalDraws;

  @override
  String toString() {
    return 'BayesianResponse(numbers: $numbers, hotNumbers: $hotNumbers, coldNumbers: $coldNumbers, windowSize: $windowSize, totalDraws: $totalDraws)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BayesianResponseImpl &&
            const DeepCollectionEquality().equals(other._numbers, _numbers) &&
            const DeepCollectionEquality().equals(
              other._hotNumbers,
              _hotNumbers,
            ) &&
            const DeepCollectionEquality().equals(
              other._coldNumbers,
              _coldNumbers,
            ) &&
            (identical(other.windowSize, windowSize) ||
                other.windowSize == windowSize) &&
            (identical(other.totalDraws, totalDraws) ||
                other.totalDraws == totalDraws));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_numbers),
    const DeepCollectionEquality().hash(_hotNumbers),
    const DeepCollectionEquality().hash(_coldNumbers),
    windowSize,
    totalDraws,
  );

  /// Create a copy of BayesianResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BayesianResponseImplCopyWith<_$BayesianResponseImpl> get copyWith =>
      __$$BayesianResponseImplCopyWithImpl<_$BayesianResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$BayesianResponseImplToJson(this);
  }
}

abstract class _BayesianResponse implements BayesianResponse {
  const factory _BayesianResponse({
    required final List<BayesianNumber> numbers,
    @JsonKey(name: 'hot_numbers')
    required final List<BayesianNumber> hotNumbers,
    @JsonKey(name: 'cold_numbers')
    required final List<BayesianNumber> coldNumbers,
    @JsonKey(name: 'window_size') required final int windowSize,
    @JsonKey(name: 'total_draws') required final int totalDraws,
  }) = _$BayesianResponseImpl;

  factory _BayesianResponse.fromJson(Map<String, dynamic> json) =
      _$BayesianResponseImpl.fromJson;

  @override
  List<BayesianNumber> get numbers;
  @override
  @JsonKey(name: 'hot_numbers')
  List<BayesianNumber> get hotNumbers;
  @override
  @JsonKey(name: 'cold_numbers')
  List<BayesianNumber> get coldNumbers;
  @override
  @JsonKey(name: 'window_size')
  int get windowSize;
  @override
  @JsonKey(name: 'total_draws')
  int get totalDraws;

  /// Create a copy of BayesianResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BayesianResponseImplCopyWith<_$BayesianResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BayesianHistoryEntry _$BayesianHistoryEntryFromJson(Map<String, dynamic> json) {
  return _BayesianHistoryEntry.fromJson(json);
}

/// @nodoc
mixin _$BayesianHistoryEntry {
  @JsonKey(name: 'draw_no')
  int get drawNo => throw _privateConstructorUsedError;
  double get prior => throw _privateConstructorUsedError;
  double get posterior => throw _privateConstructorUsedError;
  bool get appeared => throw _privateConstructorUsedError;

  /// Serializes this BayesianHistoryEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BayesianHistoryEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BayesianHistoryEntryCopyWith<BayesianHistoryEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BayesianHistoryEntryCopyWith<$Res> {
  factory $BayesianHistoryEntryCopyWith(
    BayesianHistoryEntry value,
    $Res Function(BayesianHistoryEntry) then,
  ) = _$BayesianHistoryEntryCopyWithImpl<$Res, BayesianHistoryEntry>;
  @useResult
  $Res call({
    @JsonKey(name: 'draw_no') int drawNo,
    double prior,
    double posterior,
    bool appeared,
  });
}

/// @nodoc
class _$BayesianHistoryEntryCopyWithImpl<
  $Res,
  $Val extends BayesianHistoryEntry
>
    implements $BayesianHistoryEntryCopyWith<$Res> {
  _$BayesianHistoryEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BayesianHistoryEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? drawNo = null,
    Object? prior = null,
    Object? posterior = null,
    Object? appeared = null,
  }) {
    return _then(
      _value.copyWith(
            drawNo: null == drawNo
                ? _value.drawNo
                : drawNo // ignore: cast_nullable_to_non_nullable
                      as int,
            prior: null == prior
                ? _value.prior
                : prior // ignore: cast_nullable_to_non_nullable
                      as double,
            posterior: null == posterior
                ? _value.posterior
                : posterior // ignore: cast_nullable_to_non_nullable
                      as double,
            appeared: null == appeared
                ? _value.appeared
                : appeared // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BayesianHistoryEntryImplCopyWith<$Res>
    implements $BayesianHistoryEntryCopyWith<$Res> {
  factory _$$BayesianHistoryEntryImplCopyWith(
    _$BayesianHistoryEntryImpl value,
    $Res Function(_$BayesianHistoryEntryImpl) then,
  ) = __$$BayesianHistoryEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'draw_no') int drawNo,
    double prior,
    double posterior,
    bool appeared,
  });
}

/// @nodoc
class __$$BayesianHistoryEntryImplCopyWithImpl<$Res>
    extends _$BayesianHistoryEntryCopyWithImpl<$Res, _$BayesianHistoryEntryImpl>
    implements _$$BayesianHistoryEntryImplCopyWith<$Res> {
  __$$BayesianHistoryEntryImplCopyWithImpl(
    _$BayesianHistoryEntryImpl _value,
    $Res Function(_$BayesianHistoryEntryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BayesianHistoryEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? drawNo = null,
    Object? prior = null,
    Object? posterior = null,
    Object? appeared = null,
  }) {
    return _then(
      _$BayesianHistoryEntryImpl(
        drawNo: null == drawNo
            ? _value.drawNo
            : drawNo // ignore: cast_nullable_to_non_nullable
                  as int,
        prior: null == prior
            ? _value.prior
            : prior // ignore: cast_nullable_to_non_nullable
                  as double,
        posterior: null == posterior
            ? _value.posterior
            : posterior // ignore: cast_nullable_to_non_nullable
                  as double,
        appeared: null == appeared
            ? _value.appeared
            : appeared // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BayesianHistoryEntryImpl implements _BayesianHistoryEntry {
  const _$BayesianHistoryEntryImpl({
    @JsonKey(name: 'draw_no') required this.drawNo,
    required this.prior,
    required this.posterior,
    required this.appeared,
  });

  factory _$BayesianHistoryEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$BayesianHistoryEntryImplFromJson(json);

  @override
  @JsonKey(name: 'draw_no')
  final int drawNo;
  @override
  final double prior;
  @override
  final double posterior;
  @override
  final bool appeared;

  @override
  String toString() {
    return 'BayesianHistoryEntry(drawNo: $drawNo, prior: $prior, posterior: $posterior, appeared: $appeared)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BayesianHistoryEntryImpl &&
            (identical(other.drawNo, drawNo) || other.drawNo == drawNo) &&
            (identical(other.prior, prior) || other.prior == prior) &&
            (identical(other.posterior, posterior) ||
                other.posterior == posterior) &&
            (identical(other.appeared, appeared) ||
                other.appeared == appeared));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, drawNo, prior, posterior, appeared);

  /// Create a copy of BayesianHistoryEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BayesianHistoryEntryImplCopyWith<_$BayesianHistoryEntryImpl>
  get copyWith =>
      __$$BayesianHistoryEntryImplCopyWithImpl<_$BayesianHistoryEntryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$BayesianHistoryEntryImplToJson(this);
  }
}

abstract class _BayesianHistoryEntry implements BayesianHistoryEntry {
  const factory _BayesianHistoryEntry({
    @JsonKey(name: 'draw_no') required final int drawNo,
    required final double prior,
    required final double posterior,
    required final bool appeared,
  }) = _$BayesianHistoryEntryImpl;

  factory _BayesianHistoryEntry.fromJson(Map<String, dynamic> json) =
      _$BayesianHistoryEntryImpl.fromJson;

  @override
  @JsonKey(name: 'draw_no')
  int get drawNo;
  @override
  double get prior;
  @override
  double get posterior;
  @override
  bool get appeared;

  /// Create a copy of BayesianHistoryEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BayesianHistoryEntryImplCopyWith<_$BayesianHistoryEntryImpl>
  get copyWith => throw _privateConstructorUsedError;
}

BayesianHistoryResponse _$BayesianHistoryResponseFromJson(
  Map<String, dynamic> json,
) {
  return _BayesianHistoryResponse.fromJson(json);
}

/// @nodoc
mixin _$BayesianHistoryResponse {
  int get number => throw _privateConstructorUsedError;
  List<BayesianHistoryEntry> get history => throw _privateConstructorUsedError;

  /// Serializes this BayesianHistoryResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BayesianHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BayesianHistoryResponseCopyWith<BayesianHistoryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BayesianHistoryResponseCopyWith<$Res> {
  factory $BayesianHistoryResponseCopyWith(
    BayesianHistoryResponse value,
    $Res Function(BayesianHistoryResponse) then,
  ) = _$BayesianHistoryResponseCopyWithImpl<$Res, BayesianHistoryResponse>;
  @useResult
  $Res call({int number, List<BayesianHistoryEntry> history});
}

/// @nodoc
class _$BayesianHistoryResponseCopyWithImpl<
  $Res,
  $Val extends BayesianHistoryResponse
>
    implements $BayesianHistoryResponseCopyWith<$Res> {
  _$BayesianHistoryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BayesianHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? number = null, Object? history = null}) {
    return _then(
      _value.copyWith(
            number: null == number
                ? _value.number
                : number // ignore: cast_nullable_to_non_nullable
                      as int,
            history: null == history
                ? _value.history
                : history // ignore: cast_nullable_to_non_nullable
                      as List<BayesianHistoryEntry>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BayesianHistoryResponseImplCopyWith<$Res>
    implements $BayesianHistoryResponseCopyWith<$Res> {
  factory _$$BayesianHistoryResponseImplCopyWith(
    _$BayesianHistoryResponseImpl value,
    $Res Function(_$BayesianHistoryResponseImpl) then,
  ) = __$$BayesianHistoryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int number, List<BayesianHistoryEntry> history});
}

/// @nodoc
class __$$BayesianHistoryResponseImplCopyWithImpl<$Res>
    extends
        _$BayesianHistoryResponseCopyWithImpl<
          $Res,
          _$BayesianHistoryResponseImpl
        >
    implements _$$BayesianHistoryResponseImplCopyWith<$Res> {
  __$$BayesianHistoryResponseImplCopyWithImpl(
    _$BayesianHistoryResponseImpl _value,
    $Res Function(_$BayesianHistoryResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BayesianHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? number = null, Object? history = null}) {
    return _then(
      _$BayesianHistoryResponseImpl(
        number: null == number
            ? _value.number
            : number // ignore: cast_nullable_to_non_nullable
                  as int,
        history: null == history
            ? _value._history
            : history // ignore: cast_nullable_to_non_nullable
                  as List<BayesianHistoryEntry>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BayesianHistoryResponseImpl implements _BayesianHistoryResponse {
  const _$BayesianHistoryResponseImpl({
    required this.number,
    required final List<BayesianHistoryEntry> history,
  }) : _history = history;

  factory _$BayesianHistoryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BayesianHistoryResponseImplFromJson(json);

  @override
  final int number;
  final List<BayesianHistoryEntry> _history;
  @override
  List<BayesianHistoryEntry> get history {
    if (_history is EqualUnmodifiableListView) return _history;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_history);
  }

  @override
  String toString() {
    return 'BayesianHistoryResponse(number: $number, history: $history)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BayesianHistoryResponseImpl &&
            (identical(other.number, number) || other.number == number) &&
            const DeepCollectionEquality().equals(other._history, _history));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    number,
    const DeepCollectionEquality().hash(_history),
  );

  /// Create a copy of BayesianHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BayesianHistoryResponseImplCopyWith<_$BayesianHistoryResponseImpl>
  get copyWith =>
      __$$BayesianHistoryResponseImplCopyWithImpl<
        _$BayesianHistoryResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BayesianHistoryResponseImplToJson(this);
  }
}

abstract class _BayesianHistoryResponse implements BayesianHistoryResponse {
  const factory _BayesianHistoryResponse({
    required final int number,
    required final List<BayesianHistoryEntry> history,
  }) = _$BayesianHistoryResponseImpl;

  factory _BayesianHistoryResponse.fromJson(Map<String, dynamic> json) =
      _$BayesianHistoryResponseImpl.fromJson;

  @override
  int get number;
  @override
  List<BayesianHistoryEntry> get history;

  /// Create a copy of BayesianHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BayesianHistoryResponseImplCopyWith<_$BayesianHistoryResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

AnalysisStat _$AnalysisStatFromJson(Map<String, dynamic> json) {
  return _AnalysisStat.fromJson(json);
}

/// @nodoc
mixin _$AnalysisStat {
  @JsonKey(name: 'draw_no')
  int get drawNo => throw _privateConstructorUsedError;
  int get number => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_count')
  int get totalCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_prob')
  double get totalProb => throw _privateConstructorUsedError;
  @JsonKey(name: 'bonus_count')
  int get bonusCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'bonus_prob')
  double get bonusProb => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_count')
  int get firstCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_prob')
  double get firstProb => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_count')
  int get lastCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_prob')
  double get lastProb => throw _privateConstructorUsedError;
  @JsonKey(name: 'reappear_total')
  int get reappearTotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'reappear_count')
  int get reappearCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'reappear_prob')
  double get reappearProb => throw _privateConstructorUsedError;
  @JsonKey(name: 'bayesian_prior')
  double get bayesianPrior => throw _privateConstructorUsedError;
  @JsonKey(name: 'bayesian_post')
  double get bayesianPost => throw _privateConstructorUsedError;
  @JsonKey(name: 'color_count')
  int get colorCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'color_prob')
  double get colorProb => throw _privateConstructorUsedError;
  @JsonKey(name: 'row_count')
  int get rowCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'row_prob')
  double get rowProb => throw _privateConstructorUsedError;
  @JsonKey(name: 'col_count')
  int get colCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'col_prob')
  double get colProb => throw _privateConstructorUsedError;
  bool get appeared => throw _privateConstructorUsedError;

  /// Serializes this AnalysisStat to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnalysisStat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnalysisStatCopyWith<AnalysisStat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalysisStatCopyWith<$Res> {
  factory $AnalysisStatCopyWith(
    AnalysisStat value,
    $Res Function(AnalysisStat) then,
  ) = _$AnalysisStatCopyWithImpl<$Res, AnalysisStat>;
  @useResult
  $Res call({
    @JsonKey(name: 'draw_no') int drawNo,
    int number,
    @JsonKey(name: 'total_count') int totalCount,
    @JsonKey(name: 'total_prob') double totalProb,
    @JsonKey(name: 'bonus_count') int bonusCount,
    @JsonKey(name: 'bonus_prob') double bonusProb,
    @JsonKey(name: 'first_count') int firstCount,
    @JsonKey(name: 'first_prob') double firstProb,
    @JsonKey(name: 'last_count') int lastCount,
    @JsonKey(name: 'last_prob') double lastProb,
    @JsonKey(name: 'reappear_total') int reappearTotal,
    @JsonKey(name: 'reappear_count') int reappearCount,
    @JsonKey(name: 'reappear_prob') double reappearProb,
    @JsonKey(name: 'bayesian_prior') double bayesianPrior,
    @JsonKey(name: 'bayesian_post') double bayesianPost,
    @JsonKey(name: 'color_count') int colorCount,
    @JsonKey(name: 'color_prob') double colorProb,
    @JsonKey(name: 'row_count') int rowCount,
    @JsonKey(name: 'row_prob') double rowProb,
    @JsonKey(name: 'col_count') int colCount,
    @JsonKey(name: 'col_prob') double colProb,
    bool appeared,
  });
}

/// @nodoc
class _$AnalysisStatCopyWithImpl<$Res, $Val extends AnalysisStat>
    implements $AnalysisStatCopyWith<$Res> {
  _$AnalysisStatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnalysisStat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? drawNo = null,
    Object? number = null,
    Object? totalCount = null,
    Object? totalProb = null,
    Object? bonusCount = null,
    Object? bonusProb = null,
    Object? firstCount = null,
    Object? firstProb = null,
    Object? lastCount = null,
    Object? lastProb = null,
    Object? reappearTotal = null,
    Object? reappearCount = null,
    Object? reappearProb = null,
    Object? bayesianPrior = null,
    Object? bayesianPost = null,
    Object? colorCount = null,
    Object? colorProb = null,
    Object? rowCount = null,
    Object? rowProb = null,
    Object? colCount = null,
    Object? colProb = null,
    Object? appeared = null,
  }) {
    return _then(
      _value.copyWith(
            drawNo: null == drawNo
                ? _value.drawNo
                : drawNo // ignore: cast_nullable_to_non_nullable
                      as int,
            number: null == number
                ? _value.number
                : number // ignore: cast_nullable_to_non_nullable
                      as int,
            totalCount: null == totalCount
                ? _value.totalCount
                : totalCount // ignore: cast_nullable_to_non_nullable
                      as int,
            totalProb: null == totalProb
                ? _value.totalProb
                : totalProb // ignore: cast_nullable_to_non_nullable
                      as double,
            bonusCount: null == bonusCount
                ? _value.bonusCount
                : bonusCount // ignore: cast_nullable_to_non_nullable
                      as int,
            bonusProb: null == bonusProb
                ? _value.bonusProb
                : bonusProb // ignore: cast_nullable_to_non_nullable
                      as double,
            firstCount: null == firstCount
                ? _value.firstCount
                : firstCount // ignore: cast_nullable_to_non_nullable
                      as int,
            firstProb: null == firstProb
                ? _value.firstProb
                : firstProb // ignore: cast_nullable_to_non_nullable
                      as double,
            lastCount: null == lastCount
                ? _value.lastCount
                : lastCount // ignore: cast_nullable_to_non_nullable
                      as int,
            lastProb: null == lastProb
                ? _value.lastProb
                : lastProb // ignore: cast_nullable_to_non_nullable
                      as double,
            reappearTotal: null == reappearTotal
                ? _value.reappearTotal
                : reappearTotal // ignore: cast_nullable_to_non_nullable
                      as int,
            reappearCount: null == reappearCount
                ? _value.reappearCount
                : reappearCount // ignore: cast_nullable_to_non_nullable
                      as int,
            reappearProb: null == reappearProb
                ? _value.reappearProb
                : reappearProb // ignore: cast_nullable_to_non_nullable
                      as double,
            bayesianPrior: null == bayesianPrior
                ? _value.bayesianPrior
                : bayesianPrior // ignore: cast_nullable_to_non_nullable
                      as double,
            bayesianPost: null == bayesianPost
                ? _value.bayesianPost
                : bayesianPost // ignore: cast_nullable_to_non_nullable
                      as double,
            colorCount: null == colorCount
                ? _value.colorCount
                : colorCount // ignore: cast_nullable_to_non_nullable
                      as int,
            colorProb: null == colorProb
                ? _value.colorProb
                : colorProb // ignore: cast_nullable_to_non_nullable
                      as double,
            rowCount: null == rowCount
                ? _value.rowCount
                : rowCount // ignore: cast_nullable_to_non_nullable
                      as int,
            rowProb: null == rowProb
                ? _value.rowProb
                : rowProb // ignore: cast_nullable_to_non_nullable
                      as double,
            colCount: null == colCount
                ? _value.colCount
                : colCount // ignore: cast_nullable_to_non_nullable
                      as int,
            colProb: null == colProb
                ? _value.colProb
                : colProb // ignore: cast_nullable_to_non_nullable
                      as double,
            appeared: null == appeared
                ? _value.appeared
                : appeared // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AnalysisStatImplCopyWith<$Res>
    implements $AnalysisStatCopyWith<$Res> {
  factory _$$AnalysisStatImplCopyWith(
    _$AnalysisStatImpl value,
    $Res Function(_$AnalysisStatImpl) then,
  ) = __$$AnalysisStatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'draw_no') int drawNo,
    int number,
    @JsonKey(name: 'total_count') int totalCount,
    @JsonKey(name: 'total_prob') double totalProb,
    @JsonKey(name: 'bonus_count') int bonusCount,
    @JsonKey(name: 'bonus_prob') double bonusProb,
    @JsonKey(name: 'first_count') int firstCount,
    @JsonKey(name: 'first_prob') double firstProb,
    @JsonKey(name: 'last_count') int lastCount,
    @JsonKey(name: 'last_prob') double lastProb,
    @JsonKey(name: 'reappear_total') int reappearTotal,
    @JsonKey(name: 'reappear_count') int reappearCount,
    @JsonKey(name: 'reappear_prob') double reappearProb,
    @JsonKey(name: 'bayesian_prior') double bayesianPrior,
    @JsonKey(name: 'bayesian_post') double bayesianPost,
    @JsonKey(name: 'color_count') int colorCount,
    @JsonKey(name: 'color_prob') double colorProb,
    @JsonKey(name: 'row_count') int rowCount,
    @JsonKey(name: 'row_prob') double rowProb,
    @JsonKey(name: 'col_count') int colCount,
    @JsonKey(name: 'col_prob') double colProb,
    bool appeared,
  });
}

/// @nodoc
class __$$AnalysisStatImplCopyWithImpl<$Res>
    extends _$AnalysisStatCopyWithImpl<$Res, _$AnalysisStatImpl>
    implements _$$AnalysisStatImplCopyWith<$Res> {
  __$$AnalysisStatImplCopyWithImpl(
    _$AnalysisStatImpl _value,
    $Res Function(_$AnalysisStatImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AnalysisStat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? drawNo = null,
    Object? number = null,
    Object? totalCount = null,
    Object? totalProb = null,
    Object? bonusCount = null,
    Object? bonusProb = null,
    Object? firstCount = null,
    Object? firstProb = null,
    Object? lastCount = null,
    Object? lastProb = null,
    Object? reappearTotal = null,
    Object? reappearCount = null,
    Object? reappearProb = null,
    Object? bayesianPrior = null,
    Object? bayesianPost = null,
    Object? colorCount = null,
    Object? colorProb = null,
    Object? rowCount = null,
    Object? rowProb = null,
    Object? colCount = null,
    Object? colProb = null,
    Object? appeared = null,
  }) {
    return _then(
      _$AnalysisStatImpl(
        drawNo: null == drawNo
            ? _value.drawNo
            : drawNo // ignore: cast_nullable_to_non_nullable
                  as int,
        number: null == number
            ? _value.number
            : number // ignore: cast_nullable_to_non_nullable
                  as int,
        totalCount: null == totalCount
            ? _value.totalCount
            : totalCount // ignore: cast_nullable_to_non_nullable
                  as int,
        totalProb: null == totalProb
            ? _value.totalProb
            : totalProb // ignore: cast_nullable_to_non_nullable
                  as double,
        bonusCount: null == bonusCount
            ? _value.bonusCount
            : bonusCount // ignore: cast_nullable_to_non_nullable
                  as int,
        bonusProb: null == bonusProb
            ? _value.bonusProb
            : bonusProb // ignore: cast_nullable_to_non_nullable
                  as double,
        firstCount: null == firstCount
            ? _value.firstCount
            : firstCount // ignore: cast_nullable_to_non_nullable
                  as int,
        firstProb: null == firstProb
            ? _value.firstProb
            : firstProb // ignore: cast_nullable_to_non_nullable
                  as double,
        lastCount: null == lastCount
            ? _value.lastCount
            : lastCount // ignore: cast_nullable_to_non_nullable
                  as int,
        lastProb: null == lastProb
            ? _value.lastProb
            : lastProb // ignore: cast_nullable_to_non_nullable
                  as double,
        reappearTotal: null == reappearTotal
            ? _value.reappearTotal
            : reappearTotal // ignore: cast_nullable_to_non_nullable
                  as int,
        reappearCount: null == reappearCount
            ? _value.reappearCount
            : reappearCount // ignore: cast_nullable_to_non_nullable
                  as int,
        reappearProb: null == reappearProb
            ? _value.reappearProb
            : reappearProb // ignore: cast_nullable_to_non_nullable
                  as double,
        bayesianPrior: null == bayesianPrior
            ? _value.bayesianPrior
            : bayesianPrior // ignore: cast_nullable_to_non_nullable
                  as double,
        bayesianPost: null == bayesianPost
            ? _value.bayesianPost
            : bayesianPost // ignore: cast_nullable_to_non_nullable
                  as double,
        colorCount: null == colorCount
            ? _value.colorCount
            : colorCount // ignore: cast_nullable_to_non_nullable
                  as int,
        colorProb: null == colorProb
            ? _value.colorProb
            : colorProb // ignore: cast_nullable_to_non_nullable
                  as double,
        rowCount: null == rowCount
            ? _value.rowCount
            : rowCount // ignore: cast_nullable_to_non_nullable
                  as int,
        rowProb: null == rowProb
            ? _value.rowProb
            : rowProb // ignore: cast_nullable_to_non_nullable
                  as double,
        colCount: null == colCount
            ? _value.colCount
            : colCount // ignore: cast_nullable_to_non_nullable
                  as int,
        colProb: null == colProb
            ? _value.colProb
            : colProb // ignore: cast_nullable_to_non_nullable
                  as double,
        appeared: null == appeared
            ? _value.appeared
            : appeared // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AnalysisStatImpl implements _AnalysisStat {
  const _$AnalysisStatImpl({
    @JsonKey(name: 'draw_no') required this.drawNo,
    required this.number,
    @JsonKey(name: 'total_count') required this.totalCount,
    @JsonKey(name: 'total_prob') required this.totalProb,
    @JsonKey(name: 'bonus_count') required this.bonusCount,
    @JsonKey(name: 'bonus_prob') required this.bonusProb,
    @JsonKey(name: 'first_count') required this.firstCount,
    @JsonKey(name: 'first_prob') required this.firstProb,
    @JsonKey(name: 'last_count') required this.lastCount,
    @JsonKey(name: 'last_prob') required this.lastProb,
    @JsonKey(name: 'reappear_total') required this.reappearTotal,
    @JsonKey(name: 'reappear_count') required this.reappearCount,
    @JsonKey(name: 'reappear_prob') required this.reappearProb,
    @JsonKey(name: 'bayesian_prior') required this.bayesianPrior,
    @JsonKey(name: 'bayesian_post') required this.bayesianPost,
    @JsonKey(name: 'color_count') required this.colorCount,
    @JsonKey(name: 'color_prob') required this.colorProb,
    @JsonKey(name: 'row_count') required this.rowCount,
    @JsonKey(name: 'row_prob') required this.rowProb,
    @JsonKey(name: 'col_count') required this.colCount,
    @JsonKey(name: 'col_prob') required this.colProb,
    required this.appeared,
  });

  factory _$AnalysisStatImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnalysisStatImplFromJson(json);

  @override
  @JsonKey(name: 'draw_no')
  final int drawNo;
  @override
  final int number;
  @override
  @JsonKey(name: 'total_count')
  final int totalCount;
  @override
  @JsonKey(name: 'total_prob')
  final double totalProb;
  @override
  @JsonKey(name: 'bonus_count')
  final int bonusCount;
  @override
  @JsonKey(name: 'bonus_prob')
  final double bonusProb;
  @override
  @JsonKey(name: 'first_count')
  final int firstCount;
  @override
  @JsonKey(name: 'first_prob')
  final double firstProb;
  @override
  @JsonKey(name: 'last_count')
  final int lastCount;
  @override
  @JsonKey(name: 'last_prob')
  final double lastProb;
  @override
  @JsonKey(name: 'reappear_total')
  final int reappearTotal;
  @override
  @JsonKey(name: 'reappear_count')
  final int reappearCount;
  @override
  @JsonKey(name: 'reappear_prob')
  final double reappearProb;
  @override
  @JsonKey(name: 'bayesian_prior')
  final double bayesianPrior;
  @override
  @JsonKey(name: 'bayesian_post')
  final double bayesianPost;
  @override
  @JsonKey(name: 'color_count')
  final int colorCount;
  @override
  @JsonKey(name: 'color_prob')
  final double colorProb;
  @override
  @JsonKey(name: 'row_count')
  final int rowCount;
  @override
  @JsonKey(name: 'row_prob')
  final double rowProb;
  @override
  @JsonKey(name: 'col_count')
  final int colCount;
  @override
  @JsonKey(name: 'col_prob')
  final double colProb;
  @override
  final bool appeared;

  @override
  String toString() {
    return 'AnalysisStat(drawNo: $drawNo, number: $number, totalCount: $totalCount, totalProb: $totalProb, bonusCount: $bonusCount, bonusProb: $bonusProb, firstCount: $firstCount, firstProb: $firstProb, lastCount: $lastCount, lastProb: $lastProb, reappearTotal: $reappearTotal, reappearCount: $reappearCount, reappearProb: $reappearProb, bayesianPrior: $bayesianPrior, bayesianPost: $bayesianPost, colorCount: $colorCount, colorProb: $colorProb, rowCount: $rowCount, rowProb: $rowProb, colCount: $colCount, colProb: $colProb, appeared: $appeared)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalysisStatImpl &&
            (identical(other.drawNo, drawNo) || other.drawNo == drawNo) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.totalProb, totalProb) ||
                other.totalProb == totalProb) &&
            (identical(other.bonusCount, bonusCount) ||
                other.bonusCount == bonusCount) &&
            (identical(other.bonusProb, bonusProb) ||
                other.bonusProb == bonusProb) &&
            (identical(other.firstCount, firstCount) ||
                other.firstCount == firstCount) &&
            (identical(other.firstProb, firstProb) ||
                other.firstProb == firstProb) &&
            (identical(other.lastCount, lastCount) ||
                other.lastCount == lastCount) &&
            (identical(other.lastProb, lastProb) ||
                other.lastProb == lastProb) &&
            (identical(other.reappearTotal, reappearTotal) ||
                other.reappearTotal == reappearTotal) &&
            (identical(other.reappearCount, reappearCount) ||
                other.reappearCount == reappearCount) &&
            (identical(other.reappearProb, reappearProb) ||
                other.reappearProb == reappearProb) &&
            (identical(other.bayesianPrior, bayesianPrior) ||
                other.bayesianPrior == bayesianPrior) &&
            (identical(other.bayesianPost, bayesianPost) ||
                other.bayesianPost == bayesianPost) &&
            (identical(other.colorCount, colorCount) ||
                other.colorCount == colorCount) &&
            (identical(other.colorProb, colorProb) ||
                other.colorProb == colorProb) &&
            (identical(other.rowCount, rowCount) ||
                other.rowCount == rowCount) &&
            (identical(other.rowProb, rowProb) || other.rowProb == rowProb) &&
            (identical(other.colCount, colCount) ||
                other.colCount == colCount) &&
            (identical(other.colProb, colProb) || other.colProb == colProb) &&
            (identical(other.appeared, appeared) ||
                other.appeared == appeared));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    drawNo,
    number,
    totalCount,
    totalProb,
    bonusCount,
    bonusProb,
    firstCount,
    firstProb,
    lastCount,
    lastProb,
    reappearTotal,
    reappearCount,
    reappearProb,
    bayesianPrior,
    bayesianPost,
    colorCount,
    colorProb,
    rowCount,
    rowProb,
    colCount,
    colProb,
    appeared,
  ]);

  /// Create a copy of AnalysisStat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalysisStatImplCopyWith<_$AnalysisStatImpl> get copyWith =>
      __$$AnalysisStatImplCopyWithImpl<_$AnalysisStatImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnalysisStatImplToJson(this);
  }
}

abstract class _AnalysisStat implements AnalysisStat {
  const factory _AnalysisStat({
    @JsonKey(name: 'draw_no') required final int drawNo,
    required final int number,
    @JsonKey(name: 'total_count') required final int totalCount,
    @JsonKey(name: 'total_prob') required final double totalProb,
    @JsonKey(name: 'bonus_count') required final int bonusCount,
    @JsonKey(name: 'bonus_prob') required final double bonusProb,
    @JsonKey(name: 'first_count') required final int firstCount,
    @JsonKey(name: 'first_prob') required final double firstProb,
    @JsonKey(name: 'last_count') required final int lastCount,
    @JsonKey(name: 'last_prob') required final double lastProb,
    @JsonKey(name: 'reappear_total') required final int reappearTotal,
    @JsonKey(name: 'reappear_count') required final int reappearCount,
    @JsonKey(name: 'reappear_prob') required final double reappearProb,
    @JsonKey(name: 'bayesian_prior') required final double bayesianPrior,
    @JsonKey(name: 'bayesian_post') required final double bayesianPost,
    @JsonKey(name: 'color_count') required final int colorCount,
    @JsonKey(name: 'color_prob') required final double colorProb,
    @JsonKey(name: 'row_count') required final int rowCount,
    @JsonKey(name: 'row_prob') required final double rowProb,
    @JsonKey(name: 'col_count') required final int colCount,
    @JsonKey(name: 'col_prob') required final double colProb,
    required final bool appeared,
  }) = _$AnalysisStatImpl;

  factory _AnalysisStat.fromJson(Map<String, dynamic> json) =
      _$AnalysisStatImpl.fromJson;

  @override
  @JsonKey(name: 'draw_no')
  int get drawNo;
  @override
  int get number;
  @override
  @JsonKey(name: 'total_count')
  int get totalCount;
  @override
  @JsonKey(name: 'total_prob')
  double get totalProb;
  @override
  @JsonKey(name: 'bonus_count')
  int get bonusCount;
  @override
  @JsonKey(name: 'bonus_prob')
  double get bonusProb;
  @override
  @JsonKey(name: 'first_count')
  int get firstCount;
  @override
  @JsonKey(name: 'first_prob')
  double get firstProb;
  @override
  @JsonKey(name: 'last_count')
  int get lastCount;
  @override
  @JsonKey(name: 'last_prob')
  double get lastProb;
  @override
  @JsonKey(name: 'reappear_total')
  int get reappearTotal;
  @override
  @JsonKey(name: 'reappear_count')
  int get reappearCount;
  @override
  @JsonKey(name: 'reappear_prob')
  double get reappearProb;
  @override
  @JsonKey(name: 'bayesian_prior')
  double get bayesianPrior;
  @override
  @JsonKey(name: 'bayesian_post')
  double get bayesianPost;
  @override
  @JsonKey(name: 'color_count')
  int get colorCount;
  @override
  @JsonKey(name: 'color_prob')
  double get colorProb;
  @override
  @JsonKey(name: 'row_count')
  int get rowCount;
  @override
  @JsonKey(name: 'row_prob')
  double get rowProb;
  @override
  @JsonKey(name: 'col_count')
  int get colCount;
  @override
  @JsonKey(name: 'col_prob')
  double get colProb;
  @override
  bool get appeared;

  /// Create a copy of AnalysisStat
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnalysisStatImplCopyWith<_$AnalysisStatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AnalysisResponse _$AnalysisResponseFromJson(Map<String, dynamic> json) {
  return _AnalysisResponse.fromJson(json);
}

/// @nodoc
mixin _$AnalysisResponse {
  List<AnalysisStat> get stats => throw _privateConstructorUsedError;
  @JsonKey(name: 'latest_draw_no')
  int get latestDrawNo => throw _privateConstructorUsedError;

  /// Serializes this AnalysisResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnalysisResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnalysisResponseCopyWith<AnalysisResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalysisResponseCopyWith<$Res> {
  factory $AnalysisResponseCopyWith(
    AnalysisResponse value,
    $Res Function(AnalysisResponse) then,
  ) = _$AnalysisResponseCopyWithImpl<$Res, AnalysisResponse>;
  @useResult
  $Res call({
    List<AnalysisStat> stats,
    @JsonKey(name: 'latest_draw_no') int latestDrawNo,
  });
}

/// @nodoc
class _$AnalysisResponseCopyWithImpl<$Res, $Val extends AnalysisResponse>
    implements $AnalysisResponseCopyWith<$Res> {
  _$AnalysisResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnalysisResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? stats = null, Object? latestDrawNo = null}) {
    return _then(
      _value.copyWith(
            stats: null == stats
                ? _value.stats
                : stats // ignore: cast_nullable_to_non_nullable
                      as List<AnalysisStat>,
            latestDrawNo: null == latestDrawNo
                ? _value.latestDrawNo
                : latestDrawNo // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AnalysisResponseImplCopyWith<$Res>
    implements $AnalysisResponseCopyWith<$Res> {
  factory _$$AnalysisResponseImplCopyWith(
    _$AnalysisResponseImpl value,
    $Res Function(_$AnalysisResponseImpl) then,
  ) = __$$AnalysisResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<AnalysisStat> stats,
    @JsonKey(name: 'latest_draw_no') int latestDrawNo,
  });
}

/// @nodoc
class __$$AnalysisResponseImplCopyWithImpl<$Res>
    extends _$AnalysisResponseCopyWithImpl<$Res, _$AnalysisResponseImpl>
    implements _$$AnalysisResponseImplCopyWith<$Res> {
  __$$AnalysisResponseImplCopyWithImpl(
    _$AnalysisResponseImpl _value,
    $Res Function(_$AnalysisResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AnalysisResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? stats = null, Object? latestDrawNo = null}) {
    return _then(
      _$AnalysisResponseImpl(
        stats: null == stats
            ? _value._stats
            : stats // ignore: cast_nullable_to_non_nullable
                  as List<AnalysisStat>,
        latestDrawNo: null == latestDrawNo
            ? _value.latestDrawNo
            : latestDrawNo // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AnalysisResponseImpl implements _AnalysisResponse {
  const _$AnalysisResponseImpl({
    required final List<AnalysisStat> stats,
    @JsonKey(name: 'latest_draw_no') required this.latestDrawNo,
  }) : _stats = stats;

  factory _$AnalysisResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnalysisResponseImplFromJson(json);

  final List<AnalysisStat> _stats;
  @override
  List<AnalysisStat> get stats {
    if (_stats is EqualUnmodifiableListView) return _stats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stats);
  }

  @override
  @JsonKey(name: 'latest_draw_no')
  final int latestDrawNo;

  @override
  String toString() {
    return 'AnalysisResponse(stats: $stats, latestDrawNo: $latestDrawNo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalysisResponseImpl &&
            const DeepCollectionEquality().equals(other._stats, _stats) &&
            (identical(other.latestDrawNo, latestDrawNo) ||
                other.latestDrawNo == latestDrawNo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_stats),
    latestDrawNo,
  );

  /// Create a copy of AnalysisResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalysisResponseImplCopyWith<_$AnalysisResponseImpl> get copyWith =>
      __$$AnalysisResponseImplCopyWithImpl<_$AnalysisResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AnalysisResponseImplToJson(this);
  }
}

abstract class _AnalysisResponse implements AnalysisResponse {
  const factory _AnalysisResponse({
    required final List<AnalysisStat> stats,
    @JsonKey(name: 'latest_draw_no') required final int latestDrawNo,
  }) = _$AnalysisResponseImpl;

  factory _AnalysisResponse.fromJson(Map<String, dynamic> json) =
      _$AnalysisResponseImpl.fromJson;

  @override
  List<AnalysisStat> get stats;
  @override
  @JsonKey(name: 'latest_draw_no')
  int get latestDrawNo;

  /// Create a copy of AnalysisResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnalysisResponseImplCopyWith<_$AnalysisResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
