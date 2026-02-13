import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../constants/api_endpoints.dart';
import '../config/app_config.dart';

class AuthInterceptor extends Interceptor {
  final Dio _dio;
  final FlutterSecureStorage _storage;
  bool _isRefreshing = false;
  final List<({RequestOptions options, ErrorInterceptorHandler handler})> _queue = [];

  static const _accessTokenKey = 'access_token';
  static const _refreshTokenKey = 'refresh_token';

  // 인증이 필요 없는 경로들
  static const _publicPaths = [
    ApiEndpoints.guestLogin,
    ApiEndpoints.sendCode,
    ApiEndpoints.register,
    ApiEndpoints.login,
    ApiEndpoints.refresh,
  ];

  AuthInterceptor({
    required Dio dio,
    required FlutterSecureStorage storage,
  })  : _dio = dio,
        _storage = storage;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // Public 경로는 토큰 주입 생략
    final isPublic = _publicPaths.any((path) => options.path.contains(path));
    if (!isPublic) {
      final token = await _storage.read(key: _accessTokenKey);
      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode != 401) {
      handler.next(err);
      return;
    }

    // refresh 요청 자체가 401이면 로그아웃
    if (err.requestOptions.path.contains(ApiEndpoints.refresh)) {
      await _clearTokens();
      handler.next(err);
      return;
    }

    if (_isRefreshing) {
      _queue.add((options: err.requestOptions, handler: handler));
      return;
    }

    _isRefreshing = true;

    try {
      final refreshToken = await _storage.read(key: _refreshTokenKey);
      if (refreshToken == null) {
        await _clearTokens();
        handler.next(err);
        return;
      }

      final response = await Dio(BaseOptions(
        baseUrl: AppConfig.baseUrl,
        headers: {'Content-Type': 'application/json'},
      )).post(
        ApiEndpoints.refresh,
        data: {'refresh_token': refreshToken},
      );

      final newAccessToken = response.data['access_token'] as String;
      final newRefreshToken = response.data['refresh_token'] as String;
      await _saveTokens(newAccessToken, newRefreshToken);

      // 원래 요청 재시도
      err.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';
      final retryResponse = await _dio.fetch(err.requestOptions);
      handler.resolve(retryResponse);

      // 대기 중인 요청들도 재시도
      for (final entry in _queue) {
        entry.options.headers['Authorization'] = 'Bearer $newAccessToken';
        try {
          final retryResp = await _dio.fetch(entry.options);
          entry.handler.resolve(retryResp);
        } on DioException catch (e) {
          entry.handler.reject(e);
        }
      }
    } on DioException {
      await _clearTokens();
      handler.next(err);
      for (final entry in _queue) {
        entry.handler.reject(err);
      }
    } finally {
      _isRefreshing = false;
      _queue.clear();
    }
  }

  Future<void> _saveTokens(String accessToken, String refreshToken) async {
    await _storage.write(key: _accessTokenKey, value: accessToken);
    await _storage.write(key: _refreshTokenKey, value: refreshToken);
  }

  Future<void> _clearTokens() async {
    await _storage.delete(key: _accessTokenKey);
    await _storage.delete(key: _refreshTokenKey);
  }
}
