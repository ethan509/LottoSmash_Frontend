import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/utils/date_utils.dart';
import '../../../../core/utils/number_format_utils.dart';
import '../../../../shared/widgets/error_widget.dart';
import '../../../../shared/widgets/loading_indicator.dart';
import '../../../../shared/widgets/lotto_ball.dart';
import '../../data/models/draw_models.dart';
import '../../providers/draw_provider.dart';

class DrawDetailScreen extends ConsumerWidget {
  final int drawNo;

  const DrawDetailScreen({super.key, required this.drawNo});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final drawAsync = ref.watch(drawDetailProvider(drawNo));

    return Scaffold(
      appBar: AppBar(title: Text('제 $drawNo회')),
      body: drawAsync.when(
        loading: () => const LoadingIndicator(),
        error: (error, _) => AppErrorWidget(
          message: error.toString(),
          onRetry: () => ref.invalidate(drawDetailProvider(drawNo)),
        ),
        data: (draw) => _DrawDetailBody(draw: draw),
      ),
    );
  }
}

class _DrawDetailBody extends StatelessWidget {
  final LottoDraw draw;

  const _DrawDetailBody({required this.draw});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // 회차 정보 카드
          Card(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Text(
                    '제 ${draw.drawNo}회',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    AppDateUtils.formatDateString(draw.drawDate),
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // 로또 공 (큰 사이즈)
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.center,
                    child: LottoBallRow(
                      numbers: draw.numbers,
                      bonusNumber: draw.bonusNum,
                      ballSize: 48,
                      spacing: 6,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          // 당첨 정보 카드
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '당첨 정보',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _PrizeRow(
                    rank: AppStrings.firstPrize,
                    winners: draw.firstWinners,
                    prize: draw.firstPerGame > 0
                        ? draw.firstPerGame
                        : draw.firstWinners > 0
                            ? draw.firstPrize ~/ draw.firstWinners
                            : null,
                    totalPrize: draw.firstPrize,
                    isHighlight: true,
                    theme: theme,
                  ),
                  const Divider(height: 24),
                  _PrizeRow(
                    rank: AppStrings.secondPrize,
                    winners: draw.secondWinners,
                    prize: draw.secondPerGame,
                    totalPrize: draw.secondPrize,
                    theme: theme,
                  ),
                  const Divider(height: 24),
                  _PrizeRow(
                    rank: AppStrings.thirdPrize,
                    totalPrize: draw.thirdPrize,
                    theme: theme,
                  ),
                  const Divider(height: 24),
                  _PrizeRow(
                    rank: AppStrings.fourthPrize,
                    totalPrize: draw.fourthPrize,
                    theme: theme,
                  ),
                  const Divider(height: 24),
                  _PrizeRow(
                    rank: AppStrings.fifthPrize,
                    totalPrize: draw.fifthPrize,
                    theme: theme,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PrizeRow extends StatelessWidget {
  final String rank;
  final int? winners;
  final int? prize;
  final int totalPrize;
  final bool isHighlight;
  final ThemeData theme;

  const _PrizeRow({
    required this.rank,
    this.winners,
    this.prize,
    required this.totalPrize,
    this.isHighlight = false,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              rank,
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: isHighlight ? theme.colorScheme.primary : null,
              ),
            ),
            Text(
              totalPrize > 0 ? NumberFormatUtils.formatKrw(totalPrize) : '-',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: isHighlight ? theme.colorScheme.primary : null,
              ),
            ),
          ],
        ),
        if (winners != null || prize != null) ...[
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (winners != null)
                Text(
                  '${AppStrings.winners} ${NumberFormatUtils.formatNumber(winners!)}명',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              if (prize != null && prize! > 0)
                Text(
                  '1인당 ${NumberFormatUtils.formatKrw(prize!)}',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
            ],
          ),
        ],
      ],
    );
  }
}
