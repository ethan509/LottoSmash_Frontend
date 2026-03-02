// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'backtest_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BacktestRequest _$BacktestRequestFromJson(Map<String, dynamic> json) {
  return _BacktestRequest.fromJson(json);
}

/// @nodoc
mixin _$BacktestRequest {
  @JsonKey(name: 'method_codes')
  List<String> get methodCodes => throw _privateConstructorUsedError;
  @JsonKey(name: 'combine_method')
  String get combineMethod => throw _privateConstructorUsedError;
  @JsonKey(name: 'draw_no')
  int get drawNo => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  /// Serializes this BacktestRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BacktestRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BacktestRequestCopyWith<BacktestRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BacktestRequestCopyWith<$Res> {
  factory $BacktestRequestCopyWith(
    BacktestRequest value,
    $Res Function(BacktestRequest) then,
  ) = _$BacktestRequestCopyWithImpl<$Res, BacktestRequest>;
  @useResult
  $Res call({
    @JsonKey(name: 'method_codes') List<String> methodCodes,
    @JsonKey(name: 'combine_method') String combineMethod,
    @JsonKey(name: 'draw_no') int drawNo,
    int count,
  });
}

/// @nodoc
class _$BacktestRequestCopyWithImpl<$Res, $Val extends BacktestRequest>
    implements $BacktestRequestCopyWith<$Res> {
  _$BacktestRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BacktestRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? methodCodes = null,
    Object? combineMethod = null,
    Object? drawNo = null,
    Object? count = null,
  }) {
    return _then(
      _value.copyWith(
            methodCodes: null == methodCodes
                ? _value.methodCodes
                : methodCodes // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            combineMethod: null == combineMethod
                ? _value.combineMethod
                : combineMethod // ignore: cast_nullable_to_non_nullable
                      as String,
            drawNo: null == drawNo
                ? _value.drawNo
                : drawNo // ignore: cast_nullable_to_non_nullable
                      as int,
            count: null == count
                ? _value.count
                : count // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BacktestRequestImplCopyWith<$Res>
    implements $BacktestRequestCopyWith<$Res> {
  factory _$$BacktestRequestImplCopyWith(
    _$BacktestRequestImpl value,
    $Res Function(_$BacktestRequestImpl) then,
  ) = __$$BacktestRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'method_codes') List<String> methodCodes,
    @JsonKey(name: 'combine_method') String combineMethod,
    @JsonKey(name: 'draw_no') int drawNo,
    int count,
  });
}

/// @nodoc
class __$$BacktestRequestImplCopyWithImpl<$Res>
    extends _$BacktestRequestCopyWithImpl<$Res, _$BacktestRequestImpl>
    implements _$$BacktestRequestImplCopyWith<$Res> {
  __$$BacktestRequestImplCopyWithImpl(
    _$BacktestRequestImpl _value,
    $Res Function(_$BacktestRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BacktestRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? methodCodes = null,
    Object? combineMethod = null,
    Object? drawNo = null,
    Object? count = null,
  }) {
    return _then(
      _$BacktestRequestImpl(
        methodCodes: null == methodCodes
            ? _value._methodCodes
            : methodCodes // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        combineMethod: null == combineMethod
            ? _value.combineMethod
            : combineMethod // ignore: cast_nullable_to_non_nullable
                  as String,
        drawNo: null == drawNo
            ? _value.drawNo
            : drawNo // ignore: cast_nullable_to_non_nullable
                  as int,
        count: null == count
            ? _value.count
            : count // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BacktestRequestImpl implements _BacktestRequest {
  const _$BacktestRequestImpl({
    @JsonKey(name: 'method_codes') required final List<String> methodCodes,
    @JsonKey(name: 'combine_method') required this.combineMethod,
    @JsonKey(name: 'draw_no') required this.drawNo,
    required this.count,
  }) : _methodCodes = methodCodes;

  factory _$BacktestRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$BacktestRequestImplFromJson(json);

  final List<String> _methodCodes;
  @override
  @JsonKey(name: 'method_codes')
  List<String> get methodCodes {
    if (_methodCodes is EqualUnmodifiableListView) return _methodCodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_methodCodes);
  }

  @override
  @JsonKey(name: 'combine_method')
  final String combineMethod;
  @override
  @JsonKey(name: 'draw_no')
  final int drawNo;
  @override
  final int count;

  @override
  String toString() {
    return 'BacktestRequest(methodCodes: $methodCodes, combineMethod: $combineMethod, drawNo: $drawNo, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BacktestRequestImpl &&
            const DeepCollectionEquality().equals(
              other._methodCodes,
              _methodCodes,
            ) &&
            (identical(other.combineMethod, combineMethod) ||
                other.combineMethod == combineMethod) &&
            (identical(other.drawNo, drawNo) || other.drawNo == drawNo) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_methodCodes),
    combineMethod,
    drawNo,
    count,
  );

  /// Create a copy of BacktestRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BacktestRequestImplCopyWith<_$BacktestRequestImpl> get copyWith =>
      __$$BacktestRequestImplCopyWithImpl<_$BacktestRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$BacktestRequestImplToJson(this);
  }
}

abstract class _BacktestRequest implements BacktestRequest {
  const factory _BacktestRequest({
    @JsonKey(name: 'method_codes') required final List<String> methodCodes,
    @JsonKey(name: 'combine_method') required final String combineMethod,
    @JsonKey(name: 'draw_no') required final int drawNo,
    required final int count,
  }) = _$BacktestRequestImpl;

  factory _BacktestRequest.fromJson(Map<String, dynamic> json) =
      _$BacktestRequestImpl.fromJson;

  @override
  @JsonKey(name: 'method_codes')
  List<String> get methodCodes;
  @override
  @JsonKey(name: 'combine_method')
  String get combineMethod;
  @override
  @JsonKey(name: 'draw_no')
  int get drawNo;
  @override
  int get count;

  /// Create a copy of BacktestRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BacktestRequestImplCopyWith<_$BacktestRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BacktestDrawResult _$BacktestDrawResultFromJson(Map<String, dynamic> json) {
  return _BacktestDrawResult.fromJson(json);
}

/// @nodoc
mixin _$BacktestDrawResult {
  @JsonKey(name: 'draw_no')
  int get drawNo => throw _privateConstructorUsedError;
  List<int> get predicted => throw _privateConstructorUsedError;
  List<int> get actual => throw _privateConstructorUsedError;
  @JsonKey(name: 'bonus_num')
  int get bonusNum => throw _privateConstructorUsedError;
  int get match => throw _privateConstructorUsedError;
  String get prize => throw _privateConstructorUsedError;

  /// Serializes this BacktestDrawResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BacktestDrawResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BacktestDrawResultCopyWith<BacktestDrawResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BacktestDrawResultCopyWith<$Res> {
  factory $BacktestDrawResultCopyWith(
    BacktestDrawResult value,
    $Res Function(BacktestDrawResult) then,
  ) = _$BacktestDrawResultCopyWithImpl<$Res, BacktestDrawResult>;
  @useResult
  $Res call({
    @JsonKey(name: 'draw_no') int drawNo,
    List<int> predicted,
    List<int> actual,
    @JsonKey(name: 'bonus_num') int bonusNum,
    int match,
    String prize,
  });
}

/// @nodoc
class _$BacktestDrawResultCopyWithImpl<$Res, $Val extends BacktestDrawResult>
    implements $BacktestDrawResultCopyWith<$Res> {
  _$BacktestDrawResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BacktestDrawResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? drawNo = null,
    Object? predicted = null,
    Object? actual = null,
    Object? bonusNum = null,
    Object? match = null,
    Object? prize = null,
  }) {
    return _then(
      _value.copyWith(
            drawNo: null == drawNo
                ? _value.drawNo
                : drawNo // ignore: cast_nullable_to_non_nullable
                      as int,
            predicted: null == predicted
                ? _value.predicted
                : predicted // ignore: cast_nullable_to_non_nullable
                      as List<int>,
            actual: null == actual
                ? _value.actual
                : actual // ignore: cast_nullable_to_non_nullable
                      as List<int>,
            bonusNum: null == bonusNum
                ? _value.bonusNum
                : bonusNum // ignore: cast_nullable_to_non_nullable
                      as int,
            match: null == match
                ? _value.match
                : match // ignore: cast_nullable_to_non_nullable
                      as int,
            prize: null == prize
                ? _value.prize
                : prize // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BacktestDrawResultImplCopyWith<$Res>
    implements $BacktestDrawResultCopyWith<$Res> {
  factory _$$BacktestDrawResultImplCopyWith(
    _$BacktestDrawResultImpl value,
    $Res Function(_$BacktestDrawResultImpl) then,
  ) = __$$BacktestDrawResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'draw_no') int drawNo,
    List<int> predicted,
    List<int> actual,
    @JsonKey(name: 'bonus_num') int bonusNum,
    int match,
    String prize,
  });
}

/// @nodoc
class __$$BacktestDrawResultImplCopyWithImpl<$Res>
    extends _$BacktestDrawResultCopyWithImpl<$Res, _$BacktestDrawResultImpl>
    implements _$$BacktestDrawResultImplCopyWith<$Res> {
  __$$BacktestDrawResultImplCopyWithImpl(
    _$BacktestDrawResultImpl _value,
    $Res Function(_$BacktestDrawResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BacktestDrawResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? drawNo = null,
    Object? predicted = null,
    Object? actual = null,
    Object? bonusNum = null,
    Object? match = null,
    Object? prize = null,
  }) {
    return _then(
      _$BacktestDrawResultImpl(
        drawNo: null == drawNo
            ? _value.drawNo
            : drawNo // ignore: cast_nullable_to_non_nullable
                  as int,
        predicted: null == predicted
            ? _value._predicted
            : predicted // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        actual: null == actual
            ? _value._actual
            : actual // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        bonusNum: null == bonusNum
            ? _value.bonusNum
            : bonusNum // ignore: cast_nullable_to_non_nullable
                  as int,
        match: null == match
            ? _value.match
            : match // ignore: cast_nullable_to_non_nullable
                  as int,
        prize: null == prize
            ? _value.prize
            : prize // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BacktestDrawResultImpl implements _BacktestDrawResult {
  const _$BacktestDrawResultImpl({
    @JsonKey(name: 'draw_no') required this.drawNo,
    required final List<int> predicted,
    required final List<int> actual,
    @JsonKey(name: 'bonus_num') required this.bonusNum,
    required this.match,
    required this.prize,
  }) : _predicted = predicted,
       _actual = actual;

  factory _$BacktestDrawResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$BacktestDrawResultImplFromJson(json);

  @override
  @JsonKey(name: 'draw_no')
  final int drawNo;
  final List<int> _predicted;
  @override
  List<int> get predicted {
    if (_predicted is EqualUnmodifiableListView) return _predicted;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_predicted);
  }

  final List<int> _actual;
  @override
  List<int> get actual {
    if (_actual is EqualUnmodifiableListView) return _actual;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_actual);
  }

  @override
  @JsonKey(name: 'bonus_num')
  final int bonusNum;
  @override
  final int match;
  @override
  final String prize;

  @override
  String toString() {
    return 'BacktestDrawResult(drawNo: $drawNo, predicted: $predicted, actual: $actual, bonusNum: $bonusNum, match: $match, prize: $prize)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BacktestDrawResultImpl &&
            (identical(other.drawNo, drawNo) || other.drawNo == drawNo) &&
            const DeepCollectionEquality().equals(
              other._predicted,
              _predicted,
            ) &&
            const DeepCollectionEquality().equals(other._actual, _actual) &&
            (identical(other.bonusNum, bonusNum) ||
                other.bonusNum == bonusNum) &&
            (identical(other.match, match) || other.match == match) &&
            (identical(other.prize, prize) || other.prize == prize));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    drawNo,
    const DeepCollectionEquality().hash(_predicted),
    const DeepCollectionEquality().hash(_actual),
    bonusNum,
    match,
    prize,
  );

  /// Create a copy of BacktestDrawResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BacktestDrawResultImplCopyWith<_$BacktestDrawResultImpl> get copyWith =>
      __$$BacktestDrawResultImplCopyWithImpl<_$BacktestDrawResultImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$BacktestDrawResultImplToJson(this);
  }
}

abstract class _BacktestDrawResult implements BacktestDrawResult {
  const factory _BacktestDrawResult({
    @JsonKey(name: 'draw_no') required final int drawNo,
    required final List<int> predicted,
    required final List<int> actual,
    @JsonKey(name: 'bonus_num') required final int bonusNum,
    required final int match,
    required final String prize,
  }) = _$BacktestDrawResultImpl;

  factory _BacktestDrawResult.fromJson(Map<String, dynamic> json) =
      _$BacktestDrawResultImpl.fromJson;

  @override
  @JsonKey(name: 'draw_no')
  int get drawNo;
  @override
  List<int> get predicted;
  @override
  List<int> get actual;
  @override
  @JsonKey(name: 'bonus_num')
  int get bonusNum;
  @override
  int get match;
  @override
  String get prize;

  /// Create a copy of BacktestDrawResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BacktestDrawResultImplCopyWith<_$BacktestDrawResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BacktestComparison _$BacktestComparisonFromJson(Map<String, dynamic> json) {
  return _BacktestComparison.fromJson(json);
}

/// @nodoc
mixin _$BacktestComparison {
  @JsonKey(name: 'win_rate_analysis')
  double get winRateAnalysis => throw _privateConstructorUsedError;
  @JsonKey(name: 'win_rate_random')
  double get winRateRandom => throw _privateConstructorUsedError;
  @JsonKey(name: 'win_rate_diff')
  double get winRateDiff => throw _privateConstructorUsedError;
  @JsonKey(name: 'win_rate_relative')
  double get winRateRelative => throw _privateConstructorUsedError;
  @JsonKey(name: 'prize_rate_diff')
  Map<String, double> get prizeRateDiff => throw _privateConstructorUsedError;

  /// Serializes this BacktestComparison to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BacktestComparison
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BacktestComparisonCopyWith<BacktestComparison> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BacktestComparisonCopyWith<$Res> {
  factory $BacktestComparisonCopyWith(
    BacktestComparison value,
    $Res Function(BacktestComparison) then,
  ) = _$BacktestComparisonCopyWithImpl<$Res, BacktestComparison>;
  @useResult
  $Res call({
    @JsonKey(name: 'win_rate_analysis') double winRateAnalysis,
    @JsonKey(name: 'win_rate_random') double winRateRandom,
    @JsonKey(name: 'win_rate_diff') double winRateDiff,
    @JsonKey(name: 'win_rate_relative') double winRateRelative,
    @JsonKey(name: 'prize_rate_diff') Map<String, double> prizeRateDiff,
  });
}

/// @nodoc
class _$BacktestComparisonCopyWithImpl<$Res, $Val extends BacktestComparison>
    implements $BacktestComparisonCopyWith<$Res> {
  _$BacktestComparisonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BacktestComparison
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? winRateAnalysis = null,
    Object? winRateRandom = null,
    Object? winRateDiff = null,
    Object? winRateRelative = null,
    Object? prizeRateDiff = null,
  }) {
    return _then(
      _value.copyWith(
            winRateAnalysis: null == winRateAnalysis
                ? _value.winRateAnalysis
                : winRateAnalysis // ignore: cast_nullable_to_non_nullable
                      as double,
            winRateRandom: null == winRateRandom
                ? _value.winRateRandom
                : winRateRandom // ignore: cast_nullable_to_non_nullable
                      as double,
            winRateDiff: null == winRateDiff
                ? _value.winRateDiff
                : winRateDiff // ignore: cast_nullable_to_non_nullable
                      as double,
            winRateRelative: null == winRateRelative
                ? _value.winRateRelative
                : winRateRelative // ignore: cast_nullable_to_non_nullable
                      as double,
            prizeRateDiff: null == prizeRateDiff
                ? _value.prizeRateDiff
                : prizeRateDiff // ignore: cast_nullable_to_non_nullable
                      as Map<String, double>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BacktestComparisonImplCopyWith<$Res>
    implements $BacktestComparisonCopyWith<$Res> {
  factory _$$BacktestComparisonImplCopyWith(
    _$BacktestComparisonImpl value,
    $Res Function(_$BacktestComparisonImpl) then,
  ) = __$$BacktestComparisonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'win_rate_analysis') double winRateAnalysis,
    @JsonKey(name: 'win_rate_random') double winRateRandom,
    @JsonKey(name: 'win_rate_diff') double winRateDiff,
    @JsonKey(name: 'win_rate_relative') double winRateRelative,
    @JsonKey(name: 'prize_rate_diff') Map<String, double> prizeRateDiff,
  });
}

/// @nodoc
class __$$BacktestComparisonImplCopyWithImpl<$Res>
    extends _$BacktestComparisonCopyWithImpl<$Res, _$BacktestComparisonImpl>
    implements _$$BacktestComparisonImplCopyWith<$Res> {
  __$$BacktestComparisonImplCopyWithImpl(
    _$BacktestComparisonImpl _value,
    $Res Function(_$BacktestComparisonImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BacktestComparison
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? winRateAnalysis = null,
    Object? winRateRandom = null,
    Object? winRateDiff = null,
    Object? winRateRelative = null,
    Object? prizeRateDiff = null,
  }) {
    return _then(
      _$BacktestComparisonImpl(
        winRateAnalysis: null == winRateAnalysis
            ? _value.winRateAnalysis
            : winRateAnalysis // ignore: cast_nullable_to_non_nullable
                  as double,
        winRateRandom: null == winRateRandom
            ? _value.winRateRandom
            : winRateRandom // ignore: cast_nullable_to_non_nullable
                  as double,
        winRateDiff: null == winRateDiff
            ? _value.winRateDiff
            : winRateDiff // ignore: cast_nullable_to_non_nullable
                  as double,
        winRateRelative: null == winRateRelative
            ? _value.winRateRelative
            : winRateRelative // ignore: cast_nullable_to_non_nullable
                  as double,
        prizeRateDiff: null == prizeRateDiff
            ? _value._prizeRateDiff
            : prizeRateDiff // ignore: cast_nullable_to_non_nullable
                  as Map<String, double>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BacktestComparisonImpl implements _BacktestComparison {
  const _$BacktestComparisonImpl({
    @JsonKey(name: 'win_rate_analysis') required this.winRateAnalysis,
    @JsonKey(name: 'win_rate_random') required this.winRateRandom,
    @JsonKey(name: 'win_rate_diff') required this.winRateDiff,
    @JsonKey(name: 'win_rate_relative') required this.winRateRelative,
    @JsonKey(name: 'prize_rate_diff')
    required final Map<String, double> prizeRateDiff,
  }) : _prizeRateDiff = prizeRateDiff;

  factory _$BacktestComparisonImpl.fromJson(Map<String, dynamic> json) =>
      _$$BacktestComparisonImplFromJson(json);

  @override
  @JsonKey(name: 'win_rate_analysis')
  final double winRateAnalysis;
  @override
  @JsonKey(name: 'win_rate_random')
  final double winRateRandom;
  @override
  @JsonKey(name: 'win_rate_diff')
  final double winRateDiff;
  @override
  @JsonKey(name: 'win_rate_relative')
  final double winRateRelative;
  final Map<String, double> _prizeRateDiff;
  @override
  @JsonKey(name: 'prize_rate_diff')
  Map<String, double> get prizeRateDiff {
    if (_prizeRateDiff is EqualUnmodifiableMapView) return _prizeRateDiff;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_prizeRateDiff);
  }

  @override
  String toString() {
    return 'BacktestComparison(winRateAnalysis: $winRateAnalysis, winRateRandom: $winRateRandom, winRateDiff: $winRateDiff, winRateRelative: $winRateRelative, prizeRateDiff: $prizeRateDiff)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BacktestComparisonImpl &&
            (identical(other.winRateAnalysis, winRateAnalysis) ||
                other.winRateAnalysis == winRateAnalysis) &&
            (identical(other.winRateRandom, winRateRandom) ||
                other.winRateRandom == winRateRandom) &&
            (identical(other.winRateDiff, winRateDiff) ||
                other.winRateDiff == winRateDiff) &&
            (identical(other.winRateRelative, winRateRelative) ||
                other.winRateRelative == winRateRelative) &&
            const DeepCollectionEquality().equals(
              other._prizeRateDiff,
              _prizeRateDiff,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    winRateAnalysis,
    winRateRandom,
    winRateDiff,
    winRateRelative,
    const DeepCollectionEquality().hash(_prizeRateDiff),
  );

  /// Create a copy of BacktestComparison
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BacktestComparisonImplCopyWith<_$BacktestComparisonImpl> get copyWith =>
      __$$BacktestComparisonImplCopyWithImpl<_$BacktestComparisonImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$BacktestComparisonImplToJson(this);
  }
}

abstract class _BacktestComparison implements BacktestComparison {
  const factory _BacktestComparison({
    @JsonKey(name: 'win_rate_analysis') required final double winRateAnalysis,
    @JsonKey(name: 'win_rate_random') required final double winRateRandom,
    @JsonKey(name: 'win_rate_diff') required final double winRateDiff,
    @JsonKey(name: 'win_rate_relative') required final double winRateRelative,
    @JsonKey(name: 'prize_rate_diff')
    required final Map<String, double> prizeRateDiff,
  }) = _$BacktestComparisonImpl;

  factory _BacktestComparison.fromJson(Map<String, dynamic> json) =
      _$BacktestComparisonImpl.fromJson;

  @override
  @JsonKey(name: 'win_rate_analysis')
  double get winRateAnalysis;
  @override
  @JsonKey(name: 'win_rate_random')
  double get winRateRandom;
  @override
  @JsonKey(name: 'win_rate_diff')
  double get winRateDiff;
  @override
  @JsonKey(name: 'win_rate_relative')
  double get winRateRelative;
  @override
  @JsonKey(name: 'prize_rate_diff')
  Map<String, double> get prizeRateDiff;

  /// Create a copy of BacktestComparison
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BacktestComparisonImplCopyWith<_$BacktestComparisonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BacktestResult _$BacktestResultFromJson(Map<String, dynamic> json) {
  return _BacktestResult.fromJson(json);
}

/// @nodoc
mixin _$BacktestResult {
  BacktestRequest get request => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_simulations')
  int get totalSimulations => throw _privateConstructorUsedError;
  @JsonKey(name: 'prize_distribution')
  Map<String, int> get prizeDistribution => throw _privateConstructorUsedError;
  @JsonKey(name: 'prize_rates')
  Map<String, double> get prizeRates => throw _privateConstructorUsedError;
  @JsonKey(name: 'random_prize_distribution')
  Map<String, int> get randomPrizeDistribution =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'random_prize_rates')
  Map<String, double> get randomPrizeRates =>
      throw _privateConstructorUsedError;
  BacktestComparison get comparison => throw _privateConstructorUsedError;
  @JsonKey(name: 'prize_per_game')
  Map<String, int> get prizePerGame => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_prize_analysis')
  int get totalPrizeAnalysis => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_prize_random')
  int get totalPrizeRandom => throw _privateConstructorUsedError;
  @JsonKey(name: 'top_prize_results')
  List<BacktestDrawResult> get topPrizeResults =>
      throw _privateConstructorUsedError;

  /// Serializes this BacktestResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BacktestResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BacktestResultCopyWith<BacktestResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BacktestResultCopyWith<$Res> {
  factory $BacktestResultCopyWith(
    BacktestResult value,
    $Res Function(BacktestResult) then,
  ) = _$BacktestResultCopyWithImpl<$Res, BacktestResult>;
  @useResult
  $Res call({
    BacktestRequest request,
    @JsonKey(name: 'total_simulations') int totalSimulations,
    @JsonKey(name: 'prize_distribution') Map<String, int> prizeDistribution,
    @JsonKey(name: 'prize_rates') Map<String, double> prizeRates,
    @JsonKey(name: 'random_prize_distribution')
    Map<String, int> randomPrizeDistribution,
    @JsonKey(name: 'random_prize_rates') Map<String, double> randomPrizeRates,
    BacktestComparison comparison,
    @JsonKey(name: 'prize_per_game') Map<String, int> prizePerGame,
    @JsonKey(name: 'total_prize_analysis') int totalPrizeAnalysis,
    @JsonKey(name: 'total_prize_random') int totalPrizeRandom,
    @JsonKey(name: 'top_prize_results')
    List<BacktestDrawResult> topPrizeResults,
  });

  $BacktestRequestCopyWith<$Res> get request;
  $BacktestComparisonCopyWith<$Res> get comparison;
}

/// @nodoc
class _$BacktestResultCopyWithImpl<$Res, $Val extends BacktestResult>
    implements $BacktestResultCopyWith<$Res> {
  _$BacktestResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BacktestResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
    Object? totalSimulations = null,
    Object? prizeDistribution = null,
    Object? prizeRates = null,
    Object? randomPrizeDistribution = null,
    Object? randomPrizeRates = null,
    Object? comparison = null,
    Object? prizePerGame = null,
    Object? totalPrizeAnalysis = null,
    Object? totalPrizeRandom = null,
    Object? topPrizeResults = null,
  }) {
    return _then(
      _value.copyWith(
            request: null == request
                ? _value.request
                : request // ignore: cast_nullable_to_non_nullable
                      as BacktestRequest,
            totalSimulations: null == totalSimulations
                ? _value.totalSimulations
                : totalSimulations // ignore: cast_nullable_to_non_nullable
                      as int,
            prizeDistribution: null == prizeDistribution
                ? _value.prizeDistribution
                : prizeDistribution // ignore: cast_nullable_to_non_nullable
                      as Map<String, int>,
            prizeRates: null == prizeRates
                ? _value.prizeRates
                : prizeRates // ignore: cast_nullable_to_non_nullable
                      as Map<String, double>,
            randomPrizeDistribution: null == randomPrizeDistribution
                ? _value.randomPrizeDistribution
                : randomPrizeDistribution // ignore: cast_nullable_to_non_nullable
                      as Map<String, int>,
            randomPrizeRates: null == randomPrizeRates
                ? _value.randomPrizeRates
                : randomPrizeRates // ignore: cast_nullable_to_non_nullable
                      as Map<String, double>,
            comparison: null == comparison
                ? _value.comparison
                : comparison // ignore: cast_nullable_to_non_nullable
                      as BacktestComparison,
            prizePerGame: null == prizePerGame
                ? _value.prizePerGame
                : prizePerGame // ignore: cast_nullable_to_non_nullable
                      as Map<String, int>,
            totalPrizeAnalysis: null == totalPrizeAnalysis
                ? _value.totalPrizeAnalysis
                : totalPrizeAnalysis // ignore: cast_nullable_to_non_nullable
                      as int,
            totalPrizeRandom: null == totalPrizeRandom
                ? _value.totalPrizeRandom
                : totalPrizeRandom // ignore: cast_nullable_to_non_nullable
                      as int,
            topPrizeResults: null == topPrizeResults
                ? _value.topPrizeResults
                : topPrizeResults // ignore: cast_nullable_to_non_nullable
                      as List<BacktestDrawResult>,
          )
          as $Val,
    );
  }

  /// Create a copy of BacktestResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BacktestRequestCopyWith<$Res> get request {
    return $BacktestRequestCopyWith<$Res>(_value.request, (value) {
      return _then(_value.copyWith(request: value) as $Val);
    });
  }

  /// Create a copy of BacktestResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BacktestComparisonCopyWith<$Res> get comparison {
    return $BacktestComparisonCopyWith<$Res>(_value.comparison, (value) {
      return _then(_value.copyWith(comparison: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BacktestResultImplCopyWith<$Res>
    implements $BacktestResultCopyWith<$Res> {
  factory _$$BacktestResultImplCopyWith(
    _$BacktestResultImpl value,
    $Res Function(_$BacktestResultImpl) then,
  ) = __$$BacktestResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    BacktestRequest request,
    @JsonKey(name: 'total_simulations') int totalSimulations,
    @JsonKey(name: 'prize_distribution') Map<String, int> prizeDistribution,
    @JsonKey(name: 'prize_rates') Map<String, double> prizeRates,
    @JsonKey(name: 'random_prize_distribution')
    Map<String, int> randomPrizeDistribution,
    @JsonKey(name: 'random_prize_rates') Map<String, double> randomPrizeRates,
    BacktestComparison comparison,
    @JsonKey(name: 'prize_per_game') Map<String, int> prizePerGame,
    @JsonKey(name: 'total_prize_analysis') int totalPrizeAnalysis,
    @JsonKey(name: 'total_prize_random') int totalPrizeRandom,
    @JsonKey(name: 'top_prize_results')
    List<BacktestDrawResult> topPrizeResults,
  });

  @override
  $BacktestRequestCopyWith<$Res> get request;
  @override
  $BacktestComparisonCopyWith<$Res> get comparison;
}

/// @nodoc
class __$$BacktestResultImplCopyWithImpl<$Res>
    extends _$BacktestResultCopyWithImpl<$Res, _$BacktestResultImpl>
    implements _$$BacktestResultImplCopyWith<$Res> {
  __$$BacktestResultImplCopyWithImpl(
    _$BacktestResultImpl _value,
    $Res Function(_$BacktestResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BacktestResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
    Object? totalSimulations = null,
    Object? prizeDistribution = null,
    Object? prizeRates = null,
    Object? randomPrizeDistribution = null,
    Object? randomPrizeRates = null,
    Object? comparison = null,
    Object? prizePerGame = null,
    Object? totalPrizeAnalysis = null,
    Object? totalPrizeRandom = null,
    Object? topPrizeResults = null,
  }) {
    return _then(
      _$BacktestResultImpl(
        request: null == request
            ? _value.request
            : request // ignore: cast_nullable_to_non_nullable
                  as BacktestRequest,
        totalSimulations: null == totalSimulations
            ? _value.totalSimulations
            : totalSimulations // ignore: cast_nullable_to_non_nullable
                  as int,
        prizeDistribution: null == prizeDistribution
            ? _value._prizeDistribution
            : prizeDistribution // ignore: cast_nullable_to_non_nullable
                  as Map<String, int>,
        prizeRates: null == prizeRates
            ? _value._prizeRates
            : prizeRates // ignore: cast_nullable_to_non_nullable
                  as Map<String, double>,
        randomPrizeDistribution: null == randomPrizeDistribution
            ? _value._randomPrizeDistribution
            : randomPrizeDistribution // ignore: cast_nullable_to_non_nullable
                  as Map<String, int>,
        randomPrizeRates: null == randomPrizeRates
            ? _value._randomPrizeRates
            : randomPrizeRates // ignore: cast_nullable_to_non_nullable
                  as Map<String, double>,
        comparison: null == comparison
            ? _value.comparison
            : comparison // ignore: cast_nullable_to_non_nullable
                  as BacktestComparison,
        prizePerGame: null == prizePerGame
            ? _value._prizePerGame
            : prizePerGame // ignore: cast_nullable_to_non_nullable
                  as Map<String, int>,
        totalPrizeAnalysis: null == totalPrizeAnalysis
            ? _value.totalPrizeAnalysis
            : totalPrizeAnalysis // ignore: cast_nullable_to_non_nullable
                  as int,
        totalPrizeRandom: null == totalPrizeRandom
            ? _value.totalPrizeRandom
            : totalPrizeRandom // ignore: cast_nullable_to_non_nullable
                  as int,
        topPrizeResults: null == topPrizeResults
            ? _value._topPrizeResults
            : topPrizeResults // ignore: cast_nullable_to_non_nullable
                  as List<BacktestDrawResult>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BacktestResultImpl implements _BacktestResult {
  const _$BacktestResultImpl({
    required this.request,
    @JsonKey(name: 'total_simulations') required this.totalSimulations,
    @JsonKey(name: 'prize_distribution')
    required final Map<String, int> prizeDistribution,
    @JsonKey(name: 'prize_rates') required final Map<String, double> prizeRates,
    @JsonKey(name: 'random_prize_distribution')
    required final Map<String, int> randomPrizeDistribution,
    @JsonKey(name: 'random_prize_rates')
    required final Map<String, double> randomPrizeRates,
    required this.comparison,
    @JsonKey(name: 'prize_per_game')
    required final Map<String, int> prizePerGame,
    @JsonKey(name: 'total_prize_analysis') required this.totalPrizeAnalysis,
    @JsonKey(name: 'total_prize_random') required this.totalPrizeRandom,
    @JsonKey(name: 'top_prize_results')
    required final List<BacktestDrawResult> topPrizeResults,
  }) : _prizeDistribution = prizeDistribution,
       _prizeRates = prizeRates,
       _randomPrizeDistribution = randomPrizeDistribution,
       _randomPrizeRates = randomPrizeRates,
       _prizePerGame = prizePerGame,
       _topPrizeResults = topPrizeResults;

  factory _$BacktestResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$BacktestResultImplFromJson(json);

  @override
  final BacktestRequest request;
  @override
  @JsonKey(name: 'total_simulations')
  final int totalSimulations;
  final Map<String, int> _prizeDistribution;
  @override
  @JsonKey(name: 'prize_distribution')
  Map<String, int> get prizeDistribution {
    if (_prizeDistribution is EqualUnmodifiableMapView)
      return _prizeDistribution;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_prizeDistribution);
  }

  final Map<String, double> _prizeRates;
  @override
  @JsonKey(name: 'prize_rates')
  Map<String, double> get prizeRates {
    if (_prizeRates is EqualUnmodifiableMapView) return _prizeRates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_prizeRates);
  }

  final Map<String, int> _randomPrizeDistribution;
  @override
  @JsonKey(name: 'random_prize_distribution')
  Map<String, int> get randomPrizeDistribution {
    if (_randomPrizeDistribution is EqualUnmodifiableMapView)
      return _randomPrizeDistribution;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_randomPrizeDistribution);
  }

  final Map<String, double> _randomPrizeRates;
  @override
  @JsonKey(name: 'random_prize_rates')
  Map<String, double> get randomPrizeRates {
    if (_randomPrizeRates is EqualUnmodifiableMapView) return _randomPrizeRates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_randomPrizeRates);
  }

  @override
  final BacktestComparison comparison;
  final Map<String, int> _prizePerGame;
  @override
  @JsonKey(name: 'prize_per_game')
  Map<String, int> get prizePerGame {
    if (_prizePerGame is EqualUnmodifiableMapView) return _prizePerGame;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_prizePerGame);
  }

  @override
  @JsonKey(name: 'total_prize_analysis')
  final int totalPrizeAnalysis;
  @override
  @JsonKey(name: 'total_prize_random')
  final int totalPrizeRandom;
  final List<BacktestDrawResult> _topPrizeResults;
  @override
  @JsonKey(name: 'top_prize_results')
  List<BacktestDrawResult> get topPrizeResults {
    if (_topPrizeResults is EqualUnmodifiableListView) return _topPrizeResults;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topPrizeResults);
  }

  @override
  String toString() {
    return 'BacktestResult(request: $request, totalSimulations: $totalSimulations, prizeDistribution: $prizeDistribution, prizeRates: $prizeRates, randomPrizeDistribution: $randomPrizeDistribution, randomPrizeRates: $randomPrizeRates, comparison: $comparison, prizePerGame: $prizePerGame, totalPrizeAnalysis: $totalPrizeAnalysis, totalPrizeRandom: $totalPrizeRandom, topPrizeResults: $topPrizeResults)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BacktestResultImpl &&
            (identical(other.request, request) || other.request == request) &&
            (identical(other.totalSimulations, totalSimulations) ||
                other.totalSimulations == totalSimulations) &&
            const DeepCollectionEquality().equals(
              other._prizeDistribution,
              _prizeDistribution,
            ) &&
            const DeepCollectionEquality().equals(
              other._prizeRates,
              _prizeRates,
            ) &&
            const DeepCollectionEquality().equals(
              other._randomPrizeDistribution,
              _randomPrizeDistribution,
            ) &&
            const DeepCollectionEquality().equals(
              other._randomPrizeRates,
              _randomPrizeRates,
            ) &&
            (identical(other.comparison, comparison) ||
                other.comparison == comparison) &&
            const DeepCollectionEquality().equals(
              other._prizePerGame,
              _prizePerGame,
            ) &&
            (identical(other.totalPrizeAnalysis, totalPrizeAnalysis) ||
                other.totalPrizeAnalysis == totalPrizeAnalysis) &&
            (identical(other.totalPrizeRandom, totalPrizeRandom) ||
                other.totalPrizeRandom == totalPrizeRandom) &&
            const DeepCollectionEquality().equals(
              other._topPrizeResults,
              _topPrizeResults,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    request,
    totalSimulations,
    const DeepCollectionEquality().hash(_prizeDistribution),
    const DeepCollectionEquality().hash(_prizeRates),
    const DeepCollectionEquality().hash(_randomPrizeDistribution),
    const DeepCollectionEquality().hash(_randomPrizeRates),
    comparison,
    const DeepCollectionEquality().hash(_prizePerGame),
    totalPrizeAnalysis,
    totalPrizeRandom,
    const DeepCollectionEquality().hash(_topPrizeResults),
  );

  /// Create a copy of BacktestResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BacktestResultImplCopyWith<_$BacktestResultImpl> get copyWith =>
      __$$BacktestResultImplCopyWithImpl<_$BacktestResultImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$BacktestResultImplToJson(this);
  }
}

abstract class _BacktestResult implements BacktestResult {
  const factory _BacktestResult({
    required final BacktestRequest request,
    @JsonKey(name: 'total_simulations') required final int totalSimulations,
    @JsonKey(name: 'prize_distribution')
    required final Map<String, int> prizeDistribution,
    @JsonKey(name: 'prize_rates') required final Map<String, double> prizeRates,
    @JsonKey(name: 'random_prize_distribution')
    required final Map<String, int> randomPrizeDistribution,
    @JsonKey(name: 'random_prize_rates')
    required final Map<String, double> randomPrizeRates,
    required final BacktestComparison comparison,
    @JsonKey(name: 'prize_per_game')
    required final Map<String, int> prizePerGame,
    @JsonKey(name: 'total_prize_analysis')
    required final int totalPrizeAnalysis,
    @JsonKey(name: 'total_prize_random') required final int totalPrizeRandom,
    @JsonKey(name: 'top_prize_results')
    required final List<BacktestDrawResult> topPrizeResults,
  }) = _$BacktestResultImpl;

  factory _BacktestResult.fromJson(Map<String, dynamic> json) =
      _$BacktestResultImpl.fromJson;

  @override
  BacktestRequest get request;
  @override
  @JsonKey(name: 'total_simulations')
  int get totalSimulations;
  @override
  @JsonKey(name: 'prize_distribution')
  Map<String, int> get prizeDistribution;
  @override
  @JsonKey(name: 'prize_rates')
  Map<String, double> get prizeRates;
  @override
  @JsonKey(name: 'random_prize_distribution')
  Map<String, int> get randomPrizeDistribution;
  @override
  @JsonKey(name: 'random_prize_rates')
  Map<String, double> get randomPrizeRates;
  @override
  BacktestComparison get comparison;
  @override
  @JsonKey(name: 'prize_per_game')
  Map<String, int> get prizePerGame;
  @override
  @JsonKey(name: 'total_prize_analysis')
  int get totalPrizeAnalysis;
  @override
  @JsonKey(name: 'total_prize_random')
  int get totalPrizeRandom;
  @override
  @JsonKey(name: 'top_prize_results')
  List<BacktestDrawResult> get topPrizeResults;

  /// Create a copy of BacktestResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BacktestResultImplCopyWith<_$BacktestResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
