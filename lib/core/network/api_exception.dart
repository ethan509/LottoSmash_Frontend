import 'package:dio/dio.dart';

class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic data;

  ApiException({
    required this.message,
    this.statusCode,
    this.data,
  });

  factory ApiException.fromDioException(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ApiException(
          message: '서버 연결 시간이 초과되었습니다',
          statusCode: null,
        );
      case DioExceptionType.connectionError:
        return ApiException(
          message: '네트워크에 연결할 수 없습니다',
          statusCode: null,
        );
      case DioExceptionType.badResponse:
        return _fromResponse(error.response);
      case DioExceptionType.cancel:
        return ApiException(message: '요청이 취소되었습니다');
      default:
        return ApiException(message: '알 수 없는 오류가 발생했습니다');
    }
  }

  static ApiException _fromResponse(Response? response) {
    final statusCode = response?.statusCode;
    final data = response?.data;

    // 402: Zam 부족 — 서버 메시지 대신 한국어로 고정
    if (statusCode == 402) {
      return ApiException(
        message: 'Zam 잔액이 부족합니다',
        statusCode: 402,
        data: data,
      );
    }

    String message;
    if (data is Map<String, dynamic> && data.containsKey('error')) {
      message = data['error'] as String;
    } else {
      switch (statusCode) {
        case 400:
          message = '잘못된 요청입니다';
        case 401:
          message = '인증이 필요합니다';
        case 403:
          message = '접근 권한이 없습니다';
        case 404:
          message = '데이터를 찾을 수 없습니다';
        case 409:
          message = '이미 존재하는 데이터입니다';
        case 500:
          message = '서버 오류가 발생했습니다';
        default:
          message = '오류가 발생했습니다 ($statusCode)';
      }
    }

    return ApiException(
      message: message,
      statusCode: statusCode,
      data: data,
    );
  }

  bool get isNetworkError => statusCode == null;
  bool get isUnauthorized => statusCode == 401;
  bool get isNotFound => statusCode == 404;
  bool get isInsufficientZam => statusCode == 402;
  bool get isServerError => statusCode != null && statusCode! >= 500;

  @override
  String toString() => 'ApiException($statusCode): $message';
}
