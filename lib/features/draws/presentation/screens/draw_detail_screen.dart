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
                    perGame: draw.firstPerGame > 0
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
                    perGame: draw.secondPerGame > 0
                        ? draw.secondPerGame
                        : draw.secondWinners > 0
                            ? draw.secondPrize ~/ draw.secondWinners
                            : null,
                    totalPrize: draw.secondPrize,
                    theme: theme,
                  ),
                  const Divider(height: 24),
                  _PrizeRow(
                    rank: AppStrings.thirdPrize,
                    winners: draw.thirdWinners,
                    perGame: draw.thirdPerGame > 0
                        ? draw.thirdPerGame
                        : draw.thirdWinners > 0
                            ? draw.thirdPrize ~/ draw.thirdWinners
                            : null,
                    totalPrize: draw.thirdPrize,
                    theme: theme,
                  ),
                  const Divider(height: 24),
                  _PrizeRow(
                    rank: AppStrings.fourthPrize,
                    winners: draw.fourthWinners,
                    perGame: draw.fourthPerGame > 0
                        ? draw.fourthPerGame
                        : draw.fourthWinners > 0
                            ? draw.fourthPrize ~/ draw.fourthWinners
                            : null,
                    totalPrize: draw.fourthPrize,
                    theme: theme,
                  ),
                  const Divider(height: 24),
                  _PrizeRow(
                    rank: AppStrings.fifthPrize,
                    winners: draw.fifthWinners,
                    perGame: draw.fifthPerGame > 0
                        ? draw.fifthPerGame
                        : draw.fifthWinners > 0
                            ? draw.fifthPrize ~/ draw.fifthWinners
                            : null,
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
  final int? perGame;
  final int totalPrize;
  final bool isHighlight;
  final ThemeData theme;

  const _PrizeRow({
    required this.rank,
    this.winners,
    this.perGame,
    required this.totalPrize,
    this.isHighlight = false,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    final prizeColor = isHighlight ? theme.colorScheme.primary : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 상단: 등수 | 인당 당첨금
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              rank,
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: prizeColor,
              ),
            ),
            Text(
              perGame != null && perGame! > 0
                  ? '인당 ${NumberFormatUtils.formatKrw(perGame!)}'
                  : '-',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: prizeColor,
              ),
            ),
          ],
        ),
        // 하단: 당첨자 N명 | 총 금액
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              winners != null
                  ? '${AppStrings.winners} ${NumberFormatUtils.formatNumber(winners!)}명'
                  : '',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            Text(
              totalPrize > 0
                  ? '총 ${NumberFormatUtils.formatKrw(totalPrize)}'
                  : '-',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
