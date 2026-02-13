import 'package:flutter/material.dart';
import '../../core/theme/lotto_ball_theme.dart';

class LottoBall extends StatelessWidget {
  final int number;
  final double size;
  final bool isBonus;

  const LottoBall({
    super.key,
    required this.number,
    this.size = 40,
    this.isBonus = false,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = LottoBallTheme.getTextColor(number);
    final fontSize = size * 0.4;

    return Container(
      width: size,
      height: size,
      decoration: LottoBallTheme.getBallDecoration(number, size: size).copyWith(
        border: isBonus
            ? Border.all(
                color: Theme.of(context).colorScheme.primary,
                width: 2,
              )
            : null,
      ),
      child: Center(
        child: Text(
          '$number',
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class LottoBallRow extends StatelessWidget {
  final List<int> numbers;
  final int? bonusNumber;
  final double ballSize;
  final double spacing;

  const LottoBallRow({
    super.key,
    required this.numbers,
    this.bonusNumber,
    this.ballSize = 40,
    this.spacing = 4,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...numbers.map((n) => Padding(
              padding: EdgeInsets.symmetric(horizontal: spacing / 2),
              child: LottoBall(number: n, size: ballSize),
            )),
        if (bonusNumber != null) ...[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: spacing),
            child: Text(
              '+',
              style: TextStyle(
                fontSize: ballSize * 0.4,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
          LottoBall(
            number: bonusNumber!,
            size: ballSize,
            isBonus: true,
          ),
        ],
      ],
    );
  }
}
