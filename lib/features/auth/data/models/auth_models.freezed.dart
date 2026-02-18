// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) {
  return _AuthResponse.fromJson(json);
}

/// @nodoc
mixin _$AuthResponse {
  @JsonKey(name: 'access_token')
  String get accessToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'refresh_token')
  String get refreshToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'expires_in')
  int get expiresIn => throw _privateConstructorUsedError;
  @JsonKey(name: 'token_type')
  String get tokenType => throw _privateConstructorUsedError;

  /// Serializes this AuthResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthResponseCopyWith<AuthResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthResponseCopyWith<$Res> {
  factory $AuthResponseCopyWith(
    AuthResponse value,
    $Res Function(AuthResponse) then,
  ) = _$AuthResponseCopyWithImpl<$Res, AuthResponse>;
  @useResult
  $Res call({
    @JsonKey(name: 'access_token') String accessToken,
    @JsonKey(name: 'refresh_token') String refreshToken,
    @JsonKey(name: 'expires_in') int expiresIn,
    @JsonKey(name: 'token_type') String tokenType,
  });
}

/// @nodoc
class _$AuthResponseCopyWithImpl<$Res, $Val extends AuthResponse>
    implements $AuthResponseCopyWith<$Res> {
  _$AuthResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? expiresIn = null,
    Object? tokenType = null,
  }) {
    return _then(
      _value.copyWith(
            accessToken: null == accessToken
                ? _value.accessToken
                : accessToken // ignore: cast_nullable_to_non_nullable
                      as String,
            refreshToken: null == refreshToken
                ? _value.refreshToken
                : refreshToken // ignore: cast_nullable_to_non_nullable
                      as String,
            expiresIn: null == expiresIn
                ? _value.expiresIn
                : expiresIn // ignore: cast_nullable_to_non_nullable
                      as int,
            tokenType: null == tokenType
                ? _value.tokenType
                : tokenType // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AuthResponseImplCopyWith<$Res>
    implements $AuthResponseCopyWith<$Res> {
  factory _$$AuthResponseImplCopyWith(
    _$AuthResponseImpl value,
    $Res Function(_$AuthResponseImpl) then,
  ) = __$$AuthResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'access_token') String accessToken,
    @JsonKey(name: 'refresh_token') String refreshToken,
    @JsonKey(name: 'expires_in') int expiresIn,
    @JsonKey(name: 'token_type') String tokenType,
  });
}

/// @nodoc
class __$$AuthResponseImplCopyWithImpl<$Res>
    extends _$AuthResponseCopyWithImpl<$Res, _$AuthResponseImpl>
    implements _$$AuthResponseImplCopyWith<$Res> {
  __$$AuthResponseImplCopyWithImpl(
    _$AuthResponseImpl _value,
    $Res Function(_$AuthResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? expiresIn = null,
    Object? tokenType = null,
  }) {
    return _then(
      _$AuthResponseImpl(
        accessToken: null == accessToken
            ? _value.accessToken
            : accessToken // ignore: cast_nullable_to_non_nullable
                  as String,
        refreshToken: null == refreshToken
            ? _value.refreshToken
            : refreshToken // ignore: cast_nullable_to_non_nullable
                  as String,
        expiresIn: null == expiresIn
            ? _value.expiresIn
            : expiresIn // ignore: cast_nullable_to_non_nullable
                  as int,
        tokenType: null == tokenType
            ? _value.tokenType
            : tokenType // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthResponseImpl implements _AuthResponse {
  const _$AuthResponseImpl({
    @JsonKey(name: 'access_token') required this.accessToken,
    @JsonKey(name: 'refresh_token') required this.refreshToken,
    @JsonKey(name: 'expires_in') required this.expiresIn,
    @JsonKey(name: 'token_type') required this.tokenType,
  });

  factory _$AuthResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthResponseImplFromJson(json);

  @override
  @JsonKey(name: 'access_token')
  final String accessToken;
  @override
  @JsonKey(name: 'refresh_token')
  final String refreshToken;
  @override
  @JsonKey(name: 'expires_in')
  final int expiresIn;
  @override
  @JsonKey(name: 'token_type')
  final String tokenType;

  @override
  String toString() {
    return 'AuthResponse(accessToken: $accessToken, refreshToken: $refreshToken, expiresIn: $expiresIn, tokenType: $tokenType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthResponseImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.expiresIn, expiresIn) ||
                other.expiresIn == expiresIn) &&
            (identical(other.tokenType, tokenType) ||
                other.tokenType == tokenType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, accessToken, refreshToken, expiresIn, tokenType);

  /// Create a copy of AuthResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthResponseImplCopyWith<_$AuthResponseImpl> get copyWith =>
      __$$AuthResponseImplCopyWithImpl<_$AuthResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthResponseImplToJson(this);
  }
}

abstract class _AuthResponse implements AuthResponse {
  const factory _AuthResponse({
    @JsonKey(name: 'access_token') required final String accessToken,
    @JsonKey(name: 'refresh_token') required final String refreshToken,
    @JsonKey(name: 'expires_in') required final int expiresIn,
    @JsonKey(name: 'token_type') required final String tokenType,
  }) = _$AuthResponseImpl;

  factory _AuthResponse.fromJson(Map<String, dynamic> json) =
      _$AuthResponseImpl.fromJson;

  @override
  @JsonKey(name: 'access_token')
  String get accessToken;
  @override
  @JsonKey(name: 'refresh_token')
  String get refreshToken;
  @override
  @JsonKey(name: 'expires_in')
  int get expiresIn;
  @override
  @JsonKey(name: 'token_type')
  String get tokenType;

  /// Create a copy of AuthResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthResponseImplCopyWith<_$AuthResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  int get id => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'device_id')
  String? get deviceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'lotto_tier')
  int? get lottoTier => throw _privateConstructorUsedError;
  UserTier? get tier => throw _privateConstructorUsedError;
  @JsonKey(name: 'zam_balance')
  int get zamBalance => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'birth_date')
  String? get birthDate => throw _privateConstructorUsedError;
  String? get region => throw _privateConstructorUsedError;
  String? get nickname => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_frequency')
  String? get purchaseFrequency => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call({
    int id,
    String? email,
    @JsonKey(name: 'device_id') String? deviceId,
    @JsonKey(name: 'lotto_tier') int? lottoTier,
    UserTier? tier,
    @JsonKey(name: 'zam_balance') int zamBalance,
    String? gender,
    @JsonKey(name: 'birth_date') String? birthDate,
    String? region,
    String? nickname,
    @JsonKey(name: 'purchase_frequency') String? purchaseFrequency,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  });

  $UserTierCopyWith<$Res>? get tier;
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = freezed,
    Object? deviceId = freezed,
    Object? lottoTier = freezed,
    Object? tier = freezed,
    Object? zamBalance = null,
    Object? gender = freezed,
    Object? birthDate = freezed,
    Object? region = freezed,
    Object? nickname = freezed,
    Object? purchaseFrequency = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            deviceId: freezed == deviceId
                ? _value.deviceId
                : deviceId // ignore: cast_nullable_to_non_nullable
                      as String?,
            lottoTier: freezed == lottoTier
                ? _value.lottoTier
                : lottoTier // ignore: cast_nullable_to_non_nullable
                      as int?,
            tier: freezed == tier
                ? _value.tier
                : tier // ignore: cast_nullable_to_non_nullable
                      as UserTier?,
            zamBalance: null == zamBalance
                ? _value.zamBalance
                : zamBalance // ignore: cast_nullable_to_non_nullable
                      as int,
            gender: freezed == gender
                ? _value.gender
                : gender // ignore: cast_nullable_to_non_nullable
                      as String?,
            birthDate: freezed == birthDate
                ? _value.birthDate
                : birthDate // ignore: cast_nullable_to_non_nullable
                      as String?,
            region: freezed == region
                ? _value.region
                : region // ignore: cast_nullable_to_non_nullable
                      as String?,
            nickname: freezed == nickname
                ? _value.nickname
                : nickname // ignore: cast_nullable_to_non_nullable
                      as String?,
            purchaseFrequency: freezed == purchaseFrequency
                ? _value.purchaseFrequency
                : purchaseFrequency // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserTierCopyWith<$Res>? get tier {
    if (_value.tier == null) {
      return null;
    }

    return $UserTierCopyWith<$Res>(_value.tier!, (value) {
      return _then(_value.copyWith(tier: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
    _$UserImpl value,
    $Res Function(_$UserImpl) then,
  ) = __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String? email,
    @JsonKey(name: 'device_id') String? deviceId,
    @JsonKey(name: 'lotto_tier') int? lottoTier,
    UserTier? tier,
    @JsonKey(name: 'zam_balance') int zamBalance,
    String? gender,
    @JsonKey(name: 'birth_date') String? birthDate,
    String? region,
    String? nickname,
    @JsonKey(name: 'purchase_frequency') String? purchaseFrequency,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  });

  @override
  $UserTierCopyWith<$Res>? get tier;
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
    : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = freezed,
    Object? deviceId = freezed,
    Object? lottoTier = freezed,
    Object? tier = freezed,
    Object? zamBalance = null,
    Object? gender = freezed,
    Object? birthDate = freezed,
    Object? region = freezed,
    Object? nickname = freezed,
    Object? purchaseFrequency = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$UserImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        deviceId: freezed == deviceId
            ? _value.deviceId
            : deviceId // ignore: cast_nullable_to_non_nullable
                  as String?,
        lottoTier: freezed == lottoTier
            ? _value.lottoTier
            : lottoTier // ignore: cast_nullable_to_non_nullable
                  as int?,
        tier: freezed == tier
            ? _value.tier
            : tier // ignore: cast_nullable_to_non_nullable
                  as UserTier?,
        zamBalance: null == zamBalance
            ? _value.zamBalance
            : zamBalance // ignore: cast_nullable_to_non_nullable
                  as int,
        gender: freezed == gender
            ? _value.gender
            : gender // ignore: cast_nullable_to_non_nullable
                  as String?,
        birthDate: freezed == birthDate
            ? _value.birthDate
            : birthDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        region: freezed == region
            ? _value.region
            : region // ignore: cast_nullable_to_non_nullable
                  as String?,
        nickname: freezed == nickname
            ? _value.nickname
            : nickname // ignore: cast_nullable_to_non_nullable
                  as String?,
        purchaseFrequency: freezed == purchaseFrequency
            ? _value.purchaseFrequency
            : purchaseFrequency // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl({
    required this.id,
    this.email,
    @JsonKey(name: 'device_id') this.deviceId,
    @JsonKey(name: 'lotto_tier') this.lottoTier,
    this.tier,
    @JsonKey(name: 'zam_balance') this.zamBalance = 0,
    this.gender,
    @JsonKey(name: 'birth_date') this.birthDate,
    this.region,
    this.nickname,
    @JsonKey(name: 'purchase_frequency') this.purchaseFrequency,
    @JsonKey(name: 'created_at') this.createdAt,
    @JsonKey(name: 'updated_at') this.updatedAt,
  });

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final int id;
  @override
  final String? email;
  @override
  @JsonKey(name: 'device_id')
  final String? deviceId;
  @override
  @JsonKey(name: 'lotto_tier')
  final int? lottoTier;
  @override
  final UserTier? tier;
  @override
  @JsonKey(name: 'zam_balance')
  final int zamBalance;
  @override
  final String? gender;
  @override
  @JsonKey(name: 'birth_date')
  final String? birthDate;
  @override
  final String? region;
  @override
  final String? nickname;
  @override
  @JsonKey(name: 'purchase_frequency')
  final String? purchaseFrequency;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @override
  String toString() {
    return 'User(id: $id, email: $email, deviceId: $deviceId, lottoTier: $lottoTier, tier: $tier, zamBalance: $zamBalance, gender: $gender, birthDate: $birthDate, region: $region, nickname: $nickname, purchaseFrequency: $purchaseFrequency, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.lottoTier, lottoTier) ||
                other.lottoTier == lottoTier) &&
            (identical(other.tier, tier) || other.tier == tier) &&
            (identical(other.zamBalance, zamBalance) ||
                other.zamBalance == zamBalance) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.purchaseFrequency, purchaseFrequency) ||
                other.purchaseFrequency == purchaseFrequency) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    email,
    deviceId,
    lottoTier,
    tier,
    zamBalance,
    gender,
    birthDate,
    region,
    nickname,
    purchaseFrequency,
    createdAt,
    updatedAt,
  );

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(this);
  }
}

abstract class _User implements User {
  const factory _User({
    required final int id,
    final String? email,
    @JsonKey(name: 'device_id') final String? deviceId,
    @JsonKey(name: 'lotto_tier') final int? lottoTier,
    final UserTier? tier,
    @JsonKey(name: 'zam_balance') final int zamBalance,
    final String? gender,
    @JsonKey(name: 'birth_date') final String? birthDate,
    final String? region,
    final String? nickname,
    @JsonKey(name: 'purchase_frequency') final String? purchaseFrequency,
    @JsonKey(name: 'created_at') final String? createdAt,
    @JsonKey(name: 'updated_at') final String? updatedAt,
  }) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  int get id;
  @override
  String? get email;
  @override
  @JsonKey(name: 'device_id')
  String? get deviceId;
  @override
  @JsonKey(name: 'lotto_tier')
  int? get lottoTier;
  @override
  UserTier? get tier;
  @override
  @JsonKey(name: 'zam_balance')
  int get zamBalance;
  @override
  String? get gender;
  @override
  @JsonKey(name: 'birth_date')
  String? get birthDate;
  @override
  String? get region;
  @override
  String? get nickname;
  @override
  @JsonKey(name: 'purchase_frequency')
  String? get purchaseFrequency;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserTier _$UserTierFromJson(Map<String, dynamic> json) {
  return _UserTier.fromJson(json);
}

/// @nodoc
mixin _$UserTier {
  int? get id => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;

  /// Serializes this UserTier to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserTier
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserTierCopyWith<UserTier> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserTierCopyWith<$Res> {
  factory $UserTierCopyWith(UserTier value, $Res Function(UserTier) then) =
      _$UserTierCopyWithImpl<$Res, UserTier>;
  @useResult
  $Res call({
    int? id,
    String code,
    String name,
    int level,
    @JsonKey(name: 'is_active') bool isActive,
  });
}

/// @nodoc
class _$UserTierCopyWithImpl<$Res, $Val extends UserTier>
    implements $UserTierCopyWith<$Res> {
  _$UserTierCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserTier
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = null,
    Object? name = null,
    Object? level = null,
    Object? isActive = null,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            code: null == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            level: null == level
                ? _value.level
                : level // ignore: cast_nullable_to_non_nullable
                      as int,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserTierImplCopyWith<$Res>
    implements $UserTierCopyWith<$Res> {
  factory _$$UserTierImplCopyWith(
    _$UserTierImpl value,
    $Res Function(_$UserTierImpl) then,
  ) = __$$UserTierImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    String code,
    String name,
    int level,
    @JsonKey(name: 'is_active') bool isActive,
  });
}

/// @nodoc
class __$$UserTierImplCopyWithImpl<$Res>
    extends _$UserTierCopyWithImpl<$Res, _$UserTierImpl>
    implements _$$UserTierImplCopyWith<$Res> {
  __$$UserTierImplCopyWithImpl(
    _$UserTierImpl _value,
    $Res Function(_$UserTierImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserTier
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = null,
    Object? name = null,
    Object? level = null,
    Object? isActive = null,
  }) {
    return _then(
      _$UserTierImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        code: null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        level: null == level
            ? _value.level
            : level // ignore: cast_nullable_to_non_nullable
                  as int,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserTierImpl implements _UserTier {
  const _$UserTierImpl({
    this.id,
    required this.code,
    required this.name,
    required this.level,
    @JsonKey(name: 'is_active') this.isActive = true,
  });

  factory _$UserTierImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserTierImplFromJson(json);

  @override
  final int? id;
  @override
  final String code;
  @override
  final String name;
  @override
  final int level;
  @override
  @JsonKey(name: 'is_active')
  final bool isActive;

  @override
  String toString() {
    return 'UserTier(id: $id, code: $code, name: $name, level: $level, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserTierImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, code, name, level, isActive);

  /// Create a copy of UserTier
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserTierImplCopyWith<_$UserTierImpl> get copyWith =>
      __$$UserTierImplCopyWithImpl<_$UserTierImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserTierImplToJson(this);
  }
}

abstract class _UserTier implements UserTier {
  const factory _UserTier({
    final int? id,
    required final String code,
    required final String name,
    required final int level,
    @JsonKey(name: 'is_active') final bool isActive,
  }) = _$UserTierImpl;

  factory _UserTier.fromJson(Map<String, dynamic> json) =
      _$UserTierImpl.fromJson;

  @override
  int? get id;
  @override
  String get code;
  @override
  String get name;
  @override
  int get level;
  @override
  @JsonKey(name: 'is_active')
  bool get isActive;

  /// Create a copy of UserTier
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserTierImplCopyWith<_$UserTierImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) {
  return _LoginRequest.fromJson(json);
}

/// @nodoc
mixin _$LoginRequest {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  /// Serializes this LoginRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginRequestCopyWith<LoginRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginRequestCopyWith<$Res> {
  factory $LoginRequestCopyWith(
    LoginRequest value,
    $Res Function(LoginRequest) then,
  ) = _$LoginRequestCopyWithImpl<$Res, LoginRequest>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class _$LoginRequestCopyWithImpl<$Res, $Val extends LoginRequest>
    implements $LoginRequestCopyWith<$Res> {
  _$LoginRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null, Object? password = null}) {
    return _then(
      _value.copyWith(
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            password: null == password
                ? _value.password
                : password // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LoginRequestImplCopyWith<$Res>
    implements $LoginRequestCopyWith<$Res> {
  factory _$$LoginRequestImplCopyWith(
    _$LoginRequestImpl value,
    $Res Function(_$LoginRequestImpl) then,
  ) = __$$LoginRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$LoginRequestImplCopyWithImpl<$Res>
    extends _$LoginRequestCopyWithImpl<$Res, _$LoginRequestImpl>
    implements _$$LoginRequestImplCopyWith<$Res> {
  __$$LoginRequestImplCopyWithImpl(
    _$LoginRequestImpl _value,
    $Res Function(_$LoginRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null, Object? password = null}) {
    return _then(
      _$LoginRequestImpl(
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        password: null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginRequestImpl implements _LoginRequest {
  const _$LoginRequestImpl({required this.email, required this.password});

  factory _$LoginRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginRequestImplFromJson(json);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginRequest(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginRequestImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  /// Create a copy of LoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginRequestImplCopyWith<_$LoginRequestImpl> get copyWith =>
      __$$LoginRequestImplCopyWithImpl<_$LoginRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginRequestImplToJson(this);
  }
}

abstract class _LoginRequest implements LoginRequest {
  const factory _LoginRequest({
    required final String email,
    required final String password,
  }) = _$LoginRequestImpl;

  factory _LoginRequest.fromJson(Map<String, dynamic> json) =
      _$LoginRequestImpl.fromJson;

  @override
  String get email;
  @override
  String get password;

  /// Create a copy of LoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginRequestImplCopyWith<_$LoginRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GuestLoginRequest _$GuestLoginRequestFromJson(Map<String, dynamic> json) {
  return _GuestLoginRequest.fromJson(json);
}

/// @nodoc
mixin _$GuestLoginRequest {
  @JsonKey(name: 'device_id')
  String get deviceId => throw _privateConstructorUsedError;

  /// Serializes this GuestLoginRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GuestLoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GuestLoginRequestCopyWith<GuestLoginRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuestLoginRequestCopyWith<$Res> {
  factory $GuestLoginRequestCopyWith(
    GuestLoginRequest value,
    $Res Function(GuestLoginRequest) then,
  ) = _$GuestLoginRequestCopyWithImpl<$Res, GuestLoginRequest>;
  @useResult
  $Res call({@JsonKey(name: 'device_id') String deviceId});
}

/// @nodoc
class _$GuestLoginRequestCopyWithImpl<$Res, $Val extends GuestLoginRequest>
    implements $GuestLoginRequestCopyWith<$Res> {
  _$GuestLoginRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GuestLoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? deviceId = null}) {
    return _then(
      _value.copyWith(
            deviceId: null == deviceId
                ? _value.deviceId
                : deviceId // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GuestLoginRequestImplCopyWith<$Res>
    implements $GuestLoginRequestCopyWith<$Res> {
  factory _$$GuestLoginRequestImplCopyWith(
    _$GuestLoginRequestImpl value,
    $Res Function(_$GuestLoginRequestImpl) then,
  ) = __$$GuestLoginRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'device_id') String deviceId});
}

/// @nodoc
class __$$GuestLoginRequestImplCopyWithImpl<$Res>
    extends _$GuestLoginRequestCopyWithImpl<$Res, _$GuestLoginRequestImpl>
    implements _$$GuestLoginRequestImplCopyWith<$Res> {
  __$$GuestLoginRequestImplCopyWithImpl(
    _$GuestLoginRequestImpl _value,
    $Res Function(_$GuestLoginRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GuestLoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? deviceId = null}) {
    return _then(
      _$GuestLoginRequestImpl(
        deviceId: null == deviceId
            ? _value.deviceId
            : deviceId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GuestLoginRequestImpl implements _GuestLoginRequest {
  const _$GuestLoginRequestImpl({
    @JsonKey(name: 'device_id') required this.deviceId,
  });

  factory _$GuestLoginRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$GuestLoginRequestImplFromJson(json);

  @override
  @JsonKey(name: 'device_id')
  final String deviceId;

  @override
  String toString() {
    return 'GuestLoginRequest(deviceId: $deviceId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GuestLoginRequestImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, deviceId);

  /// Create a copy of GuestLoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GuestLoginRequestImplCopyWith<_$GuestLoginRequestImpl> get copyWith =>
      __$$GuestLoginRequestImplCopyWithImpl<_$GuestLoginRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$GuestLoginRequestImplToJson(this);
  }
}

abstract class _GuestLoginRequest implements GuestLoginRequest {
  const factory _GuestLoginRequest({
    @JsonKey(name: 'device_id') required final String deviceId,
  }) = _$GuestLoginRequestImpl;

  factory _GuestLoginRequest.fromJson(Map<String, dynamic> json) =
      _$GuestLoginRequestImpl.fromJson;

  @override
  @JsonKey(name: 'device_id')
  String get deviceId;

  /// Create a copy of GuestLoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GuestLoginRequestImplCopyWith<_$GuestLoginRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) {
  return _RegisterRequest.fromJson(json);
}

/// @nodoc
mixin _$RegisterRequest {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'birth_date')
  String get birthDate => throw _privateConstructorUsedError;
  String? get region => throw _privateConstructorUsedError;
  String? get nickname => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_frequency')
  String? get purchaseFrequency => throw _privateConstructorUsedError;
  @JsonKey(name: 'device_id')
  String? get deviceId => throw _privateConstructorUsedError;

  /// Serializes this RegisterRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegisterRequestCopyWith<RegisterRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterRequestCopyWith<$Res> {
  factory $RegisterRequestCopyWith(
    RegisterRequest value,
    $Res Function(RegisterRequest) then,
  ) = _$RegisterRequestCopyWithImpl<$Res, RegisterRequest>;
  @useResult
  $Res call({
    String email,
    String password,
    String code,
    String gender,
    @JsonKey(name: 'birth_date') String birthDate,
    String? region,
    String? nickname,
    @JsonKey(name: 'purchase_frequency') String? purchaseFrequency,
    @JsonKey(name: 'device_id') String? deviceId,
  });
}

/// @nodoc
class _$RegisterRequestCopyWithImpl<$Res, $Val extends RegisterRequest>
    implements $RegisterRequestCopyWith<$Res> {
  _$RegisterRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? code = null,
    Object? gender = null,
    Object? birthDate = null,
    Object? region = freezed,
    Object? nickname = freezed,
    Object? purchaseFrequency = freezed,
    Object? deviceId = freezed,
  }) {
    return _then(
      _value.copyWith(
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            password: null == password
                ? _value.password
                : password // ignore: cast_nullable_to_non_nullable
                      as String,
            code: null == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as String,
            gender: null == gender
                ? _value.gender
                : gender // ignore: cast_nullable_to_non_nullable
                      as String,
            birthDate: null == birthDate
                ? _value.birthDate
                : birthDate // ignore: cast_nullable_to_non_nullable
                      as String,
            region: freezed == region
                ? _value.region
                : region // ignore: cast_nullable_to_non_nullable
                      as String?,
            nickname: freezed == nickname
                ? _value.nickname
                : nickname // ignore: cast_nullable_to_non_nullable
                      as String?,
            purchaseFrequency: freezed == purchaseFrequency
                ? _value.purchaseFrequency
                : purchaseFrequency // ignore: cast_nullable_to_non_nullable
                      as String?,
            deviceId: freezed == deviceId
                ? _value.deviceId
                : deviceId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RegisterRequestImplCopyWith<$Res>
    implements $RegisterRequestCopyWith<$Res> {
  factory _$$RegisterRequestImplCopyWith(
    _$RegisterRequestImpl value,
    $Res Function(_$RegisterRequestImpl) then,
  ) = __$$RegisterRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String email,
    String password,
    String code,
    String gender,
    @JsonKey(name: 'birth_date') String birthDate,
    String? region,
    String? nickname,
    @JsonKey(name: 'purchase_frequency') String? purchaseFrequency,
    @JsonKey(name: 'device_id') String? deviceId,
  });
}

/// @nodoc
class __$$RegisterRequestImplCopyWithImpl<$Res>
    extends _$RegisterRequestCopyWithImpl<$Res, _$RegisterRequestImpl>
    implements _$$RegisterRequestImplCopyWith<$Res> {
  __$$RegisterRequestImplCopyWithImpl(
    _$RegisterRequestImpl _value,
    $Res Function(_$RegisterRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? code = null,
    Object? gender = null,
    Object? birthDate = null,
    Object? region = freezed,
    Object? nickname = freezed,
    Object? purchaseFrequency = freezed,
    Object? deviceId = freezed,
  }) {
    return _then(
      _$RegisterRequestImpl(
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        password: null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
        code: null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        gender: null == gender
            ? _value.gender
            : gender // ignore: cast_nullable_to_non_nullable
                  as String,
        birthDate: null == birthDate
            ? _value.birthDate
            : birthDate // ignore: cast_nullable_to_non_nullable
                  as String,
        region: freezed == region
            ? _value.region
            : region // ignore: cast_nullable_to_non_nullable
                  as String?,
        nickname: freezed == nickname
            ? _value.nickname
            : nickname // ignore: cast_nullable_to_non_nullable
                  as String?,
        purchaseFrequency: freezed == purchaseFrequency
            ? _value.purchaseFrequency
            : purchaseFrequency // ignore: cast_nullable_to_non_nullable
                  as String?,
        deviceId: freezed == deviceId
            ? _value.deviceId
            : deviceId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RegisterRequestImpl implements _RegisterRequest {
  const _$RegisterRequestImpl({
    required this.email,
    required this.password,
    required this.code,
    required this.gender,
    @JsonKey(name: 'birth_date') required this.birthDate,
    this.region,
    this.nickname,
    @JsonKey(name: 'purchase_frequency') this.purchaseFrequency,
    @JsonKey(name: 'device_id') this.deviceId,
  });

  factory _$RegisterRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegisterRequestImplFromJson(json);

  @override
  final String email;
  @override
  final String password;
  @override
  final String code;
  @override
  final String gender;
  @override
  @JsonKey(name: 'birth_date')
  final String birthDate;
  @override
  final String? region;
  @override
  final String? nickname;
  @override
  @JsonKey(name: 'purchase_frequency')
  final String? purchaseFrequency;
  @override
  @JsonKey(name: 'device_id')
  final String? deviceId;

  @override
  String toString() {
    return 'RegisterRequest(email: $email, password: $password, code: $code, gender: $gender, birthDate: $birthDate, region: $region, nickname: $nickname, purchaseFrequency: $purchaseFrequency, deviceId: $deviceId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterRequestImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.purchaseFrequency, purchaseFrequency) ||
                other.purchaseFrequency == purchaseFrequency) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    email,
    password,
    code,
    gender,
    birthDate,
    region,
    nickname,
    purchaseFrequency,
    deviceId,
  );

  /// Create a copy of RegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterRequestImplCopyWith<_$RegisterRequestImpl> get copyWith =>
      __$$RegisterRequestImplCopyWithImpl<_$RegisterRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RegisterRequestImplToJson(this);
  }
}

abstract class _RegisterRequest implements RegisterRequest {
  const factory _RegisterRequest({
    required final String email,
    required final String password,
    required final String code,
    required final String gender,
    @JsonKey(name: 'birth_date') required final String birthDate,
    final String? region,
    final String? nickname,
    @JsonKey(name: 'purchase_frequency') final String? purchaseFrequency,
    @JsonKey(name: 'device_id') final String? deviceId,
  }) = _$RegisterRequestImpl;

  factory _RegisterRequest.fromJson(Map<String, dynamic> json) =
      _$RegisterRequestImpl.fromJson;

  @override
  String get email;
  @override
  String get password;
  @override
  String get code;
  @override
  String get gender;
  @override
  @JsonKey(name: 'birth_date')
  String get birthDate;
  @override
  String? get region;
  @override
  String? get nickname;
  @override
  @JsonKey(name: 'purchase_frequency')
  String? get purchaseFrequency;
  @override
  @JsonKey(name: 'device_id')
  String? get deviceId;

  /// Create a copy of RegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterRequestImplCopyWith<_$RegisterRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SendCodeRequest _$SendCodeRequestFromJson(Map<String, dynamic> json) {
  return _SendCodeRequest.fromJson(json);
}

/// @nodoc
mixin _$SendCodeRequest {
  String get email => throw _privateConstructorUsedError;

  /// Serializes this SendCodeRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SendCodeRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SendCodeRequestCopyWith<SendCodeRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendCodeRequestCopyWith<$Res> {
  factory $SendCodeRequestCopyWith(
    SendCodeRequest value,
    $Res Function(SendCodeRequest) then,
  ) = _$SendCodeRequestCopyWithImpl<$Res, SendCodeRequest>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class _$SendCodeRequestCopyWithImpl<$Res, $Val extends SendCodeRequest>
    implements $SendCodeRequestCopyWith<$Res> {
  _$SendCodeRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SendCodeRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null}) {
    return _then(
      _value.copyWith(
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SendCodeRequestImplCopyWith<$Res>
    implements $SendCodeRequestCopyWith<$Res> {
  factory _$$SendCodeRequestImplCopyWith(
    _$SendCodeRequestImpl value,
    $Res Function(_$SendCodeRequestImpl) then,
  ) = __$$SendCodeRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$SendCodeRequestImplCopyWithImpl<$Res>
    extends _$SendCodeRequestCopyWithImpl<$Res, _$SendCodeRequestImpl>
    implements _$$SendCodeRequestImplCopyWith<$Res> {
  __$$SendCodeRequestImplCopyWithImpl(
    _$SendCodeRequestImpl _value,
    $Res Function(_$SendCodeRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SendCodeRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null}) {
    return _then(
      _$SendCodeRequestImpl(
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SendCodeRequestImpl implements _SendCodeRequest {
  const _$SendCodeRequestImpl({required this.email});

  factory _$SendCodeRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$SendCodeRequestImplFromJson(json);

  @override
  final String email;

  @override
  String toString() {
    return 'SendCodeRequest(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendCodeRequestImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of SendCodeRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendCodeRequestImplCopyWith<_$SendCodeRequestImpl> get copyWith =>
      __$$SendCodeRequestImplCopyWithImpl<_$SendCodeRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SendCodeRequestImplToJson(this);
  }
}

abstract class _SendCodeRequest implements SendCodeRequest {
  const factory _SendCodeRequest({required final String email}) =
      _$SendCodeRequestImpl;

  factory _SendCodeRequest.fromJson(Map<String, dynamic> json) =
      _$SendCodeRequestImpl.fromJson;

  @override
  String get email;

  /// Create a copy of SendCodeRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendCodeRequestImplCopyWith<_$SendCodeRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LinkEmailRequest _$LinkEmailRequestFromJson(Map<String, dynamic> json) {
  return _LinkEmailRequest.fromJson(json);
}

/// @nodoc
mixin _$LinkEmailRequest {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;

  /// Serializes this LinkEmailRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LinkEmailRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LinkEmailRequestCopyWith<LinkEmailRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LinkEmailRequestCopyWith<$Res> {
  factory $LinkEmailRequestCopyWith(
    LinkEmailRequest value,
    $Res Function(LinkEmailRequest) then,
  ) = _$LinkEmailRequestCopyWithImpl<$Res, LinkEmailRequest>;
  @useResult
  $Res call({String email, String password, String code});
}

/// @nodoc
class _$LinkEmailRequestCopyWithImpl<$Res, $Val extends LinkEmailRequest>
    implements $LinkEmailRequestCopyWith<$Res> {
  _$LinkEmailRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LinkEmailRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? code = null,
  }) {
    return _then(
      _value.copyWith(
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            password: null == password
                ? _value.password
                : password // ignore: cast_nullable_to_non_nullable
                      as String,
            code: null == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LinkEmailRequestImplCopyWith<$Res>
    implements $LinkEmailRequestCopyWith<$Res> {
  factory _$$LinkEmailRequestImplCopyWith(
    _$LinkEmailRequestImpl value,
    $Res Function(_$LinkEmailRequestImpl) then,
  ) = __$$LinkEmailRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password, String code});
}

/// @nodoc
class __$$LinkEmailRequestImplCopyWithImpl<$Res>
    extends _$LinkEmailRequestCopyWithImpl<$Res, _$LinkEmailRequestImpl>
    implements _$$LinkEmailRequestImplCopyWith<$Res> {
  __$$LinkEmailRequestImplCopyWithImpl(
    _$LinkEmailRequestImpl _value,
    $Res Function(_$LinkEmailRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LinkEmailRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? code = null,
  }) {
    return _then(
      _$LinkEmailRequestImpl(
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        password: null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
        code: null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LinkEmailRequestImpl implements _LinkEmailRequest {
  const _$LinkEmailRequestImpl({
    required this.email,
    required this.password,
    required this.code,
  });

  factory _$LinkEmailRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$LinkEmailRequestImplFromJson(json);

  @override
  final String email;
  @override
  final String password;
  @override
  final String code;

  @override
  String toString() {
    return 'LinkEmailRequest(email: $email, password: $password, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LinkEmailRequestImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, password, code);

  /// Create a copy of LinkEmailRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LinkEmailRequestImplCopyWith<_$LinkEmailRequestImpl> get copyWith =>
      __$$LinkEmailRequestImplCopyWithImpl<_$LinkEmailRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LinkEmailRequestImplToJson(this);
  }
}

abstract class _LinkEmailRequest implements LinkEmailRequest {
  const factory _LinkEmailRequest({
    required final String email,
    required final String password,
    required final String code,
  }) = _$LinkEmailRequestImpl;

  factory _LinkEmailRequest.fromJson(Map<String, dynamic> json) =
      _$LinkEmailRequestImpl.fromJson;

  @override
  String get email;
  @override
  String get password;
  @override
  String get code;

  /// Create a copy of LinkEmailRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LinkEmailRequestImplCopyWith<_$LinkEmailRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChangePasswordRequest _$ChangePasswordRequestFromJson(
  Map<String, dynamic> json,
) {
  return _ChangePasswordRequest.fromJson(json);
}

/// @nodoc
mixin _$ChangePasswordRequest {
  @JsonKey(name: 'old_password')
  String get oldPassword => throw _privateConstructorUsedError;
  @JsonKey(name: 'new_password')
  String get newPassword => throw _privateConstructorUsedError;

  /// Serializes this ChangePasswordRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChangePasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChangePasswordRequestCopyWith<ChangePasswordRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChangePasswordRequestCopyWith<$Res> {
  factory $ChangePasswordRequestCopyWith(
    ChangePasswordRequest value,
    $Res Function(ChangePasswordRequest) then,
  ) = _$ChangePasswordRequestCopyWithImpl<$Res, ChangePasswordRequest>;
  @useResult
  $Res call({
    @JsonKey(name: 'old_password') String oldPassword,
    @JsonKey(name: 'new_password') String newPassword,
  });
}

/// @nodoc
class _$ChangePasswordRequestCopyWithImpl<
  $Res,
  $Val extends ChangePasswordRequest
>
    implements $ChangePasswordRequestCopyWith<$Res> {
  _$ChangePasswordRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChangePasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? oldPassword = null, Object? newPassword = null}) {
    return _then(
      _value.copyWith(
            oldPassword: null == oldPassword
                ? _value.oldPassword
                : oldPassword // ignore: cast_nullable_to_non_nullable
                      as String,
            newPassword: null == newPassword
                ? _value.newPassword
                : newPassword // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChangePasswordRequestImplCopyWith<$Res>
    implements $ChangePasswordRequestCopyWith<$Res> {
  factory _$$ChangePasswordRequestImplCopyWith(
    _$ChangePasswordRequestImpl value,
    $Res Function(_$ChangePasswordRequestImpl) then,
  ) = __$$ChangePasswordRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'old_password') String oldPassword,
    @JsonKey(name: 'new_password') String newPassword,
  });
}

/// @nodoc
class __$$ChangePasswordRequestImplCopyWithImpl<$Res>
    extends
        _$ChangePasswordRequestCopyWithImpl<$Res, _$ChangePasswordRequestImpl>
    implements _$$ChangePasswordRequestImplCopyWith<$Res> {
  __$$ChangePasswordRequestImplCopyWithImpl(
    _$ChangePasswordRequestImpl _value,
    $Res Function(_$ChangePasswordRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChangePasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? oldPassword = null, Object? newPassword = null}) {
    return _then(
      _$ChangePasswordRequestImpl(
        oldPassword: null == oldPassword
            ? _value.oldPassword
            : oldPassword // ignore: cast_nullable_to_non_nullable
                  as String,
        newPassword: null == newPassword
            ? _value.newPassword
            : newPassword // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChangePasswordRequestImpl implements _ChangePasswordRequest {
  const _$ChangePasswordRequestImpl({
    @JsonKey(name: 'old_password') required this.oldPassword,
    @JsonKey(name: 'new_password') required this.newPassword,
  });

  factory _$ChangePasswordRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChangePasswordRequestImplFromJson(json);

  @override
  @JsonKey(name: 'old_password')
  final String oldPassword;
  @override
  @JsonKey(name: 'new_password')
  final String newPassword;

  @override
  String toString() {
    return 'ChangePasswordRequest(oldPassword: $oldPassword, newPassword: $newPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangePasswordRequestImpl &&
            (identical(other.oldPassword, oldPassword) ||
                other.oldPassword == oldPassword) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, oldPassword, newPassword);

  /// Create a copy of ChangePasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangePasswordRequestImplCopyWith<_$ChangePasswordRequestImpl>
  get copyWith =>
      __$$ChangePasswordRequestImplCopyWithImpl<_$ChangePasswordRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ChangePasswordRequestImplToJson(this);
  }
}

abstract class _ChangePasswordRequest implements ChangePasswordRequest {
  const factory _ChangePasswordRequest({
    @JsonKey(name: 'old_password') required final String oldPassword,
    @JsonKey(name: 'new_password') required final String newPassword,
  }) = _$ChangePasswordRequestImpl;

  factory _ChangePasswordRequest.fromJson(Map<String, dynamic> json) =
      _$ChangePasswordRequestImpl.fromJson;

  @override
  @JsonKey(name: 'old_password')
  String get oldPassword;
  @override
  @JsonKey(name: 'new_password')
  String get newPassword;

  /// Create a copy of ChangePasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangePasswordRequestImplCopyWith<_$ChangePasswordRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}
