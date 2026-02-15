import 'package:flutter/material.dart';

/// 수평 확률 바 (0.0 ~ 1.0)
class ProbabilityBar extends StatelessWidget {
  final double probability;
  final Color? color;
  final double height;
  final String? label;

  const ProbabilityBar({
    super.key,
    required this.probability,
    this.color,
    this.height = 8,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final barColor = color ?? theme.colorScheme.primary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label!,
                style: theme.textTheme.bodySmall,
              ),
              Text(
                '${(probability * 100).toStringAsFixed(1)}%',
                style: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
        ],
        ClipRRect(
          borderRadius: BorderRadius.circular(height / 2),
          child: LinearProgressIndicator(
            value: probability.clamp(0.0, 1.0),
            minHeight: height,
            backgroundColor: barColor.withValues(alpha: 0.12),
            valueColor: AlwaysStoppedAnimation(barColor),
          ),
        ),
      ],
    );
  }
}
