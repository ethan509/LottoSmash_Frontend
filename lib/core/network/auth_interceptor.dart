import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../constants/api_endpoints.dart';
import '../config/app_config.dart';

/// 인메모리 토큰 캐시 — Secure Storage 비동기 읽기 지연 문제 해결
class TokenStore {
  static String? _accessToken;
  static String? _refreshToken;

  static String? get accessToken => _accessToken;
  static String? get refreshToken => _refreshToken;

  /// 토큰 저장 (메모리 + Secure Storage)
  static Future<void> save({
    required String accessToken,
    required String refreshToken,
    required FlutterSecureStorage storage,
  }) async {
    _accessToken = accessToken;
    _refreshToken = refreshToken;
    await storage.write(key: 'access_token', value: accessToken);
    await storage.write(key: 'refresh_token', value: refreshToken);
  }

  /// 토큰 삭제 (메모리 + Secure Storage)
  static Future<void> clear(FlutterSecureStorage storage) async {
    _accessToken = null;
    _refreshToken = null;
    await storage.delete(key: 'access_token');
    await storage.delete(key: 'refresh_token');
  }

  /// 앱 시작 시 Secure Storage → 메모리로 로드
  static Future<void> loadFromStorage(FlutterSecureStorage storage) async {
    _accessToken = await storage.read(key: 'access_token');
    _refreshToken = await storage.read(key: 'refresh_token');
  }
}

class AuthInterceptor extends Interceptor {
  final Dio _dio;
  final FlutterSecureStorage _storage;
  bool _isRefreshing = false;
  final List<({RequestOptions options, ErrorInterceptorHandler handler})> _queue = [];

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
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Public 경로는 토큰 주입 생략
    final isPublic = _publicPaths.any((path) => options.path.contains(path));
    if (!isPublic) {
      final token = TokenStore.accessToken;
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
      await TokenStore.clear(_storage);
      handler.next(err);
      return;
    }

    if (_isRefreshing) {
      _queue.add((options: err.requestOptions, handler: handler));
      return;
    }

    _isRefreshing = true;

    try {
      final refreshToken = TokenStore.refreshToken;
      if (refreshToken == null) {
        await TokenStore.clear(_storage);
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
      await TokenStore.save(
        accessToken: newAccessToken,
        refreshToken: newRefreshToken,
        storage: _storage,
      );

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
      await TokenStore.clear(_storage);
      handler.next(err);
      for (final entry in _queue) {
        entry.handler.reject(err);
      }
    } finally {
      _isRefreshing = false;
      _queue.clear();
    }
  }
}
