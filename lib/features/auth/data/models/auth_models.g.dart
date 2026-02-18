// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthResponseImpl _$$AuthResponseImplFromJson(Map<String, dynamic> json) =>
    _$AuthResponseImpl(
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
      expiresIn: (json['expires_in'] as num).toInt(),
      tokenType: json['token_type'] as String,
    );

Map<String, dynamic> _$$AuthResponseImplToJson(_$AuthResponseImpl instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'expires_in': instance.expiresIn,
      'token_type': instance.tokenType,
    };

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
  id: (json['id'] as num).toInt(),
  email: json['email'] as String?,
  deviceId: json['device_id'] as String?,
  lottoTier: (json['lotto_tier'] as num?)?.toInt(),
  tier: json['tier'] == null
      ? null
      : UserTier.fromJson(json['tier'] as Map<String, dynamic>),
  zamBalance: (json['zam_balance'] as num?)?.toInt() ?? 0,
  gender: json['gender'] as String?,
  birthDate: json['birth_date'] as String?,
  region: json['region'] as String?,
  nickname: json['nickname'] as String?,
  purchaseFrequency: json['purchase_frequency'] as String?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'device_id': instance.deviceId,
      'lotto_tier': instance.lottoTier,
      'tier': instance.tier,
      'zam_balance': instance.zamBalance,
      'gender': instance.gender,
      'birth_date': instance.birthDate,
      'region': instance.region,
      'nickname': instance.nickname,
      'purchase_frequency': instance.purchaseFrequency,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

_$UserTierImpl _$$UserTierImplFromJson(Map<String, dynamic> json) =>
    _$UserTierImpl(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String,
      name: json['name'] as String,
      level: (json['level'] as num).toInt(),
      isActive: json['is_active'] as bool? ?? true,
    );

Map<String, dynamic> _$$UserTierImplToJson(_$UserTierImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'level': instance.level,
      'is_active': instance.isActive,
    };

_$LoginRequestImpl _$$LoginRequestImplFromJson(Map<String, dynamic> json) =>
    _$LoginRequestImpl(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$$LoginRequestImplToJson(_$LoginRequestImpl instance) =>
    <String, dynamic>{'email': instance.email, 'password': instance.password};

_$GuestLoginRequestImpl _$$GuestLoginRequestImplFromJson(
  Map<String, dynamic> json,
) => _$GuestLoginRequestImpl(deviceId: json['device_id'] as String);

Map<String, dynamic> _$$GuestLoginRequestImplToJson(
  _$GuestLoginRequestImpl instance,
) => <String, dynamic>{'device_id': instance.deviceId};

_$RegisterRequestImpl _$$RegisterRequestImplFromJson(
  Map<String, dynamic> json,
) => _$RegisterRequestImpl(
  email: json['email'] as String,
  password: json['password'] as String,
  code: json['code'] as String,
  gender: json['gender'] as String,
  birthDate: json['birth_date'] as String,
  region: json['region'] as String?,
  nickname: json['nickname'] as String?,
  purchaseFrequency: json['purchase_frequency'] as String?,
  deviceId: json['device_id'] as String?,
);

Map<String, dynamic> _$$RegisterRequestImplToJson(
  _$RegisterRequestImpl instance,
) => <String, dynamic>{
  'email': instance.email,
  'password': instance.password,
  'code': instance.code,
  'gender': instance.gender,
  'birth_date': instance.birthDate,
  'region': instance.region,
  'nickname': instance.nickname,
  'purchase_frequency': instance.purchaseFrequency,
  'device_id': instance.deviceId,
};

_$SendCodeRequestImpl _$$SendCodeRequestImplFromJson(
  Map<String, dynamic> json,
) => _$SendCodeRequestImpl(email: json['email'] as String);

Map<String, dynamic> _$$SendCodeRequestImplToJson(
  _$SendCodeRequestImpl instance,
) => <String, dynamic>{'email': instance.email};

_$LinkEmailRequestImpl _$$LinkEmailRequestImplFromJson(
  Map<String, dynamic> json,
) => _$LinkEmailRequestImpl(
  email: json['email'] as String,
  password: json['password'] as String,
  code: json['code'] as String,
);

Map<String, dynamic> _$$LinkEmailRequestImplToJson(
  _$LinkEmailRequestImpl instance,
) => <String, dynamic>{
  'email': instance.email,
  'password': instance.password,
  'code': instance.code,
};

_$ChangePasswordRequestImpl _$$ChangePasswordRequestImplFromJson(
  Map<String, dynamic> json,
) => _$ChangePasswordRequestImpl(
  oldPassword: json['old_password'] as String,
  newPassword: json['new_password'] as String,
);

Map<String, dynamic> _$$ChangePasswordRequestImplToJson(
  _$ChangePasswordRequestImpl instance,
) => <String, dynamic>{
  'old_password': instance.oldPassword,
  'new_password': instance.newPassword,
};
