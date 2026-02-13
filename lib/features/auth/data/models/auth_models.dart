import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_models.freezed.dart';
part 'auth_models.g.dart';

@freezed
class AuthResponse with _$AuthResponse {
  const factory AuthResponse({
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'refresh_token') required String refreshToken,
    @JsonKey(name: 'expires_in') required int expiresIn,
    @JsonKey(name: 'token_type') required String tokenType,
  }) = _AuthResponse;

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    required int id,
    String? email,
    @JsonKey(name: 'device_id') String? deviceId,
    @JsonKey(name: 'lotto_tier') int? lottoTier,
    UserTier? tier,
    @JsonKey(name: 'zam_balance') @Default(0) int zamBalance,
    String? gender,
    @JsonKey(name: 'birth_date') String? birthDate,
    String? region,
    String? nickname,
    @JsonKey(name: 'purchase_frequency') String? purchaseFrequency,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class UserTier with _$UserTier {
  const factory UserTier({
    required int id,
    required String code,
    required String name,
    required int level,
    @JsonKey(name: 'is_active') required bool isActive,
  }) = _UserTier;

  factory UserTier.fromJson(Map<String, dynamic> json) =>
      _$UserTierFromJson(json);
}

@freezed
class LoginRequest with _$LoginRequest {
  const factory LoginRequest({
    required String email,
    required String password,
  }) = _LoginRequest;

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
}

@freezed
class GuestLoginRequest with _$GuestLoginRequest {
  const factory GuestLoginRequest({
    @JsonKey(name: 'device_id') required String deviceId,
  }) = _GuestLoginRequest;

  factory GuestLoginRequest.fromJson(Map<String, dynamic> json) =>
      _$GuestLoginRequestFromJson(json);
}

@freezed
class RegisterRequest with _$RegisterRequest {
  const factory RegisterRequest({
    required String email,
    required String password,
    required String code,
    required String gender,
    @JsonKey(name: 'birth_date') required String birthDate,
    String? region,
    String? nickname,
    @JsonKey(name: 'purchase_frequency') String? purchaseFrequency,
  }) = _RegisterRequest;

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);
}

@freezed
class SendCodeRequest with _$SendCodeRequest {
  const factory SendCodeRequest({
    required String email,
  }) = _SendCodeRequest;

  factory SendCodeRequest.fromJson(Map<String, dynamic> json) =>
      _$SendCodeRequestFromJson(json);
}

@freezed
class LinkEmailRequest with _$LinkEmailRequest {
  const factory LinkEmailRequest({
    required String email,
    required String password,
    required String code,
  }) = _LinkEmailRequest;

  factory LinkEmailRequest.fromJson(Map<String, dynamic> json) =>
      _$LinkEmailRequestFromJson(json);
}

@freezed
class ChangePasswordRequest with _$ChangePasswordRequest {
  const factory ChangePasswordRequest({
    @JsonKey(name: 'old_password') required String oldPassword,
    @JsonKey(name: 'new_password') required String newPassword,
  }) = _ChangePasswordRequest;

  factory ChangePasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordRequestFromJson(json);
}
