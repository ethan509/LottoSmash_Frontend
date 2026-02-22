import 'dart:io';

class AppConfig {
  static const String appName = 'LottoSmash';
  static const String appVersion = '1.0.0';

  // USB 연결(ADB reverse): localhost:8080
  // WiFi 연결: PC의 로컬 IP (예: 192.168.x.x:8080)
  // 에뮬레이터: 10.0.2.2:8080
  static String get baseUrl {
    if (Platform.isAndroid) {
      return 'http://localhost:8080'; // ADB reverse 사용 시 (USB 연결)
      // return 'http://192.168.45.23:8080'; // WiFi 직접 연결 시
      // return 'http://10.0.2.2:8080'; // 에뮬레이터 사용 시
    }
    return 'http://localhost:8080';
  }

  static const Duration connectTimeout = Duration(seconds: 15);
  static const Duration receiveTimeout = Duration(seconds: 15);
  static const Duration sendTimeout = Duration(seconds: 15);

  static const int tokenExpiresIn = 900; // 15분
  static const Duration cacheTtl = Duration(hours: 1);
}
