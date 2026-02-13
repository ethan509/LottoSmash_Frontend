import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class LottoBallTheme {
  static const Map<String, Color> colorMap = {
    'Y': AppColors.lottoYellow,
    'B': AppColors.lottoBlue,
    'R': AppColors.lottoRed,
    'G': AppColors.lottoGray,
    'E': AppColors.lottoGreen,
  };

  static Color getColor(int number) => AppColors.getBallColor(number);

  static List<Color> getGradientColors(int number) {
    final base = getColor(number);
    return [
      Color.lerp(base, Colors.white, 0.3)!,
      base,
      Color.lerp(base, Colors.black, 0.2)!,
    ];
  }

  static Color getTextColor(int number) {
    final color = getColor(number);
    return color.computeLuminance() > 0.5 ? Colors.black87 : Colors.white;
  }

  static BoxDecoration getBallDecoration(int number, {double size = 40}) {
    final colors = getGradientColors(number);
    return BoxDecoration(
      shape: BoxShape.circle,
      gradient: RadialGradient(
        center: const Alignment(-0.3, -0.3),
        colors: colors,
        stops: const [0.0, 0.6, 1.0],
      ),
      boxShadow: [
        BoxShadow(
          color: colors[1].withValues(alpha: 0.4),
          blurRadius: 4,
          offset: const Offset(1, 2),
        ),
      ],
    );
  }
}
