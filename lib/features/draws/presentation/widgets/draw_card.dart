import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/utils/date_utils.dart';
import '../../../../core/utils/number_format_utils.dart';
import '../../../../shared/widgets/lotto_ball.dart';
import '../../data/models/draw_models.dart';

class DrawCard extends StatelessWidget {
  final LottoDraw draw;

  const DrawCard({super.key, required this.draw});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: InkWell(
        onTap: () => context.push('/draws/${draw.drawNo}'),
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 회차 + 날짜
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '제 ${draw.drawNo}회',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    AppDateUtils.formatDateString(draw.drawDate),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // 로또 공
              Center(
                child: LottoBallRow(
                  numbers: draw.numbers,
                  bonusNumber: draw.bonusNum,
                  ballSize: 36,
                ),
              ),
              const SizedBox(height: 12),
              // 1등 당첨금
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${AppStrings.firstPrize} ${AppStrings.prizeAmount}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  Text(
                    NumberFormatUtils.formatKrw(draw.firstPrize),
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '당첨게임 수',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  Text(
                    () {
                      final perGame = draw.firstPerGame > 0
                          ? draw.firstPerGame
                          : draw.firstWinners > 0
                              ? draw.firstPrize ~/ draw.firstWinners
                              : 0;
                      return '${NumberFormatUtils.formatNumber(draw.firstWinners)}게임 · 인당 ${NumberFormatUtils.formatKrw(perGame)}';
                    }(),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
