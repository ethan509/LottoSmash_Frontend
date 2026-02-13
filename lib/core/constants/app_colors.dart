import 'package:flutter/material.dart';

class AppColors {
  // 로또 공 색상 (한국 동행복권 공식)
  static const Color lottoYellow = Color(0xFFFBC400); // 1-10
  static const Color lottoBlue = Color(0xFF69C8F2);   // 11-20
  static const Color lottoRed = Color(0xFFFF7272);    // 21-30
  static const Color lottoGray = Color(0xFFAAAAAA);   // 31-40
  static const Color lottoGreen = Color(0xFFB0D840);  // 41-45

  static Color getBallColor(int number) {
    if (number <= 10) return lottoYellow;
    if (number <= 20) return lottoBlue;
    if (number <= 30) return lottoRed;
    if (number <= 40) return lottoGray;
    return lottoGreen;
  }

  static String getColorCode(int number) {
    if (number <= 10) return 'Y';
    if (number <= 20) return 'B';
    if (number <= 30) return 'R';
    if (number <= 40) return 'G';
    return 'E';
  }

  // 앱 테마 색상
  static const Color primary = Color(0xFF6750A4);
  static const Color secondary = Color(0xFF625B71);
  static const Color tertiary = Color(0xFF7D5260);
  static const Color error = Color(0xFFB3261E);

  // 상태 색상
  static const Color hotColor = Color(0xFFFF5722);
  static const Color coldColor = Color(0xFF2196F3);
  static const Color neutralColor = Color(0xFF9E9E9E);

  // 티어 색상
  static const Color guestTier = Color(0xFF9E9E9E);
  static const Color memberTier = Color(0xFF4CAF50);
  static const Color goldTier = Color(0xFFFFD700);
  static const Color vipTier = Color(0xFFE040FB);
}
