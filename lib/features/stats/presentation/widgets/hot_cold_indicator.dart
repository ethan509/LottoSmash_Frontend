import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

/// HOT/COLD/NEUTRAL 상태 배지
class HotColdIndicator extends StatelessWidget {
  final String status;
  final double? fontSize;

  const HotColdIndicator({
    super.key,
    required this.status,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final (color, label) = _getStatusInfo(status);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: fontSize ?? 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  (Color, String) _getStatusInfo(String status) {
    switch (status.toUpperCase()) {
      case 'HOT':
        return (AppColors.hotColor, 'HOT');
      case 'COLD':
        return (AppColors.coldColor, 'COLD');
      default:
        return (AppColors.neutralColor, 'NEUTRAL');
    }
  }
}
