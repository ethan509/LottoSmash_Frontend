import 'package:flutter/material.dart';

class ZamBalanceWidget extends StatelessWidget {
  final int balance;
  final double iconSize;
  final TextStyle? textStyle;

  const ZamBalanceWidget({
    super.key,
    required this.balance,
    this.iconSize = 16,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.amber.withAlpha(25),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.amber.withAlpha(50),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.monetization_on,
            size: iconSize,
            color: Colors.amber,
          ),
          const SizedBox(width: 6),
          Text(
            '$balance Zam',
            style: textStyle ??
                theme.textTheme.labelLarge?.copyWith(
                  color: Colors.amber.shade700,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
