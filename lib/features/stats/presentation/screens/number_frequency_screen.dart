import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../shared/widgets/error_widget.dart';
import '../../../../shared/widgets/loading_indicator.dart';
import '../../../../shared/widgets/lotto_ball.dart';
import '../../providers/stats_provider.dart';
import '../../data/models/stats_models.dart';

class NumberFrequencyScreen extends ConsumerWidget {
  const NumberFrequencyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsAsync = ref.watch(numberStatsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.numberFrequency),
      ),
      body: statsAsync.when(
        loading: () => const ShimmerList(itemCount: 3, itemHeight: 200),
        error: (error, _) => AppErrorWidget(
          message: error.toString(),
          onRetry: () => ref.invalidate(numberStatsProvider),
        ),
        data: (data) => RefreshIndicator(
          onRefresh: () async => ref.invalidate(numberStatsProvider),
          child: _FrequencyContent(stats: data.numberStats),
        ),
      ),
    );
  }
}

class _FrequencyContent extends StatelessWidget {
  final List<NumberStat> stats;

  const _FrequencyContent({required this.stats});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final sorted = List<NumberStat>.from(stats)
      ..sort((a, b) => a.number.compareTo(b.number));
    final maxCount =
        sorted.fold<int>(0, (max, s) => s.totalCount > max ? s.totalCount : max);

    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 차트
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '번호별 출현 횟수',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 250,
                    child: BarChart(
                      BarChartData(
                        alignment: BarChartAlignment.spaceAround,
                        maxY: maxCount * 1.1,
                        barTouchData: BarTouchData(
                          touchTooltipData: BarTouchTooltipData(
                            getTooltipItem: (group, groupIndex, rod, rodIndex) {
                              final num = sorted[group.x.toInt()];
                              return BarTooltipItem(
                                '${num.number}번: ${num.totalCount}회',
                                TextStyle(
                                  color: theme.colorScheme.onInverseSurface,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              );
                            },
                          ),
                        ),
                        titlesData: FlTitlesData(
                          show: true,
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, meta) {
                                final idx = value.toInt();
                                if (idx >= sorted.length) {
                                  return const SizedBox.shrink();
                                }
                                final number = sorted[idx].number;
                                // 5의 배수만 표시
                                if (number % 5 != 0 && number != 1) {
                                  return const SizedBox.shrink();
                                }
                                return Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Text(
                                    '$number',
                                    style: const TextStyle(fontSize: 10),
                                  ),
                                );
                              },
                              reservedSize: 20,
                            ),
                          ),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 36,
                              getTitlesWidget: (value, meta) {
                                return Text(
                                  '${value.toInt()}',
                                  style: const TextStyle(fontSize: 10),
                                );
                              },
                            ),
                          ),
                          topTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          rightTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                        ),
                        gridData: FlGridData(
                          show: true,
                          drawVerticalLine: false,
                          horizontalInterval: maxCount / 5,
                        ),
                        borderData: FlBorderData(show: false),
                        barGroups: sorted.asMap().entries.map((entry) {
                          final idx = entry.key;
                          final stat = entry.value;
                          return BarChartGroupData(
                            x: idx,
                            barRods: [
                              BarChartRodData(
                                toY: stat.totalCount.toDouble(),
                                color: AppColors.getBallColor(stat.number),
                                width: 5,
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(2),
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          // 상세 목록
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '상세 출현 통계',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // 출현 횟수 기준 정렬
                  ..._buildRankedList(
                    List<NumberStat>.from(stats)
                      ..sort((a, b) => b.totalCount.compareTo(a.totalCount)),
                    theme,
                    maxCount,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildRankedList(
    List<NumberStat> sorted,
    ThemeData theme,
    int maxCount,
  ) {
    return sorted.map((stat) {
      final ratio = maxCount > 0 ? stat.totalCount / maxCount : 0.0;
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            LottoBall(number: stat.number, size: 32),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${stat.totalCount}회 (보너스 ${stat.bonusCount}회)',
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: ratio,
                      minHeight: 6,
                      backgroundColor: AppColors.getBallColor(stat.number)
                          .withValues(alpha: 0.12),
                      valueColor: AlwaysStoppedAnimation(
                        AppColors.getBallColor(stat.number),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }).toList();
  }
}
