import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/network/dio_client.dart';
import '../models/auth_models.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(ref.watch(dioProvider));
});

class AuthRepository {
  final Dio _dio;

  AuthRepository(this._dio);

  /// 게스트 로그인
  Future<AuthResponse> guestLogin(String deviceId) async {
    return apiCall(() async {
      final response = await _dio.post(
        ApiEndpoints.guestLogin,
        data: GuestLoginRequest(deviceId: deviceId).toJson(),
      );
      return AuthResponse.fromJson(response.data);
    });
  }

  /// 인증코드 발송
  Future<void> sendCode(String email) async {
    return apiCall(() async {
      await _dio.post(
        ApiEndpoints.sendCode,
        data: SendCodeRequest(email: email).toJson(),
      );
    });
  }

  /// 회원가입
  Future<AuthResponse> register(RegisterRequest request) async {
    return apiCall(() async {
      final response = await _dio.post(
        ApiEndpoints.register,
        data: request.toJson(),
      );
      return AuthResponse.fromJson(response.data);
    });
  }

  /// 이메일 로그인
  Future<AuthResponse> login(String email, String password) async {
    return apiCall(() async {
      final response = await _dio.post(
        ApiEndpoints.login,
        data: LoginRequest(email: email, password: password).toJson(),
      );
      return AuthResponse.fromJson(response.data);
    });
  }

  /// 토큰 갱신
  Future<AuthResponse> refresh(String refreshToken) async {
    return apiCall(() async {
      final response = await _dio.post(
        ApiEndpoints.refresh,
        data: {'refresh_token': refreshToken},
      );
      return AuthResponse.fromJson(response.data);
    });
  }

  /// 로그아웃
  Future<void> logout(String refreshToken) async {
    return apiCall(() async {
      await _dio.post(
        ApiEndpoints.logout,
        data: {'refresh_token': refreshToken},
      );
    });
  }

  /// 내 정보 조회
  Future<User> getMe() async {
    return apiCall(() async {
      final response = await _dio.get(ApiEndpoints.me);
      return User.fromJson(response.data);
    });
  }

  /// 게스트 → 이메일 연동
  Future<void> linkEmail(LinkEmailRequest request) async {
    return apiCall(() async {
      await _dio.post(
        ApiEndpoints.linkEmail,
        data: request.toJson(),
      );
    });
  }

  /// 비밀번호 변경
  Future<void> changePassword(String oldPassword, String newPassword) async {
    return apiCall(() async {
      await _dio.post(
        ApiEndpoints.changePassword,
        data: ChangePasswordRequest(
          oldPassword: oldPassword,
          newPassword: newPassword,
        ).toJson(),
      );
    });
  }
}
