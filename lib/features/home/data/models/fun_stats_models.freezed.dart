// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fun_stats_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

FunStatRecord _$FunStatRecordFromJson(Map<String, dynamic> json) {
  return _FunStatRecord.fromJson(json);
}

/// @nodoc
mixin _$FunStatRecord {
  @JsonKey(name: 'draw_no')
  int get drawNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'draw_date')
  String get drawDate => throw _privateConstructorUsedError;
  int get value => throw _privateConstructorUsedError;

  /// Serializes this FunStatRecord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FunStatRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FunStatRecordCopyWith<FunStatRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FunStatRecordCopyWith<$Res> {
  factory $FunStatRecordCopyWith(
    FunStatRecord value,
    $Res Function(FunStatRecord) then,
  ) = _$FunStatRecordCopyWithImpl<$Res, FunStatRecord>;
  @useResult
  $Res call({
    @JsonKey(name: 'draw_no') int drawNo,
    @JsonKey(name: 'draw_date') String drawDate,
    int value,
  });
}

/// @nodoc
class _$FunStatRecordCopyWithImpl<$Res, $Val extends FunStatRecord>
    implements $FunStatRecordCopyWith<$Res> {
  _$FunStatRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FunStatRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? drawNo = null,
    Object? drawDate = null,
    Object? value = null,
  }) {
    return _then(
      _value.copyWith(
            drawNo: null == drawNo
                ? _value.drawNo
                : drawNo // ignore: cast_nullable_to_non_nullable
                      as int,
            drawDate: null == drawDate
                ? _value.drawDate
                : drawDate // ignore: cast_nullable_to_non_nullable
                      as String,
            value: null == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FunStatRecordImplCopyWith<$Res>
    implements $FunStatRecordCopyWith<$Res> {
  factory _$$FunStatRecordImplCopyWith(
    _$FunStatRecordImpl value,
    $Res Function(_$FunStatRecordImpl) then,
  ) = __$$FunStatRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'draw_no') int drawNo,
    @JsonKey(name: 'draw_date') String drawDate,
    int value,
  });
}

/// @nodoc
class __$$FunStatRecordImplCopyWithImpl<$Res>
    extends _$FunStatRecordCopyWithImpl<$Res, _$FunStatRecordImpl>
    implements _$$FunStatRecordImplCopyWith<$Res> {
  __$$FunStatRecordImplCopyWithImpl(
    _$FunStatRecordImpl _value,
    $Res Function(_$FunStatRecordImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FunStatRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? drawNo = null,
    Object? drawDate = null,
    Object? value = null,
  }) {
    return _then(
      _$FunStatRecordImpl(
        drawNo: null == drawNo
            ? _value.drawNo
            : drawNo // ignore: cast_nullable_to_non_nullable
                  as int,
        drawDate: null == drawDate
            ? _value.drawDate
            : drawDate // ignore: cast_nullable_to_non_nullable
                  as String,
        value: null == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FunStatRecordImpl implements _FunStatRecord {
  const _$FunStatRecordImpl({
    @JsonKey(name: 'draw_no') required this.drawNo,
    @JsonKey(name: 'draw_date') required this.drawDate,
    required this.value,
  });

  factory _$FunStatRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$FunStatRecordImplFromJson(json);

  @override
  @JsonKey(name: 'draw_no')
  final int drawNo;
  @override
  @JsonKey(name: 'draw_date')
  final String drawDate;
  @override
  final int value;

  @override
  String toString() {
    return 'FunStatRecord(drawNo: $drawNo, drawDate: $drawDate, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FunStatRecordImpl &&
            (identical(other.drawNo, drawNo) || other.drawNo == drawNo) &&
            (identical(other.drawDate, drawDate) ||
                other.drawDate == drawDate) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, drawNo, drawDate, value);

  /// Create a copy of FunStatRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FunStatRecordImplCopyWith<_$FunStatRecordImpl> get copyWith =>
      __$$FunStatRecordImplCopyWithImpl<_$FunStatRecordImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FunStatRecordImplToJson(this);
  }
}

abstract class _FunStatRecord implements FunStatRecord {
  const factory _FunStatRecord({
    @JsonKey(name: 'draw_no') required final int drawNo,
    @JsonKey(name: 'draw_date') required final String drawDate,
    required final int value,
  }) = _$FunStatRecordImpl;

  factory _FunStatRecord.fromJson(Map<String, dynamic> json) =
      _$FunStatRecordImpl.fromJson;

  @override
  @JsonKey(name: 'draw_no')
  int get drawNo;
  @override
  @JsonKey(name: 'draw_date')
  String get drawDate;
  @override
  int get value;

  /// Create a copy of FunStatRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FunStatRecordImplCopyWith<_$FunStatRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FunStatDraw _$FunStatDrawFromJson(Map<String, dynamic> json) {
  return _FunStatDraw.fromJson(json);
}

/// @nodoc
mixin _$FunStatDraw {
  @JsonKey(name: 'draw_no')
  int get drawNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'draw_date')
  String get drawDate => throw _privateConstructorUsedError;
  List<int> get numbers => throw _privateConstructorUsedError;

  /// Serializes this FunStatDraw to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FunStatDraw
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FunStatDrawCopyWith<FunStatDraw> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FunStatDrawCopyWith<$Res> {
  factory $FunStatDrawCopyWith(
    FunStatDraw value,
    $Res Function(FunStatDraw) then,
  ) = _$FunStatDrawCopyWithImpl<$Res, FunStatDraw>;
  @useResult
  $Res call({
    @JsonKey(name: 'draw_no') int drawNo,
    @JsonKey(name: 'draw_date') String drawDate,
    List<int> numbers,
  });
}

/// @nodoc
class _$FunStatDrawCopyWithImpl<$Res, $Val extends FunStatDraw>
    implements $FunStatDrawCopyWith<$Res> {
  _$FunStatDrawCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FunStatDraw
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? drawNo = null,
    Object? drawDate = null,
    Object? numbers = null,
  }) {
    return _then(
      _value.copyWith(
            drawNo: null == drawNo
                ? _value.drawNo
                : drawNo // ignore: cast_nullable_to_non_nullable
                      as int,
            drawDate: null == drawDate
                ? _value.drawDate
                : drawDate // ignore: cast_nullable_to_non_nullable
                      as String,
            numbers: null == numbers
                ? _value.numbers
                : numbers // ignore: cast_nullable_to_non_nullable
                      as List<int>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FunStatDrawImplCopyWith<$Res>
    implements $FunStatDrawCopyWith<$Res> {
  factory _$$FunStatDrawImplCopyWith(
    _$FunStatDrawImpl value,
    $Res Function(_$FunStatDrawImpl) then,
  ) = __$$FunStatDrawImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'draw_no') int drawNo,
    @JsonKey(name: 'draw_date') String drawDate,
    List<int> numbers,
  });
}

/// @nodoc
class __$$FunStatDrawImplCopyWithImpl<$Res>
    extends _$FunStatDrawCopyWithImpl<$Res, _$FunStatDrawImpl>
    implements _$$FunStatDrawImplCopyWith<$Res> {
  __$$FunStatDrawImplCopyWithImpl(
    _$FunStatDrawImpl _value,
    $Res Function(_$FunStatDrawImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FunStatDraw
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? drawNo = null,
    Object? drawDate = null,
    Object? numbers = null,
  }) {
    return _then(
      _$FunStatDrawImpl(
        drawNo: null == drawNo
            ? _value.drawNo
            : drawNo // ignore: cast_nullable_to_non_nullable
                  as int,
        drawDate: null == drawDate
            ? _value.drawDate
            : drawDate // ignore: cast_nullable_to_non_nullable
                  as String,
        numbers: null == numbers
            ? _value._numbers
            : numbers // ignore: cast_nullable_to_non_nullable
                  as List<int>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FunStatDrawImpl implements _FunStatDraw {
  const _$FunStatDrawImpl({
    @JsonKey(name: 'draw_no') required this.drawNo,
    @JsonKey(name: 'draw_date') required this.drawDate,
    required final List<int> numbers,
  }) : _numbers = numbers;

  factory _$FunStatDrawImpl.fromJson(Map<String, dynamic> json) =>
      _$$FunStatDrawImplFromJson(json);

  @override
  @JsonKey(name: 'draw_no')
  final int drawNo;
  @override
  @JsonKey(name: 'draw_date')
  final String drawDate;
  final List<int> _numbers;
  @override
  List<int> get numbers {
    if (_numbers is EqualUnmodifiableListView) return _numbers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_numbers);
  }

  @override
  String toString() {
    return 'FunStatDraw(drawNo: $drawNo, drawDate: $drawDate, numbers: $numbers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FunStatDrawImpl &&
            (identical(other.drawNo, drawNo) || other.drawNo == drawNo) &&
            (identical(other.drawDate, drawDate) ||
                other.drawDate == drawDate) &&
            const DeepCollectionEquality().equals(other._numbers, _numbers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    drawNo,
    drawDate,
    const DeepCollectionEquality().hash(_numbers),
  );

  /// Create a copy of FunStatDraw
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FunStatDrawImplCopyWith<_$FunStatDrawImpl> get copyWith =>
      __$$FunStatDrawImplCopyWithImpl<_$FunStatDrawImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FunStatDrawImplToJson(this);
  }
}

abstract class _FunStatDraw implements FunStatDraw {
  const factory _FunStatDraw({
    @JsonKey(name: 'draw_no') required final int drawNo,
    @JsonKey(name: 'draw_date') required final String drawDate,
    required final List<int> numbers,
  }) = _$FunStatDrawImpl;

  factory _FunStatDraw.fromJson(Map<String, dynamic> json) =
      _$FunStatDrawImpl.fromJson;

  @override
  @JsonKey(name: 'draw_no')
  int get drawNo;
  @override
  @JsonKey(name: 'draw_date')
  String get drawDate;
  @override
  List<int> get numbers;

  /// Create a copy of FunStatDraw
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FunStatDrawImplCopyWith<_$FunStatDrawImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FunStatAbsent _$FunStatAbsentFromJson(Map<String, dynamic> json) {
  return _FunStatAbsent.fromJson(json);
}

/// @nodoc
mixin _$FunStatAbsent {
  int get number => throw _privateConstructorUsedError;
  @JsonKey(name: 'from_draw_no')
  int get fromDrawNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'to_draw_no')
  int get toDrawNo => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;

  /// Serializes this FunStatAbsent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FunStatAbsent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FunStatAbsentCopyWith<FunStatAbsent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FunStatAbsentCopyWith<$Res> {
  factory $FunStatAbsentCopyWith(
    FunStatAbsent value,
    $Res Function(FunStatAbsent) then,
  ) = _$FunStatAbsentCopyWithImpl<$Res, FunStatAbsent>;
  @useResult
  $Res call({
    int number,
    @JsonKey(name: 'from_draw_no') int fromDrawNo,
    @JsonKey(name: 'to_draw_no') int toDrawNo,
    int duration,
  });
}

/// @nodoc
class _$FunStatAbsentCopyWithImpl<$Res, $Val extends FunStatAbsent>
    implements $FunStatAbsentCopyWith<$Res> {
  _$FunStatAbsentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FunStatAbsent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? fromDrawNo = null,
    Object? toDrawNo = null,
    Object? duration = null,
  }) {
    return _then(
      _value.copyWith(
            number: null == number
                ? _value.number
                : number // ignore: cast_nullable_to_non_nullable
                      as int,
            fromDrawNo: null == fromDrawNo
                ? _value.fromDrawNo
                : fromDrawNo // ignore: cast_nullable_to_non_nullable
                      as int,
            toDrawNo: null == toDrawNo
                ? _value.toDrawNo
                : toDrawNo // ignore: cast_nullable_to_non_nullable
                      as int,
            duration: null == duration
                ? _value.duration
                : duration // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FunStatAbsentImplCopyWith<$Res>
    implements $FunStatAbsentCopyWith<$Res> {
  factory _$$FunStatAbsentImplCopyWith(
    _$FunStatAbsentImpl value,
    $Res Function(_$FunStatAbsentImpl) then,
  ) = __$$FunStatAbsentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int number,
    @JsonKey(name: 'from_draw_no') int fromDrawNo,
    @JsonKey(name: 'to_draw_no') int toDrawNo,
    int duration,
  });
}

/// @nodoc
class __$$FunStatAbsentImplCopyWithImpl<$Res>
    extends _$FunStatAbsentCopyWithImpl<$Res, _$FunStatAbsentImpl>
    implements _$$FunStatAbsentImplCopyWith<$Res> {
  __$$FunStatAbsentImplCopyWithImpl(
    _$FunStatAbsentImpl _value,
    $Res Function(_$FunStatAbsentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FunStatAbsent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? fromDrawNo = null,
    Object? toDrawNo = null,
    Object? duration = null,
  }) {
    return _then(
      _$FunStatAbsentImpl(
        number: null == number
            ? _value.number
            : number // ignore: cast_nullable_to_non_nullable
                  as int,
        fromDrawNo: null == fromDrawNo
            ? _value.fromDrawNo
            : fromDrawNo // ignore: cast_nullable_to_non_nullable
                  as int,
        toDrawNo: null == toDrawNo
            ? _value.toDrawNo
            : toDrawNo // ignore: cast_nullable_to_non_nullable
                  as int,
        duration: null == duration
            ? _value.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FunStatAbsentImpl implements _FunStatAbsent {
  const _$FunStatAbsentImpl({
    required this.number,
    @JsonKey(name: 'from_draw_no') required this.fromDrawNo,
    @JsonKey(name: 'to_draw_no') required this.toDrawNo,
    required this.duration,
  });

  factory _$FunStatAbsentImpl.fromJson(Map<String, dynamic> json) =>
      _$$FunStatAbsentImplFromJson(json);

  @override
  final int number;
  @override
  @JsonKey(name: 'from_draw_no')
  final int fromDrawNo;
  @override
  @JsonKey(name: 'to_draw_no')
  final int toDrawNo;
  @override
  final int duration;

  @override
  String toString() {
    return 'FunStatAbsent(number: $number, fromDrawNo: $fromDrawNo, toDrawNo: $toDrawNo, duration: $duration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FunStatAbsentImpl &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.fromDrawNo, fromDrawNo) ||
                other.fromDrawNo == fromDrawNo) &&
            (identical(other.toDrawNo, toDrawNo) ||
                other.toDrawNo == toDrawNo) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, number, fromDrawNo, toDrawNo, duration);

  /// Create a copy of FunStatAbsent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FunStatAbsentImplCopyWith<_$FunStatAbsentImpl> get copyWith =>
      __$$FunStatAbsentImplCopyWithImpl<_$FunStatAbsentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FunStatAbsentImplToJson(this);
  }
}

abstract class _FunStatAbsent implements FunStatAbsent {
  const factory _FunStatAbsent({
    required final int number,
    @JsonKey(name: 'from_draw_no') required final int fromDrawNo,
    @JsonKey(name: 'to_draw_no') required final int toDrawNo,
    required final int duration,
  }) = _$FunStatAbsentImpl;

  factory _FunStatAbsent.fromJson(Map<String, dynamic> json) =
      _$FunStatAbsentImpl.fromJson;

  @override
  int get number;
  @override
  @JsonKey(name: 'from_draw_no')
  int get fromDrawNo;
  @override
  @JsonKey(name: 'to_draw_no')
  int get toDrawNo;
  @override
  int get duration;

  /// Create a copy of FunStatAbsent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FunStatAbsentImplCopyWith<_$FunStatAbsentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FunStats _$FunStatsFromJson(Map<String, dynamic> json) {
  return _FunStats.fromJson(json);
}

/// @nodoc
mixin _$FunStats {
  @JsonKey(name: 'max_prize_per_game')
  FunStatRecord get maxPrizePerGame => throw _privateConstructorUsedError;
  @JsonKey(name: 'min_prize_per_game')
  FunStatRecord get minPrizePerGame => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_winners')
  FunStatRecord get maxWinners => throw _privateConstructorUsedError;
  @JsonKey(name: 'min_winners')
  FunStatRecord get minWinners => throw _privateConstructorUsedError;
  @JsonKey(name: 'longest_absent')
  FunStatAbsent get longestAbsent => throw _privateConstructorUsedError;
  @JsonKey(name: 'all_odd_draws')
  List<FunStatDraw> get allOddDraws => throw _privateConstructorUsedError;
  @JsonKey(name: 'all_even_draws')
  List<FunStatDraw> get allEvenDraws => throw _privateConstructorUsedError;
  @JsonKey(name: 'calculated_at')
  String get calculatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'based_on_draw_no')
  int get basedOnDrawNo => throw _privateConstructorUsedError;

  /// Serializes this FunStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FunStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FunStatsCopyWith<FunStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FunStatsCopyWith<$Res> {
  factory $FunStatsCopyWith(FunStats value, $Res Function(FunStats) then) =
      _$FunStatsCopyWithImpl<$Res, FunStats>;
  @useResult
  $Res call({
    @JsonKey(name: 'max_prize_per_game') FunStatRecord maxPrizePerGame,
    @JsonKey(name: 'min_prize_per_game') FunStatRecord minPrizePerGame,
    @JsonKey(name: 'max_winners') FunStatRecord maxWinners,
    @JsonKey(name: 'min_winners') FunStatRecord minWinners,
    @JsonKey(name: 'longest_absent') FunStatAbsent longestAbsent,
    @JsonKey(name: 'all_odd_draws') List<FunStatDraw> allOddDraws,
    @JsonKey(name: 'all_even_draws') List<FunStatDraw> allEvenDraws,
    @JsonKey(name: 'calculated_at') String calculatedAt,
    @JsonKey(name: 'based_on_draw_no') int basedOnDrawNo,
  });

  $FunStatRecordCopyWith<$Res> get maxPrizePerGame;
  $FunStatRecordCopyWith<$Res> get minPrizePerGame;
  $FunStatRecordCopyWith<$Res> get maxWinners;
  $FunStatRecordCopyWith<$Res> get minWinners;
  $FunStatAbsentCopyWith<$Res> get longestAbsent;
}

/// @nodoc
class _$FunStatsCopyWithImpl<$Res, $Val extends FunStats>
    implements $FunStatsCopyWith<$Res> {
  _$FunStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FunStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? maxPrizePerGame = null,
    Object? minPrizePerGame = null,
    Object? maxWinners = null,
    Object? minWinners = null,
    Object? longestAbsent = null,
    Object? allOddDraws = null,
    Object? allEvenDraws = null,
    Object? calculatedAt = null,
    Object? basedOnDrawNo = null,
  }) {
    return _then(
      _value.copyWith(
            maxPrizePerGame: null == maxPrizePerGame
                ? _value.maxPrizePerGame
                : maxPrizePerGame // ignore: cast_nullable_to_non_nullable
                      as FunStatRecord,
            minPrizePerGame: null == minPrizePerGame
                ? _value.minPrizePerGame
                : minPrizePerGame // ignore: cast_nullable_to_non_nullable
                      as FunStatRecord,
            maxWinners: null == maxWinners
                ? _value.maxWinners
                : maxWinners // ignore: cast_nullable_to_non_nullable
                      as FunStatRecord,
            minWinners: null == minWinners
                ? _value.minWinners
                : minWinners // ignore: cast_nullable_to_non_nullable
                      as FunStatRecord,
            longestAbsent: null == longestAbsent
                ? _value.longestAbsent
                : longestAbsent // ignore: cast_nullable_to_non_nullable
                      as FunStatAbsent,
            allOddDraws: null == allOddDraws
                ? _value.allOddDraws
                : allOddDraws // ignore: cast_nullable_to_non_nullable
                      as List<FunStatDraw>,
            allEvenDraws: null == allEvenDraws
                ? _value.allEvenDraws
                : allEvenDraws // ignore: cast_nullable_to_non_nullable
                      as List<FunStatDraw>,
            calculatedAt: null == calculatedAt
                ? _value.calculatedAt
                : calculatedAt // ignore: cast_nullable_to_non_nullable
                      as String,
            basedOnDrawNo: null == basedOnDrawNo
                ? _value.basedOnDrawNo
                : basedOnDrawNo // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }

  /// Create a copy of FunStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FunStatRecordCopyWith<$Res> get maxPrizePerGame {
    return $FunStatRecordCopyWith<$Res>(_value.maxPrizePerGame, (value) {
      return _then(_value.copyWith(maxPrizePerGame: value) as $Val);
    });
  }

  /// Create a copy of FunStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FunStatRecordCopyWith<$Res> get minPrizePerGame {
    return $FunStatRecordCopyWith<$Res>(_value.minPrizePerGame, (value) {
      return _then(_value.copyWith(minPrizePerGame: value) as $Val);
    });
  }

  /// Create a copy of FunStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FunStatRecordCopyWith<$Res> get maxWinners {
    return $FunStatRecordCopyWith<$Res>(_value.maxWinners, (value) {
      return _then(_value.copyWith(maxWinners: value) as $Val);
    });
  }

  /// Create a copy of FunStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FunStatRecordCopyWith<$Res> get minWinners {
    return $FunStatRecordCopyWith<$Res>(_value.minWinners, (value) {
      return _then(_value.copyWith(minWinners: value) as $Val);
    });
  }

  /// Create a copy of FunStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FunStatAbsentCopyWith<$Res> get longestAbsent {
    return $FunStatAbsentCopyWith<$Res>(_value.longestAbsent, (value) {
      return _then(_value.copyWith(longestAbsent: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FunStatsImplCopyWith<$Res>
    implements $FunStatsCopyWith<$Res> {
  factory _$$FunStatsImplCopyWith(
    _$FunStatsImpl value,
    $Res Function(_$FunStatsImpl) then,
  ) = __$$FunStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'max_prize_per_game') FunStatRecord maxPrizePerGame,
    @JsonKey(name: 'min_prize_per_game') FunStatRecord minPrizePerGame,
    @JsonKey(name: 'max_winners') FunStatRecord maxWinners,
    @JsonKey(name: 'min_winners') FunStatRecord minWinners,
    @JsonKey(name: 'longest_absent') FunStatAbsent longestAbsent,
    @JsonKey(name: 'all_odd_draws') List<FunStatDraw> allOddDraws,
    @JsonKey(name: 'all_even_draws') List<FunStatDraw> allEvenDraws,
    @JsonKey(name: 'calculated_at') String calculatedAt,
    @JsonKey(name: 'based_on_draw_no') int basedOnDrawNo,
  });

  @override
  $FunStatRecordCopyWith<$Res> get maxPrizePerGame;
  @override
  $FunStatRecordCopyWith<$Res> get minPrizePerGame;
  @override
  $FunStatRecordCopyWith<$Res> get maxWinners;
  @override
  $FunStatRecordCopyWith<$Res> get minWinners;
  @override
  $FunStatAbsentCopyWith<$Res> get longestAbsent;
}

/// @nodoc
class __$$FunStatsImplCopyWithImpl<$Res>
    extends _$FunStatsCopyWithImpl<$Res, _$FunStatsImpl>
    implements _$$FunStatsImplCopyWith<$Res> {
  __$$FunStatsImplCopyWithImpl(
    _$FunStatsImpl _value,
    $Res Function(_$FunStatsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FunStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? maxPrizePerGame = null,
    Object? minPrizePerGame = null,
    Object? maxWinners = null,
    Object? minWinners = null,
    Object? longestAbsent = null,
    Object? allOddDraws = null,
    Object? allEvenDraws = null,
    Object? calculatedAt = null,
    Object? basedOnDrawNo = null,
  }) {
    return _then(
      _$FunStatsImpl(
        maxPrizePerGame: null == maxPrizePerGame
            ? _value.maxPrizePerGame
            : maxPrizePerGame // ignore: cast_nullable_to_non_nullable
                  as FunStatRecord,
        minPrizePerGame: null == minPrizePerGame
            ? _value.minPrizePerGame
            : minPrizePerGame // ignore: cast_nullable_to_non_nullable
                  as FunStatRecord,
        maxWinners: null == maxWinners
            ? _value.maxWinners
            : maxWinners // ignore: cast_nullable_to_non_nullable
                  as FunStatRecord,
        minWinners: null == minWinners
            ? _value.minWinners
            : minWinners // ignore: cast_nullable_to_non_nullable
                  as FunStatRecord,
        longestAbsent: null == longestAbsent
            ? _value.longestAbsent
            : longestAbsent // ignore: cast_nullable_to_non_nullable
                  as FunStatAbsent,
        allOddDraws: null == allOddDraws
            ? _value._allOddDraws
            : allOddDraws // ignore: cast_nullable_to_non_nullable
                  as List<FunStatDraw>,
        allEvenDraws: null == allEvenDraws
            ? _value._allEvenDraws
            : allEvenDraws // ignore: cast_nullable_to_non_nullable
                  as List<FunStatDraw>,
        calculatedAt: null == calculatedAt
            ? _value.calculatedAt
            : calculatedAt // ignore: cast_nullable_to_non_nullable
                  as String,
        basedOnDrawNo: null == basedOnDrawNo
            ? _value.basedOnDrawNo
            : basedOnDrawNo // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FunStatsImpl implements _FunStats {
  const _$FunStatsImpl({
    @JsonKey(name: 'max_prize_per_game') required this.maxPrizePerGame,
    @JsonKey(name: 'min_prize_per_game') required this.minPrizePerGame,
    @JsonKey(name: 'max_winners') required this.maxWinners,
    @JsonKey(name: 'min_winners') required this.minWinners,
    @JsonKey(name: 'longest_absent') required this.longestAbsent,
    @JsonKey(name: 'all_odd_draws')
    required final List<FunStatDraw> allOddDraws,
    @JsonKey(name: 'all_even_draws')
    required final List<FunStatDraw> allEvenDraws,
    @JsonKey(name: 'calculated_at') required this.calculatedAt,
    @JsonKey(name: 'based_on_draw_no') required this.basedOnDrawNo,
  }) : _allOddDraws = allOddDraws,
       _allEvenDraws = allEvenDraws;

  factory _$FunStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$FunStatsImplFromJson(json);

  @override
  @JsonKey(name: 'max_prize_per_game')
  final FunStatRecord maxPrizePerGame;
  @override
  @JsonKey(name: 'min_prize_per_game')
  final FunStatRecord minPrizePerGame;
  @override
  @JsonKey(name: 'max_winners')
  final FunStatRecord maxWinners;
  @override
  @JsonKey(name: 'min_winners')
  final FunStatRecord minWinners;
  @override
  @JsonKey(name: 'longest_absent')
  final FunStatAbsent longestAbsent;
  final List<FunStatDraw> _allOddDraws;
  @override
  @JsonKey(name: 'all_odd_draws')
  List<FunStatDraw> get allOddDraws {
    if (_allOddDraws is EqualUnmodifiableListView) return _allOddDraws;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allOddDraws);
  }

  final List<FunStatDraw> _allEvenDraws;
  @override
  @JsonKey(name: 'all_even_draws')
  List<FunStatDraw> get allEvenDraws {
    if (_allEvenDraws is EqualUnmodifiableListView) return _allEvenDraws;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allEvenDraws);
  }

  @override
  @JsonKey(name: 'calculated_at')
  final String calculatedAt;
  @override
  @JsonKey(name: 'based_on_draw_no')
  final int basedOnDrawNo;

  @override
  String toString() {
    return 'FunStats(maxPrizePerGame: $maxPrizePerGame, minPrizePerGame: $minPrizePerGame, maxWinners: $maxWinners, minWinners: $minWinners, longestAbsent: $longestAbsent, allOddDraws: $allOddDraws, allEvenDraws: $allEvenDraws, calculatedAt: $calculatedAt, basedOnDrawNo: $basedOnDrawNo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FunStatsImpl &&
            (identical(other.maxPrizePerGame, maxPrizePerGame) ||
                other.maxPrizePerGame == maxPrizePerGame) &&
            (identical(other.minPrizePerGame, minPrizePerGame) ||
                other.minPrizePerGame == minPrizePerGame) &&
            (identical(other.maxWinners, maxWinners) ||
                other.maxWinners == maxWinners) &&
            (identical(other.minWinners, minWinners) ||
                other.minWinners == minWinners) &&
            (identical(other.longestAbsent, longestAbsent) ||
                other.longestAbsent == longestAbsent) &&
            const DeepCollectionEquality().equals(
              other._allOddDraws,
              _allOddDraws,
            ) &&
            const DeepCollectionEquality().equals(
              other._allEvenDraws,
              _allEvenDraws,
            ) &&
            (identical(other.calculatedAt, calculatedAt) ||
                other.calculatedAt == calculatedAt) &&
            (identical(other.basedOnDrawNo, basedOnDrawNo) ||
                other.basedOnDrawNo == basedOnDrawNo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    maxPrizePerGame,
    minPrizePerGame,
    maxWinners,
    minWinners,
    longestAbsent,
    const DeepCollectionEquality().hash(_allOddDraws),
    const DeepCollectionEquality().hash(_allEvenDraws),
    calculatedAt,
    basedOnDrawNo,
  );

  /// Create a copy of FunStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FunStatsImplCopyWith<_$FunStatsImpl> get copyWith =>
      __$$FunStatsImplCopyWithImpl<_$FunStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FunStatsImplToJson(this);
  }
}

abstract class _FunStats implements FunStats {
  const factory _FunStats({
    @JsonKey(name: 'max_prize_per_game')
    required final FunStatRecord maxPrizePerGame,
    @JsonKey(name: 'min_prize_per_game')
    required final FunStatRecord minPrizePerGame,
    @JsonKey(name: 'max_winners') required final FunStatRecord maxWinners,
    @JsonKey(name: 'min_winners') required final FunStatRecord minWinners,
    @JsonKey(name: 'longest_absent') required final FunStatAbsent longestAbsent,
    @JsonKey(name: 'all_odd_draws')
    required final List<FunStatDraw> allOddDraws,
    @JsonKey(name: 'all_even_draws')
    required final List<FunStatDraw> allEvenDraws,
    @JsonKey(name: 'calculated_at') required final String calculatedAt,
    @JsonKey(name: 'based_on_draw_no') required final int basedOnDrawNo,
  }) = _$FunStatsImpl;

  factory _FunStats.fromJson(Map<String, dynamic> json) =
      _$FunStatsImpl.fromJson;

  @override
  @JsonKey(name: 'max_prize_per_game')
  FunStatRecord get maxPrizePerGame;
  @override
  @JsonKey(name: 'min_prize_per_game')
  FunStatRecord get minPrizePerGame;
  @override
  @JsonKey(name: 'max_winners')
  FunStatRecord get maxWinners;
  @override
  @JsonKey(name: 'min_winners')
  FunStatRecord get minWinners;
  @override
  @JsonKey(name: 'longest_absent')
  FunStatAbsent get longestAbsent;
  @override
  @JsonKey(name: 'all_odd_draws')
  List<FunStatDraw> get allOddDraws;
  @override
  @JsonKey(name: 'all_even_draws')
  List<FunStatDraw> get allEvenDraws;
  @override
  @JsonKey(name: 'calculated_at')
  String get calculatedAt;
  @override
  @JsonKey(name: 'based_on_draw_no')
  int get basedOnDrawNo;

  /// Create a copy of FunStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FunStatsImplCopyWith<_$FunStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
