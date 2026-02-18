import 'dart:io';

class AppConfig {
  static const String appName = 'LottoSmash';
  static const String appVersion = '1.0.0';

  static String get baseUrl {
    if (Platform.isAndroid) {
      return 'http://192.168.45.59:8080';
    }
    return 'http://localhost:8080';
  }

  static const Duration connectTimeout = Duration(seconds: 15);
  static const Duration receiveTimeout = Duration(seconds: 15);
  static const Duration sendTimeout = Duration(seconds: 15);

  static const int tokenExpiresIn = 900; // 15분
  static const Duration cacheTtl = Duration(hours: 1);
}
