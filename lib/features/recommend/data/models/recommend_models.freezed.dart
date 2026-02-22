// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recommend_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AnalysisMethod _$AnalysisMethodFromJson(Map<String, dynamic> json) {
  return _AnalysisMethod.fromJson(json);
}

/// @nodoc
mixin _$AnalysisMethod {
  int get id => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'sort_order')
  int get sortOrder => throw _privateConstructorUsedError;

  /// Serializes this AnalysisMethod to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnalysisMethod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnalysisMethodCopyWith<AnalysisMethod> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalysisMethodCopyWith<$Res> {
  factory $AnalysisMethodCopyWith(
    AnalysisMethod value,
    $Res Function(AnalysisMethod) then,
  ) = _$AnalysisMethodCopyWithImpl<$Res, AnalysisMethod>;
  @useResult
  $Res call({
    int id,
    String code,
    String name,
    String description,
    String category,
    @JsonKey(name: 'is_active') bool isActive,
    @JsonKey(name: 'sort_order') int sortOrder,
  });
}

/// @nodoc
class _$AnalysisMethodCopyWithImpl<$Res, $Val extends AnalysisMethod>
    implements $AnalysisMethodCopyWith<$Res> {
  _$AnalysisMethodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnalysisMethod
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? name = null,
    Object? description = null,
    Object? category = null,
    Object? isActive = null,
    Object? sortOrder = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            code: null == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as String,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
            sortOrder: null == sortOrder
                ? _value.sortOrder
                : sortOrder // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AnalysisMethodImplCopyWith<$Res>
    implements $AnalysisMethodCopyWith<$Res> {
  factory _$$AnalysisMethodImplCopyWith(
    _$AnalysisMethodImpl value,
    $Res Function(_$AnalysisMethodImpl) then,
  ) = __$$AnalysisMethodImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String code,
    String name,
    String description,
    String category,
    @JsonKey(name: 'is_active') bool isActive,
    @JsonKey(name: 'sort_order') int sortOrder,
  });
}

/// @nodoc
class __$$AnalysisMethodImplCopyWithImpl<$Res>
    extends _$AnalysisMethodCopyWithImpl<$Res, _$AnalysisMethodImpl>
    implements _$$AnalysisMethodImplCopyWith<$Res> {
  __$$AnalysisMethodImplCopyWithImpl(
    _$AnalysisMethodImpl _value,
    $Res Function(_$AnalysisMethodImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AnalysisMethod
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? name = null,
    Object? description = null,
    Object? category = null,
    Object? isActive = null,
    Object? sortOrder = null,
  }) {
    return _then(
      _$AnalysisMethodImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        code: null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        sortOrder: null == sortOrder
            ? _value.sortOrder
            : sortOrder // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AnalysisMethodImpl implements _AnalysisMethod {
  const _$AnalysisMethodImpl({
    required this.id,
    required this.code,
    required this.name,
    required this.description,
    required this.category,
    @JsonKey(name: 'is_active') required this.isActive,
    @JsonKey(name: 'sort_order') required this.sortOrder,
  });

  factory _$AnalysisMethodImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnalysisMethodImplFromJson(json);

  @override
  final int id;
  @override
  final String code;
  @override
  final String name;
  @override
  final String description;
  @override
  final String category;
  @override
  @JsonKey(name: 'is_active')
  final bool isActive;
  @override
  @JsonKey(name: 'sort_order')
  final int sortOrder;

  @override
  String toString() {
    return 'AnalysisMethod(id: $id, code: $code, name: $name, description: $description, category: $category, isActive: $isActive, sortOrder: $sortOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalysisMethodImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    code,
    name,
    description,
    category,
    isActive,
    sortOrder,
  );

  /// Create a copy of AnalysisMethod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalysisMethodImplCopyWith<_$AnalysisMethodImpl> get copyWith =>
      __$$AnalysisMethodImplCopyWithImpl<_$AnalysisMethodImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AnalysisMethodImplToJson(this);
  }
}

abstract class _AnalysisMethod implements AnalysisMethod {
  const factory _AnalysisMethod({
    required final int id,
    required final String code,
    required final String name,
    required final String description,
    required final String category,
    @JsonKey(name: 'is_active') required final bool isActive,
    @JsonKey(name: 'sort_order') required final int sortOrder,
  }) = _$AnalysisMethodImpl;

  factory _AnalysisMethod.fromJson(Map<String, dynamic> json) =
      _$AnalysisMethodImpl.fromJson;

  @override
  int get id;
  @override
  String get code;
  @override
  String get name;
  @override
  String get description;
  @override
  String get category;
  @override
  @JsonKey(name: 'is_active')
  bool get isActive;
  @override
  @JsonKey(name: 'sort_order')
  int get sortOrder;

  /// Create a copy of AnalysisMethod
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnalysisMethodImplCopyWith<_$AnalysisMethodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MethodListResponse _$MethodListResponseFromJson(Map<String, dynamic> json) {
  return _MethodListResponse.fromJson(json);
}

/// @nodoc
mixin _$MethodListResponse {
  List<AnalysisMethod> get methods => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_count')
  int get totalCount => throw _privateConstructorUsedError;

  /// Serializes this MethodListResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MethodListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MethodListResponseCopyWith<MethodListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MethodListResponseCopyWith<$Res> {
  factory $MethodListResponseCopyWith(
    MethodListResponse value,
    $Res Function(MethodListResponse) then,
  ) = _$MethodListResponseCopyWithImpl<$Res, MethodListResponse>;
  @useResult
  $Res call({
    List<AnalysisMethod> methods,
    @JsonKey(name: 'total_count') int totalCount,
  });
}

/// @nodoc
class _$MethodListResponseCopyWithImpl<$Res, $Val extends MethodListResponse>
    implements $MethodListResponseCopyWith<$Res> {
  _$MethodListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MethodListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? methods = null, Object? totalCount = null}) {
    return _then(
      _value.copyWith(
            methods: null == methods
                ? _value.methods
                : methods // ignore: cast_nullable_to_non_nullable
                      as List<AnalysisMethod>,
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
abstract class _$$MethodListResponseImplCopyWith<$Res>
    implements $MethodListResponseCopyWith<$Res> {
  factory _$$MethodListResponseImplCopyWith(
    _$MethodListResponseImpl value,
    $Res Function(_$MethodListResponseImpl) then,
  ) = __$$MethodListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<AnalysisMethod> methods,
    @JsonKey(name: 'total_count') int totalCount,
  });
}

/// @nodoc
class __$$MethodListResponseImplCopyWithImpl<$Res>
    extends _$MethodListResponseCopyWithImpl<$Res, _$MethodListResponseImpl>
    implements _$$MethodListResponseImplCopyWith<$Res> {
  __$$MethodListResponseImplCopyWithImpl(
    _$MethodListResponseImpl _value,
    $Res Function(_$MethodListResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MethodListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? methods = null, Object? totalCount = null}) {
    return _then(
      _$MethodListResponseImpl(
        methods: null == methods
            ? _value._methods
            : methods // ignore: cast_nullable_to_non_nullable
                  as List<AnalysisMethod>,
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
class _$MethodListResponseImpl implements _MethodListResponse {
  const _$MethodListResponseImpl({
    required final List<AnalysisMethod> methods,
    @JsonKey(name: 'total_count') required this.totalCount,
  }) : _methods = methods;

  factory _$MethodListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MethodListResponseImplFromJson(json);

  final List<AnalysisMethod> _methods;
  @override
  List<AnalysisMethod> get methods {
    if (_methods is EqualUnmodifiableListView) return _methods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_methods);
  }

  @override
  @JsonKey(name: 'total_count')
  final int totalCount;

  @override
  String toString() {
    return 'MethodListResponse(methods: $methods, totalCount: $totalCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MethodListResponseImpl &&
            const DeepCollectionEquality().equals(other._methods, _methods) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_methods),
    totalCount,
  );

  /// Create a copy of MethodListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MethodListResponseImplCopyWith<_$MethodListResponseImpl> get copyWith =>
      __$$MethodListResponseImplCopyWithImpl<_$MethodListResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MethodListResponseImplToJson(this);
  }
}

abstract class _MethodListResponse implements MethodListResponse {
  const factory _MethodListResponse({
    required final List<AnalysisMethod> methods,
    @JsonKey(name: 'total_count') required final int totalCount,
  }) = _$MethodListResponseImpl;

  factory _MethodListResponse.fromJson(Map<String, dynamic> json) =
      _$MethodListResponseImpl.fromJson;

  @override
  List<AnalysisMethod> get methods;
  @override
  @JsonKey(name: 'total_count')
  int get totalCount;

  /// Create a copy of MethodListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MethodListResponseImplCopyWith<_$MethodListResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CombineMethod _$CombineMethodFromJson(Map<String, dynamic> json) {
  return _CombineMethod.fromJson(json);
}

/// @nodoc
mixin _$CombineMethod {
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'sort_order')
  int get sortOrder => throw _privateConstructorUsedError;

  /// Serializes this CombineMethod to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CombineMethod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CombineMethodCopyWith<CombineMethod> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CombineMethodCopyWith<$Res> {
  factory $CombineMethodCopyWith(
    CombineMethod value,
    $Res Function(CombineMethod) then,
  ) = _$CombineMethodCopyWithImpl<$Res, CombineMethod>;
  @useResult
  $Res call({
    String code,
    String name,
    String description,
    @JsonKey(name: 'sort_order') int sortOrder,
  });
}

/// @nodoc
class _$CombineMethodCopyWithImpl<$Res, $Val extends CombineMethod>
    implements $CombineMethodCopyWith<$Res> {
  _$CombineMethodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CombineMethod
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? description = null,
    Object? sortOrder = null,
  }) {
    return _then(
      _value.copyWith(
            code: null == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            sortOrder: null == sortOrder
                ? _value.sortOrder
                : sortOrder // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CombineMethodImplCopyWith<$Res>
    implements $CombineMethodCopyWith<$Res> {
  factory _$$CombineMethodImplCopyWith(
    _$CombineMethodImpl value,
    $Res Function(_$CombineMethodImpl) then,
  ) = __$$CombineMethodImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String code,
    String name,
    String description,
    @JsonKey(name: 'sort_order') int sortOrder,
  });
}

/// @nodoc
class __$$CombineMethodImplCopyWithImpl<$Res>
    extends _$CombineMethodCopyWithImpl<$Res, _$CombineMethodImpl>
    implements _$$CombineMethodImplCopyWith<$Res> {
  __$$CombineMethodImplCopyWithImpl(
    _$CombineMethodImpl _value,
    $Res Function(_$CombineMethodImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CombineMethod
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? description = null,
    Object? sortOrder = null,
  }) {
    return _then(
      _$CombineMethodImpl(
        code: null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        sortOrder: null == sortOrder
            ? _value.sortOrder
            : sortOrder // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CombineMethodImpl implements _CombineMethod {
  const _$CombineMethodImpl({
    required this.code,
    required this.name,
    required this.description,
    @JsonKey(name: 'sort_order') required this.sortOrder,
  });

  factory _$CombineMethodImpl.fromJson(Map<String, dynamic> json) =>
      _$$CombineMethodImplFromJson(json);

  @override
  final String code;
  @override
  final String name;
  @override
  final String description;
  @override
  @JsonKey(name: 'sort_order')
  final int sortOrder;

  @override
  String toString() {
    return 'CombineMethod(code: $code, name: $name, description: $description, sortOrder: $sortOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CombineMethodImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, code, name, description, sortOrder);

  /// Create a copy of CombineMethod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CombineMethodImplCopyWith<_$CombineMethodImpl> get copyWith =>
      __$$CombineMethodImplCopyWithImpl<_$CombineMethodImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CombineMethodImplToJson(this);
  }
}

abstract class _CombineMethod implements CombineMethod {
  const factory _CombineMethod({
    required final String code,
    required final String name,
    required final String description,
    @JsonKey(name: 'sort_order') required final int sortOrder,
  }) = _$CombineMethodImpl;

  factory _CombineMethod.fromJson(Map<String, dynamic> json) =
      _$CombineMethodImpl.fromJson;

  @override
  String get code;
  @override
  String get name;
  @override
  String get description;
  @override
  @JsonKey(name: 'sort_order')
  int get sortOrder;

  /// Create a copy of CombineMethod
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CombineMethodImplCopyWith<_$CombineMethodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CombineMethodListResponse _$CombineMethodListResponseFromJson(
  Map<String, dynamic> json,
) {
  return _CombineMethodListResponse.fromJson(json);
}

/// @nodoc
mixin _$CombineMethodListResponse {
  List<CombineMethod> get methods => throw _privateConstructorUsedError;

  /// Serializes this CombineMethodListResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CombineMethodListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CombineMethodListResponseCopyWith<CombineMethodListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CombineMethodListResponseCopyWith<$Res> {
  factory $CombineMethodListResponseCopyWith(
    CombineMethodListResponse value,
    $Res Function(CombineMethodListResponse) then,
  ) = _$CombineMethodListResponseCopyWithImpl<$Res, CombineMethodListResponse>;
  @useResult
  $Res call({List<CombineMethod> methods});
}

/// @nodoc
class _$CombineMethodListResponseCopyWithImpl<
  $Res,
  $Val extends CombineMethodListResponse
>
    implements $CombineMethodListResponseCopyWith<$Res> {
  _$CombineMethodListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CombineMethodListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? methods = null}) {
    return _then(
      _value.copyWith(
            methods: null == methods
                ? _value.methods
                : methods // ignore: cast_nullable_to_non_nullable
                      as List<CombineMethod>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CombineMethodListResponseImplCopyWith<$Res>
    implements $CombineMethodListResponseCopyWith<$Res> {
  factory _$$CombineMethodListResponseImplCopyWith(
    _$CombineMethodListResponseImpl value,
    $Res Function(_$CombineMethodListResponseImpl) then,
  ) = __$$CombineMethodListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CombineMethod> methods});
}

/// @nodoc
class __$$CombineMethodListResponseImplCopyWithImpl<$Res>
    extends
        _$CombineMethodListResponseCopyWithImpl<
          $Res,
          _$CombineMethodListResponseImpl
        >
    implements _$$CombineMethodListResponseImplCopyWith<$Res> {
  __$$CombineMethodListResponseImplCopyWithImpl(
    _$CombineMethodListResponseImpl _value,
    $Res Function(_$CombineMethodListResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CombineMethodListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? methods = null}) {
    return _then(
      _$CombineMethodListResponseImpl(
        methods: null == methods
            ? _value._methods
            : methods // ignore: cast_nullable_to_non_nullable
                  as List<CombineMethod>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CombineMethodListResponseImpl implements _CombineMethodListResponse {
  const _$CombineMethodListResponseImpl({
    required final List<CombineMethod> methods,
  }) : _methods = methods;

  factory _$CombineMethodListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CombineMethodListResponseImplFromJson(json);

  final List<CombineMethod> _methods;
  @override
  List<CombineMethod> get methods {
    if (_methods is EqualUnmodifiableListView) return _methods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_methods);
  }

  @override
  String toString() {
    return 'CombineMethodListResponse(methods: $methods)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CombineMethodListResponseImpl &&
            const DeepCollectionEquality().equals(other._methods, _methods));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_methods));

  /// Create a copy of CombineMethodListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CombineMethodListResponseImplCopyWith<_$CombineMethodListResponseImpl>
  get copyWith =>
      __$$CombineMethodListResponseImplCopyWithImpl<
        _$CombineMethodListResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CombineMethodListResponseImplToJson(this);
  }
}

abstract class _CombineMethodListResponse implements CombineMethodListResponse {
  const factory _CombineMethodListResponse({
    required final List<CombineMethod> methods,
  }) = _$CombineMethodListResponseImpl;

  factory _CombineMethodListResponse.fromJson(Map<String, dynamic> json) =
      _$CombineMethodListResponseImpl.fromJson;

  @override
  List<CombineMethod> get methods;

  /// Create a copy of CombineMethodListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CombineMethodListResponseImplCopyWith<_$CombineMethodListResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

RecommendRequest _$RecommendRequestFromJson(Map<String, dynamic> json) {
  return _RecommendRequest.fromJson(json);
}

/// @nodoc
mixin _$RecommendRequest {
  @JsonKey(name: 'method_codes')
  List<String> get methodCodes => throw _privateConstructorUsedError;
  @JsonKey(name: 'combine_code')
  String get combineCode => throw _privateConstructorUsedError;
  Map<String, double>? get weights => throw _privateConstructorUsedError;
  @JsonKey(name: 'min_max_mode')
  String? get minMaxMode => throw _privateConstructorUsedError;
  @JsonKey(name: 'include_bonus')
  bool get includeBonus => throw _privateConstructorUsedError;
  @JsonKey(name: 'use_position_constraint')
  bool get usePositionConstraint => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  /// Serializes this RecommendRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecommendRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecommendRequestCopyWith<RecommendRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecommendRequestCopyWith<$Res> {
  factory $RecommendRequestCopyWith(
    RecommendRequest value,
    $Res Function(RecommendRequest) then,
  ) = _$RecommendRequestCopyWithImpl<$Res, RecommendRequest>;
  @useResult
  $Res call({
    @JsonKey(name: 'method_codes') List<String> methodCodes,
    @JsonKey(name: 'combine_code') String combineCode,
    Map<String, double>? weights,
    @JsonKey(name: 'min_max_mode') String? minMaxMode,
    @JsonKey(name: 'include_bonus') bool includeBonus,
    @JsonKey(name: 'use_position_constraint') bool usePositionConstraint,
    int count,
  });
}

/// @nodoc
class _$RecommendRequestCopyWithImpl<$Res, $Val extends RecommendRequest>
    implements $RecommendRequestCopyWith<$Res> {
  _$RecommendRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecommendRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? methodCodes = null,
    Object? combineCode = null,
    Object? weights = freezed,
    Object? minMaxMode = freezed,
    Object? includeBonus = null,
    Object? usePositionConstraint = null,
    Object? count = null,
  }) {
    return _then(
      _value.copyWith(
            methodCodes: null == methodCodes
                ? _value.methodCodes
                : methodCodes // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            combineCode: null == combineCode
                ? _value.combineCode
                : combineCode // ignore: cast_nullable_to_non_nullable
                      as String,
            weights: freezed == weights
                ? _value.weights
                : weights // ignore: cast_nullable_to_non_nullable
                      as Map<String, double>?,
            minMaxMode: freezed == minMaxMode
                ? _value.minMaxMode
                : minMaxMode // ignore: cast_nullable_to_non_nullable
                      as String?,
            includeBonus: null == includeBonus
                ? _value.includeBonus
                : includeBonus // ignore: cast_nullable_to_non_nullable
                      as bool,
            usePositionConstraint: null == usePositionConstraint
                ? _value.usePositionConstraint
                : usePositionConstraint // ignore: cast_nullable_to_non_nullable
                      as bool,
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
abstract class _$$RecommendRequestImplCopyWith<$Res>
    implements $RecommendRequestCopyWith<$Res> {
  factory _$$RecommendRequestImplCopyWith(
    _$RecommendRequestImpl value,
    $Res Function(_$RecommendRequestImpl) then,
  ) = __$$RecommendRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'method_codes') List<String> methodCodes,
    @JsonKey(name: 'combine_code') String combineCode,
    Map<String, double>? weights,
    @JsonKey(name: 'min_max_mode') String? minMaxMode,
    @JsonKey(name: 'include_bonus') bool includeBonus,
    @JsonKey(name: 'use_position_constraint') bool usePositionConstraint,
    int count,
  });
}

/// @nodoc
class __$$RecommendRequestImplCopyWithImpl<$Res>
    extends _$RecommendRequestCopyWithImpl<$Res, _$RecommendRequestImpl>
    implements _$$RecommendRequestImplCopyWith<$Res> {
  __$$RecommendRequestImplCopyWithImpl(
    _$RecommendRequestImpl _value,
    $Res Function(_$RecommendRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RecommendRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? methodCodes = null,
    Object? combineCode = null,
    Object? weights = freezed,
    Object? minMaxMode = freezed,
    Object? includeBonus = null,
    Object? usePositionConstraint = null,
    Object? count = null,
  }) {
    return _then(
      _$RecommendRequestImpl(
        methodCodes: null == methodCodes
            ? _value._methodCodes
            : methodCodes // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        combineCode: null == combineCode
            ? _value.combineCode
            : combineCode // ignore: cast_nullable_to_non_nullable
                  as String,
        weights: freezed == weights
            ? _value._weights
            : weights // ignore: cast_nullable_to_non_nullable
                  as Map<String, double>?,
        minMaxMode: freezed == minMaxMode
            ? _value.minMaxMode
            : minMaxMode // ignore: cast_nullable_to_non_nullable
                  as String?,
        includeBonus: null == includeBonus
            ? _value.includeBonus
            : includeBonus // ignore: cast_nullable_to_non_nullable
                  as bool,
        usePositionConstraint: null == usePositionConstraint
            ? _value.usePositionConstraint
            : usePositionConstraint // ignore: cast_nullable_to_non_nullable
                  as bool,
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
class _$RecommendRequestImpl implements _RecommendRequest {
  const _$RecommendRequestImpl({
    @JsonKey(name: 'method_codes') required final List<String> methodCodes,
    @JsonKey(name: 'combine_code') required this.combineCode,
    final Map<String, double>? weights,
    @JsonKey(name: 'min_max_mode') this.minMaxMode,
    @JsonKey(name: 'include_bonus') this.includeBonus = false,
    @JsonKey(name: 'use_position_constraint')
    this.usePositionConstraint = false,
    this.count = 5,
  }) : _methodCodes = methodCodes,
       _weights = weights;

  factory _$RecommendRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecommendRequestImplFromJson(json);

  final List<String> _methodCodes;
  @override
  @JsonKey(name: 'method_codes')
  List<String> get methodCodes {
    if (_methodCodes is EqualUnmodifiableListView) return _methodCodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_methodCodes);
  }

  @override
  @JsonKey(name: 'combine_code')
  final String combineCode;
  final Map<String, double>? _weights;
  @override
  Map<String, double>? get weights {
    final value = _weights;
    if (value == null) return null;
    if (_weights is EqualUnmodifiableMapView) return _weights;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey(name: 'min_max_mode')
  final String? minMaxMode;
  @override
  @JsonKey(name: 'include_bonus')
  final bool includeBonus;
  @override
  @JsonKey(name: 'use_position_constraint')
  final bool usePositionConstraint;
  @override
  @JsonKey()
  final int count;

  @override
  String toString() {
    return 'RecommendRequest(methodCodes: $methodCodes, combineCode: $combineCode, weights: $weights, minMaxMode: $minMaxMode, includeBonus: $includeBonus, usePositionConstraint: $usePositionConstraint, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecommendRequestImpl &&
            const DeepCollectionEquality().equals(
              other._methodCodes,
              _methodCodes,
            ) &&
            (identical(other.combineCode, combineCode) ||
                other.combineCode == combineCode) &&
            const DeepCollectionEquality().equals(other._weights, _weights) &&
            (identical(other.minMaxMode, minMaxMode) ||
                other.minMaxMode == minMaxMode) &&
            (identical(other.includeBonus, includeBonus) ||
                other.includeBonus == includeBonus) &&
            (identical(other.usePositionConstraint, usePositionConstraint) ||
                other.usePositionConstraint == usePositionConstraint) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_methodCodes),
    combineCode,
    const DeepCollectionEquality().hash(_weights),
    minMaxMode,
    includeBonus,
    usePositionConstraint,
    count,
  );

  /// Create a copy of RecommendRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecommendRequestImplCopyWith<_$RecommendRequestImpl> get copyWith =>
      __$$RecommendRequestImplCopyWithImpl<_$RecommendRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RecommendRequestImplToJson(this);
  }
}

abstract class _RecommendRequest implements RecommendRequest {
  const factory _RecommendRequest({
    @JsonKey(name: 'method_codes') required final List<String> methodCodes,
    @JsonKey(name: 'combine_code') required final String combineCode,
    final Map<String, double>? weights,
    @JsonKey(name: 'min_max_mode') final String? minMaxMode,
    @JsonKey(name: 'include_bonus') final bool includeBonus,
    @JsonKey(name: 'use_position_constraint') final bool usePositionConstraint,
    final int count,
  }) = _$RecommendRequestImpl;

  factory _RecommendRequest.fromJson(Map<String, dynamic> json) =
      _$RecommendRequestImpl.fromJson;

  @override
  @JsonKey(name: 'method_codes')
  List<String> get methodCodes;
  @override
  @JsonKey(name: 'combine_code')
  String get combineCode;
  @override
  Map<String, double>? get weights;
  @override
  @JsonKey(name: 'min_max_mode')
  String? get minMaxMode;
  @override
  @JsonKey(name: 'include_bonus')
  bool get includeBonus;
  @override
  @JsonKey(name: 'use_position_constraint')
  bool get usePositionConstraint;
  @override
  int get count;

  /// Create a copy of RecommendRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecommendRequestImplCopyWith<_$RecommendRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MethodDetail _$MethodDetailFromJson(Map<String, dynamic> json) {
  return _MethodDetail.fromJson(json);
}

/// @nodoc
mixin _$MethodDetail {
  List<int>? get numbers => throw _privateConstructorUsedError;
  double? get probability => throw _privateConstructorUsedError;
  String? get method => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;

  /// Serializes this MethodDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MethodDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MethodDetailCopyWith<MethodDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MethodDetailCopyWith<$Res> {
  factory $MethodDetailCopyWith(
    MethodDetail value,
    $Res Function(MethodDetail) then,
  ) = _$MethodDetailCopyWithImpl<$Res, MethodDetail>;
  @useResult
  $Res call({
    List<int>? numbers,
    double? probability,
    String? method,
    String? type,
  });
}

/// @nodoc
class _$MethodDetailCopyWithImpl<$Res, $Val extends MethodDetail>
    implements $MethodDetailCopyWith<$Res> {
  _$MethodDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MethodDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numbers = freezed,
    Object? probability = freezed,
    Object? method = freezed,
    Object? type = freezed,
  }) {
    return _then(
      _value.copyWith(
            numbers: freezed == numbers
                ? _value.numbers
                : numbers // ignore: cast_nullable_to_non_nullable
                      as List<int>?,
            probability: freezed == probability
                ? _value.probability
                : probability // ignore: cast_nullable_to_non_nullable
                      as double?,
            method: freezed == method
                ? _value.method
                : method // ignore: cast_nullable_to_non_nullable
                      as String?,
            type: freezed == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MethodDetailImplCopyWith<$Res>
    implements $MethodDetailCopyWith<$Res> {
  factory _$$MethodDetailImplCopyWith(
    _$MethodDetailImpl value,
    $Res Function(_$MethodDetailImpl) then,
  ) = __$$MethodDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<int>? numbers,
    double? probability,
    String? method,
    String? type,
  });
}

/// @nodoc
class __$$MethodDetailImplCopyWithImpl<$Res>
    extends _$MethodDetailCopyWithImpl<$Res, _$MethodDetailImpl>
    implements _$$MethodDetailImplCopyWith<$Res> {
  __$$MethodDetailImplCopyWithImpl(
    _$MethodDetailImpl _value,
    $Res Function(_$MethodDetailImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MethodDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numbers = freezed,
    Object? probability = freezed,
    Object? method = freezed,
    Object? type = freezed,
  }) {
    return _then(
      _$MethodDetailImpl(
        numbers: freezed == numbers
            ? _value._numbers
            : numbers // ignore: cast_nullable_to_non_nullable
                  as List<int>?,
        probability: freezed == probability
            ? _value.probability
            : probability // ignore: cast_nullable_to_non_nullable
                  as double?,
        method: freezed == method
            ? _value.method
            : method // ignore: cast_nullable_to_non_nullable
                  as String?,
        type: freezed == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MethodDetailImpl implements _MethodDetail {
  const _$MethodDetailImpl({
    final List<int>? numbers,
    this.probability,
    this.method,
    this.type,
  }) : _numbers = numbers;

  factory _$MethodDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$MethodDetailImplFromJson(json);

  final List<int>? _numbers;
  @override
  List<int>? get numbers {
    final value = _numbers;
    if (value == null) return null;
    if (_numbers is EqualUnmodifiableListView) return _numbers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final double? probability;
  @override
  final String? method;
  @override
  final String? type;

  @override
  String toString() {
    return 'MethodDetail(numbers: $numbers, probability: $probability, method: $method, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MethodDetailImpl &&
            const DeepCollectionEquality().equals(other._numbers, _numbers) &&
            (identical(other.probability, probability) ||
                other.probability == probability) &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_numbers),
    probability,
    method,
    type,
  );

  /// Create a copy of MethodDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MethodDetailImplCopyWith<_$MethodDetailImpl> get copyWith =>
      __$$MethodDetailImplCopyWithImpl<_$MethodDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MethodDetailImplToJson(this);
  }
}

abstract class _MethodDetail implements MethodDetail {
  const factory _MethodDetail({
    final List<int>? numbers,
    final double? probability,
    final String? method,
    final String? type,
  }) = _$MethodDetailImpl;

  factory _MethodDetail.fromJson(Map<String, dynamic> json) =
      _$MethodDetailImpl.fromJson;

  @override
  List<int>? get numbers;
  @override
  double? get probability;
  @override
  String? get method;
  @override
  String? get type;

  /// Create a copy of MethodDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MethodDetailImplCopyWith<_$MethodDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Recommendation _$RecommendationFromJson(Map<String, dynamic> json) {
  return _Recommendation.fromJson(json);
}

/// @nodoc
mixin _$Recommendation {
  List<int> get numbers => throw _privateConstructorUsedError;
  int? get bonus => throw _privateConstructorUsedError;
  @JsonKey(name: 'methods_used')
  List<String> get methodsUsed => throw _privateConstructorUsedError;
  @JsonKey(name: 'combine_method')
  String get combineMethod => throw _privateConstructorUsedError;
  double get confidence => throw _privateConstructorUsedError;
  Map<String, MethodDetail> get details => throw _privateConstructorUsedError;

  /// Serializes this Recommendation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Recommendation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecommendationCopyWith<Recommendation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecommendationCopyWith<$Res> {
  factory $RecommendationCopyWith(
    Recommendation value,
    $Res Function(Recommendation) then,
  ) = _$RecommendationCopyWithImpl<$Res, Recommendation>;
  @useResult
  $Res call({
    List<int> numbers,
    int? bonus,
    @JsonKey(name: 'methods_used') List<String> methodsUsed,
    @JsonKey(name: 'combine_method') String combineMethod,
    double confidence,
    Map<String, MethodDetail> details,
  });
}

/// @nodoc
class _$RecommendationCopyWithImpl<$Res, $Val extends Recommendation>
    implements $RecommendationCopyWith<$Res> {
  _$RecommendationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Recommendation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numbers = null,
    Object? bonus = freezed,
    Object? methodsUsed = null,
    Object? combineMethod = null,
    Object? confidence = null,
    Object? details = null,
  }) {
    return _then(
      _value.copyWith(
            numbers: null == numbers
                ? _value.numbers
                : numbers // ignore: cast_nullable_to_non_nullable
                      as List<int>,
            bonus: freezed == bonus
                ? _value.bonus
                : bonus // ignore: cast_nullable_to_non_nullable
                      as int?,
            methodsUsed: null == methodsUsed
                ? _value.methodsUsed
                : methodsUsed // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            combineMethod: null == combineMethod
                ? _value.combineMethod
                : combineMethod // ignore: cast_nullable_to_non_nullable
                      as String,
            confidence: null == confidence
                ? _value.confidence
                : confidence // ignore: cast_nullable_to_non_nullable
                      as double,
            details: null == details
                ? _value.details
                : details // ignore: cast_nullable_to_non_nullable
                      as Map<String, MethodDetail>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RecommendationImplCopyWith<$Res>
    implements $RecommendationCopyWith<$Res> {
  factory _$$RecommendationImplCopyWith(
    _$RecommendationImpl value,
    $Res Function(_$RecommendationImpl) then,
  ) = __$$RecommendationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<int> numbers,
    int? bonus,
    @JsonKey(name: 'methods_used') List<String> methodsUsed,
    @JsonKey(name: 'combine_method') String combineMethod,
    double confidence,
    Map<String, MethodDetail> details,
  });
}

/// @nodoc
class __$$RecommendationImplCopyWithImpl<$Res>
    extends _$RecommendationCopyWithImpl<$Res, _$RecommendationImpl>
    implements _$$RecommendationImplCopyWith<$Res> {
  __$$RecommendationImplCopyWithImpl(
    _$RecommendationImpl _value,
    $Res Function(_$RecommendationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Recommendation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numbers = null,
    Object? bonus = freezed,
    Object? methodsUsed = null,
    Object? combineMethod = null,
    Object? confidence = null,
    Object? details = null,
  }) {
    return _then(
      _$RecommendationImpl(
        numbers: null == numbers
            ? _value._numbers
            : numbers // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        bonus: freezed == bonus
            ? _value.bonus
            : bonus // ignore: cast_nullable_to_non_nullable
                  as int?,
        methodsUsed: null == methodsUsed
            ? _value._methodsUsed
            : methodsUsed // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        combineMethod: null == combineMethod
            ? _value.combineMethod
            : combineMethod // ignore: cast_nullable_to_non_nullable
                  as String,
        confidence: null == confidence
            ? _value.confidence
            : confidence // ignore: cast_nullable_to_non_nullable
                  as double,
        details: null == details
            ? _value._details
            : details // ignore: cast_nullable_to_non_nullable
                  as Map<String, MethodDetail>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RecommendationImpl implements _Recommendation {
  const _$RecommendationImpl({
    required final List<int> numbers,
    this.bonus,
    @JsonKey(name: 'methods_used') required final List<String> methodsUsed,
    @JsonKey(name: 'combine_method') required this.combineMethod,
    required this.confidence,
    final Map<String, MethodDetail> details = const {},
  }) : _numbers = numbers,
       _methodsUsed = methodsUsed,
       _details = details;

  factory _$RecommendationImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecommendationImplFromJson(json);

  final List<int> _numbers;
  @override
  List<int> get numbers {
    if (_numbers is EqualUnmodifiableListView) return _numbers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_numbers);
  }

  @override
  final int? bonus;
  final List<String> _methodsUsed;
  @override
  @JsonKey(name: 'methods_used')
  List<String> get methodsUsed {
    if (_methodsUsed is EqualUnmodifiableListView) return _methodsUsed;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_methodsUsed);
  }

  @override
  @JsonKey(name: 'combine_method')
  final String combineMethod;
  @override
  final double confidence;
  final Map<String, MethodDetail> _details;
  @override
  @JsonKey()
  Map<String, MethodDetail> get details {
    if (_details is EqualUnmodifiableMapView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_details);
  }

  @override
  String toString() {
    return 'Recommendation(numbers: $numbers, bonus: $bonus, methodsUsed: $methodsUsed, combineMethod: $combineMethod, confidence: $confidence, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecommendationImpl &&
            const DeepCollectionEquality().equals(other._numbers, _numbers) &&
            (identical(other.bonus, bonus) || other.bonus == bonus) &&
            const DeepCollectionEquality().equals(
              other._methodsUsed,
              _methodsUsed,
            ) &&
            (identical(other.combineMethod, combineMethod) ||
                other.combineMethod == combineMethod) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            const DeepCollectionEquality().equals(other._details, _details));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_numbers),
    bonus,
    const DeepCollectionEquality().hash(_methodsUsed),
    combineMethod,
    confidence,
    const DeepCollectionEquality().hash(_details),
  );

  /// Create a copy of Recommendation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecommendationImplCopyWith<_$RecommendationImpl> get copyWith =>
      __$$RecommendationImplCopyWithImpl<_$RecommendationImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RecommendationImplToJson(this);
  }
}

abstract class _Recommendation implements Recommendation {
  const factory _Recommendation({
    required final List<int> numbers,
    final int? bonus,
    @JsonKey(name: 'methods_used') required final List<String> methodsUsed,
    @JsonKey(name: 'combine_method') required final String combineMethod,
    required final double confidence,
    final Map<String, MethodDetail> details,
  }) = _$RecommendationImpl;

  factory _Recommendation.fromJson(Map<String, dynamic> json) =
      _$RecommendationImpl.fromJson;

  @override
  List<int> get numbers;
  @override
  int? get bonus;
  @override
  @JsonKey(name: 'methods_used')
  List<String> get methodsUsed;
  @override
  @JsonKey(name: 'combine_method')
  String get combineMethod;
  @override
  double get confidence;
  @override
  Map<String, MethodDetail> get details;

  /// Create a copy of Recommendation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecommendationImplCopyWith<_$RecommendationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RecommendResponse _$RecommendResponseFromJson(Map<String, dynamic> json) {
  return _RecommendResponse.fromJson(json);
}

/// @nodoc
mixin _$RecommendResponse {
  List<Recommendation> get recommendations =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'generated_at')
  String? get generatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'latest_draw_no')
  int? get latestDrawNo => throw _privateConstructorUsedError;

  /// Serializes this RecommendResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecommendResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecommendResponseCopyWith<RecommendResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecommendResponseCopyWith<$Res> {
  factory $RecommendResponseCopyWith(
    RecommendResponse value,
    $Res Function(RecommendResponse) then,
  ) = _$RecommendResponseCopyWithImpl<$Res, RecommendResponse>;
  @useResult
  $Res call({
    List<Recommendation> recommendations,
    @JsonKey(name: 'generated_at') String? generatedAt,
    @JsonKey(name: 'latest_draw_no') int? latestDrawNo,
  });
}

/// @nodoc
class _$RecommendResponseCopyWithImpl<$Res, $Val extends RecommendResponse>
    implements $RecommendResponseCopyWith<$Res> {
  _$RecommendResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecommendResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recommendations = null,
    Object? generatedAt = freezed,
    Object? latestDrawNo = freezed,
  }) {
    return _then(
      _value.copyWith(
            recommendations: null == recommendations
                ? _value.recommendations
                : recommendations // ignore: cast_nullable_to_non_nullable
                      as List<Recommendation>,
            generatedAt: freezed == generatedAt
                ? _value.generatedAt
                : generatedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            latestDrawNo: freezed == latestDrawNo
                ? _value.latestDrawNo
                : latestDrawNo // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RecommendResponseImplCopyWith<$Res>
    implements $RecommendResponseCopyWith<$Res> {
  factory _$$RecommendResponseImplCopyWith(
    _$RecommendResponseImpl value,
    $Res Function(_$RecommendResponseImpl) then,
  ) = __$$RecommendResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<Recommendation> recommendations,
    @JsonKey(name: 'generated_at') String? generatedAt,
    @JsonKey(name: 'latest_draw_no') int? latestDrawNo,
  });
}

/// @nodoc
class __$$RecommendResponseImplCopyWithImpl<$Res>
    extends _$RecommendResponseCopyWithImpl<$Res, _$RecommendResponseImpl>
    implements _$$RecommendResponseImplCopyWith<$Res> {
  __$$RecommendResponseImplCopyWithImpl(
    _$RecommendResponseImpl _value,
    $Res Function(_$RecommendResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RecommendResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recommendations = null,
    Object? generatedAt = freezed,
    Object? latestDrawNo = freezed,
  }) {
    return _then(
      _$RecommendResponseImpl(
        recommendations: null == recommendations
            ? _value._recommendations
            : recommendations // ignore: cast_nullable_to_non_nullable
                  as List<Recommendation>,
        generatedAt: freezed == generatedAt
            ? _value.generatedAt
            : generatedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        latestDrawNo: freezed == latestDrawNo
            ? _value.latestDrawNo
            : latestDrawNo // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RecommendResponseImpl implements _RecommendResponse {
  const _$RecommendResponseImpl({
    required final List<Recommendation> recommendations,
    @JsonKey(name: 'generated_at') this.generatedAt,
    @JsonKey(name: 'latest_draw_no') this.latestDrawNo,
  }) : _recommendations = recommendations;

  factory _$RecommendResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecommendResponseImplFromJson(json);

  final List<Recommendation> _recommendations;
  @override
  List<Recommendation> get recommendations {
    if (_recommendations is EqualUnmodifiableListView) return _recommendations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recommendations);
  }

  @override
  @JsonKey(name: 'generated_at')
  final String? generatedAt;
  @override
  @JsonKey(name: 'latest_draw_no')
  final int? latestDrawNo;

  @override
  String toString() {
    return 'RecommendResponse(recommendations: $recommendations, generatedAt: $generatedAt, latestDrawNo: $latestDrawNo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecommendResponseImpl &&
            const DeepCollectionEquality().equals(
              other._recommendations,
              _recommendations,
            ) &&
            (identical(other.generatedAt, generatedAt) ||
                other.generatedAt == generatedAt) &&
            (identical(other.latestDrawNo, latestDrawNo) ||
                other.latestDrawNo == latestDrawNo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_recommendations),
    generatedAt,
    latestDrawNo,
  );

  /// Create a copy of RecommendResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecommendResponseImplCopyWith<_$RecommendResponseImpl> get copyWith =>
      __$$RecommendResponseImplCopyWithImpl<_$RecommendResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RecommendResponseImplToJson(this);
  }
}

abstract class _RecommendResponse implements RecommendResponse {
  const factory _RecommendResponse({
    required final List<Recommendation> recommendations,
    @JsonKey(name: 'generated_at') final String? generatedAt,
    @JsonKey(name: 'latest_draw_no') final int? latestDrawNo,
  }) = _$RecommendResponseImpl;

  factory _RecommendResponse.fromJson(Map<String, dynamic> json) =
      _$RecommendResponseImpl.fromJson;

  @override
  List<Recommendation> get recommendations;
  @override
  @JsonKey(name: 'generated_at')
  String? get generatedAt;
  @override
  @JsonKey(name: 'latest_draw_no')
  int? get latestDrawNo;

  /// Create a copy of RecommendResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecommendResponseImplCopyWith<_$RecommendResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RecommendationHistory _$RecommendationHistoryFromJson(
  Map<String, dynamic> json,
) {
  return _RecommendationHistory.fromJson(json);
}

/// @nodoc
mixin _$RecommendationHistory {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'method_codes')
  List<String> get methodCodes => throw _privateConstructorUsedError;
  @JsonKey(name: 'combine_method')
  String get combineMethod => throw _privateConstructorUsedError;
  List<int> get numbers => throw _privateConstructorUsedError;
  @JsonKey(name: 'bonus_number')
  int? get bonusNumber => throw _privateConstructorUsedError;
  double get confidence => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;

  /// Serializes this RecommendationHistory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecommendationHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecommendationHistoryCopyWith<RecommendationHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecommendationHistoryCopyWith<$Res> {
  factory $RecommendationHistoryCopyWith(
    RecommendationHistory value,
    $Res Function(RecommendationHistory) then,
  ) = _$RecommendationHistoryCopyWithImpl<$Res, RecommendationHistory>;
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'user_id') int userId,
    @JsonKey(name: 'method_codes') List<String> methodCodes,
    @JsonKey(name: 'combine_method') String combineMethod,
    List<int> numbers,
    @JsonKey(name: 'bonus_number') int? bonusNumber,
    double confidence,
    @JsonKey(name: 'created_at') String createdAt,
  });
}

/// @nodoc
class _$RecommendationHistoryCopyWithImpl<
  $Res,
  $Val extends RecommendationHistory
>
    implements $RecommendationHistoryCopyWith<$Res> {
  _$RecommendationHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecommendationHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? methodCodes = null,
    Object? combineMethod = null,
    Object? numbers = null,
    Object? bonusNumber = freezed,
    Object? confidence = null,
    Object? createdAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as int,
            methodCodes: null == methodCodes
                ? _value.methodCodes
                : methodCodes // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            combineMethod: null == combineMethod
                ? _value.combineMethod
                : combineMethod // ignore: cast_nullable_to_non_nullable
                      as String,
            numbers: null == numbers
                ? _value.numbers
                : numbers // ignore: cast_nullable_to_non_nullable
                      as List<int>,
            bonusNumber: freezed == bonusNumber
                ? _value.bonusNumber
                : bonusNumber // ignore: cast_nullable_to_non_nullable
                      as int?,
            confidence: null == confidence
                ? _value.confidence
                : confidence // ignore: cast_nullable_to_non_nullable
                      as double,
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
abstract class _$$RecommendationHistoryImplCopyWith<$Res>
    implements $RecommendationHistoryCopyWith<$Res> {
  factory _$$RecommendationHistoryImplCopyWith(
    _$RecommendationHistoryImpl value,
    $Res Function(_$RecommendationHistoryImpl) then,
  ) = __$$RecommendationHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'user_id') int userId,
    @JsonKey(name: 'method_codes') List<String> methodCodes,
    @JsonKey(name: 'combine_method') String combineMethod,
    List<int> numbers,
    @JsonKey(name: 'bonus_number') int? bonusNumber,
    double confidence,
    @JsonKey(name: 'created_at') String createdAt,
  });
}

/// @nodoc
class __$$RecommendationHistoryImplCopyWithImpl<$Res>
    extends
        _$RecommendationHistoryCopyWithImpl<$Res, _$RecommendationHistoryImpl>
    implements _$$RecommendationHistoryImplCopyWith<$Res> {
  __$$RecommendationHistoryImplCopyWithImpl(
    _$RecommendationHistoryImpl _value,
    $Res Function(_$RecommendationHistoryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RecommendationHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? methodCodes = null,
    Object? combineMethod = null,
    Object? numbers = null,
    Object? bonusNumber = freezed,
    Object? confidence = null,
    Object? createdAt = null,
  }) {
    return _then(
      _$RecommendationHistoryImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as int,
        methodCodes: null == methodCodes
            ? _value._methodCodes
            : methodCodes // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        combineMethod: null == combineMethod
            ? _value.combineMethod
            : combineMethod // ignore: cast_nullable_to_non_nullable
                  as String,
        numbers: null == numbers
            ? _value._numbers
            : numbers // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        bonusNumber: freezed == bonusNumber
            ? _value.bonusNumber
            : bonusNumber // ignore: cast_nullable_to_non_nullable
                  as int?,
        confidence: null == confidence
            ? _value.confidence
            : confidence // ignore: cast_nullable_to_non_nullable
                  as double,
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
class _$RecommendationHistoryImpl implements _RecommendationHistory {
  const _$RecommendationHistoryImpl({
    required this.id,
    @JsonKey(name: 'user_id') required this.userId,
    @JsonKey(name: 'method_codes') required final List<String> methodCodes,
    @JsonKey(name: 'combine_method') required this.combineMethod,
    required final List<int> numbers,
    @JsonKey(name: 'bonus_number') this.bonusNumber,
    required this.confidence,
    @JsonKey(name: 'created_at') required this.createdAt,
  }) : _methodCodes = methodCodes,
       _numbers = numbers;

  factory _$RecommendationHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecommendationHistoryImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'user_id')
  final int userId;
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
  final List<int> _numbers;
  @override
  List<int> get numbers {
    if (_numbers is EqualUnmodifiableListView) return _numbers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_numbers);
  }

  @override
  @JsonKey(name: 'bonus_number')
  final int? bonusNumber;
  @override
  final double confidence;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;

  @override
  String toString() {
    return 'RecommendationHistory(id: $id, userId: $userId, methodCodes: $methodCodes, combineMethod: $combineMethod, numbers: $numbers, bonusNumber: $bonusNumber, confidence: $confidence, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecommendationHistoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality().equals(
              other._methodCodes,
              _methodCodes,
            ) &&
            (identical(other.combineMethod, combineMethod) ||
                other.combineMethod == combineMethod) &&
            const DeepCollectionEquality().equals(other._numbers, _numbers) &&
            (identical(other.bonusNumber, bonusNumber) ||
                other.bonusNumber == bonusNumber) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    const DeepCollectionEquality().hash(_methodCodes),
    combineMethod,
    const DeepCollectionEquality().hash(_numbers),
    bonusNumber,
    confidence,
    createdAt,
  );

  /// Create a copy of RecommendationHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecommendationHistoryImplCopyWith<_$RecommendationHistoryImpl>
  get copyWith =>
      __$$RecommendationHistoryImplCopyWithImpl<_$RecommendationHistoryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RecommendationHistoryImplToJson(this);
  }
}

abstract class _RecommendationHistory implements RecommendationHistory {
  const factory _RecommendationHistory({
    required final int id,
    @JsonKey(name: 'user_id') required final int userId,
    @JsonKey(name: 'method_codes') required final List<String> methodCodes,
    @JsonKey(name: 'combine_method') required final String combineMethod,
    required final List<int> numbers,
    @JsonKey(name: 'bonus_number') final int? bonusNumber,
    required final double confidence,
    @JsonKey(name: 'created_at') required final String createdAt,
  }) = _$RecommendationHistoryImpl;

  factory _RecommendationHistory.fromJson(Map<String, dynamic> json) =
      _$RecommendationHistoryImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  @JsonKey(name: 'method_codes')
  List<String> get methodCodes;
  @override
  @JsonKey(name: 'combine_method')
  String get combineMethod;
  @override
  List<int> get numbers;
  @override
  @JsonKey(name: 'bonus_number')
  int? get bonusNumber;
  @override
  double get confidence;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;

  /// Create a copy of RecommendationHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecommendationHistoryImplCopyWith<_$RecommendationHistoryImpl>
  get copyWith => throw _privateConstructorUsedError;
}

RecommendationHistoryResponse _$RecommendationHistoryResponseFromJson(
  Map<String, dynamic> json,
) {
  return _RecommendationHistoryResponse.fromJson(json);
}

/// @nodoc
mixin _$RecommendationHistoryResponse {
  List<RecommendationHistory> get recommendations =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'count')
  int get totalCount => throw _privateConstructorUsedError;

  /// Serializes this RecommendationHistoryResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecommendationHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecommendationHistoryResponseCopyWith<RecommendationHistoryResponse>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecommendationHistoryResponseCopyWith<$Res> {
  factory $RecommendationHistoryResponseCopyWith(
    RecommendationHistoryResponse value,
    $Res Function(RecommendationHistoryResponse) then,
  ) =
      _$RecommendationHistoryResponseCopyWithImpl<
        $Res,
        RecommendationHistoryResponse
      >;
  @useResult
  $Res call({
    List<RecommendationHistory> recommendations,
    @JsonKey(name: 'count') int totalCount,
  });
}

/// @nodoc
class _$RecommendationHistoryResponseCopyWithImpl<
  $Res,
  $Val extends RecommendationHistoryResponse
>
    implements $RecommendationHistoryResponseCopyWith<$Res> {
  _$RecommendationHistoryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecommendationHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? recommendations = null, Object? totalCount = null}) {
    return _then(
      _value.copyWith(
            recommendations: null == recommendations
                ? _value.recommendations
                : recommendations // ignore: cast_nullable_to_non_nullable
                      as List<RecommendationHistory>,
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
abstract class _$$RecommendationHistoryResponseImplCopyWith<$Res>
    implements $RecommendationHistoryResponseCopyWith<$Res> {
  factory _$$RecommendationHistoryResponseImplCopyWith(
    _$RecommendationHistoryResponseImpl value,
    $Res Function(_$RecommendationHistoryResponseImpl) then,
  ) = __$$RecommendationHistoryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<RecommendationHistory> recommendations,
    @JsonKey(name: 'count') int totalCount,
  });
}

/// @nodoc
class __$$RecommendationHistoryResponseImplCopyWithImpl<$Res>
    extends
        _$RecommendationHistoryResponseCopyWithImpl<
          $Res,
          _$RecommendationHistoryResponseImpl
        >
    implements _$$RecommendationHistoryResponseImplCopyWith<$Res> {
  __$$RecommendationHistoryResponseImplCopyWithImpl(
    _$RecommendationHistoryResponseImpl _value,
    $Res Function(_$RecommendationHistoryResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RecommendationHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? recommendations = null, Object? totalCount = null}) {
    return _then(
      _$RecommendationHistoryResponseImpl(
        recommendations: null == recommendations
            ? _value._recommendations
            : recommendations // ignore: cast_nullable_to_non_nullable
                  as List<RecommendationHistory>,
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
class _$RecommendationHistoryResponseImpl
    implements _RecommendationHistoryResponse {
  const _$RecommendationHistoryResponseImpl({
    final List<RecommendationHistory> recommendations = const [],
    @JsonKey(name: 'count') this.totalCount = 0,
  }) : _recommendations = recommendations;

  factory _$RecommendationHistoryResponseImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$RecommendationHistoryResponseImplFromJson(json);

  final List<RecommendationHistory> _recommendations;
  @override
  @JsonKey()
  List<RecommendationHistory> get recommendations {
    if (_recommendations is EqualUnmodifiableListView) return _recommendations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recommendations);
  }

  @override
  @JsonKey(name: 'count')
  final int totalCount;

  @override
  String toString() {
    return 'RecommendationHistoryResponse(recommendations: $recommendations, totalCount: $totalCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecommendationHistoryResponseImpl &&
            const DeepCollectionEquality().equals(
              other._recommendations,
              _recommendations,
            ) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_recommendations),
    totalCount,
  );

  /// Create a copy of RecommendationHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecommendationHistoryResponseImplCopyWith<
    _$RecommendationHistoryResponseImpl
  >
  get copyWith =>
      __$$RecommendationHistoryResponseImplCopyWithImpl<
        _$RecommendationHistoryResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecommendationHistoryResponseImplToJson(this);
  }
}

abstract class _RecommendationHistoryResponse
    implements RecommendationHistoryResponse {
  const factory _RecommendationHistoryResponse({
    final List<RecommendationHistory> recommendations,
    @JsonKey(name: 'count') final int totalCount,
  }) = _$RecommendationHistoryResponseImpl;

  factory _RecommendationHistoryResponse.fromJson(Map<String, dynamic> json) =
      _$RecommendationHistoryResponseImpl.fromJson;

  @override
  List<RecommendationHistory> get recommendations;
  @override
  @JsonKey(name: 'count')
  int get totalCount;

  /// Create a copy of RecommendationHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecommendationHistoryResponseImplCopyWith<
    _$RecommendationHistoryResponseImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}
