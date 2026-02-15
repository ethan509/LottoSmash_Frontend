import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../shared/widgets/error_widget.dart';
import '../../../../shared/widgets/loading_indicator.dart';
import '../../data/models/stats_models.dart';
import '../../providers/stats_provider.dart';

class GridStatsScreen extends ConsumerWidget {
  const GridStatsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsAsync = ref.watch(gridStatsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.gridStats),
      ),
      body: statsAsync.when(
        loading: () => const ShimmerList(itemCount: 3, itemHeight: 200),
        error: (error, _) => AppErrorWidget(
          message: error.toString(),
          onRetry: () => ref.invalidate(gridStatsProvider),
        ),
        data: (data) => RefreshIndicator(
          onRefresh: () async => ref.invalidate(gridStatsProvider),
          child: _GridContent(data: data),
        ),
      ),
    );
  }
}

class _GridContent extends StatelessWidget {
  final GridResponse data;

  const _GridContent({required this.data});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const TabBar(
            tabs: [
              Tab(text: '행(Row) 분포'),
              Tab(text: '열(Col) 분포'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                _GridTabContent(
                  lineStats: data.rowStats,
                  patterns: data.topRowPatterns,
                  lineLabel: '행',
                ),
                _GridTabContent(
                  lineStats: data.colStats,
                  patterns: data.topColPatterns,
                  lineLabel: '열',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _GridTabContent extends StatelessWidget {
  final List<GridLineStat> lineStats;
  final List<GridPatternStat> patterns;
  final String lineLabel;

  const _GridTabContent({
    required this.lineStats,
    required this.patterns,
    required this.lineLabel,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final maxProb = lineStats.fold<double>(
        0, (m, s) => s.probability > m ? s.probability : m);

    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 분포 차트
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$lineLabel별 번호 출현 분포',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 200,
                    child: BarChart(
                      BarChartData(
                        alignment: BarChartAlignment.spaceEvenly,
                        maxY: maxProb * 1.2,
                        barTouchData: BarTouchData(
                          touchTooltipData: BarTouchTooltipData(
                            getTooltipItem:
                                (group, groupIndex, rod, rodIndex) {
                              final stat =
                                  lineStats[group.x.toInt()];
                              return BarTooltipItem(
                                '$lineLabel ${stat.line}\n${stat.count}회 (${(stat.probability * 100).toStringAsFixed(1)}%)',
                                TextStyle(
                                  color:
                                      theme.colorScheme.onInverseSurface,
                                  fontSize: 12,
                                ),
                              );
                            },
                          ),
                        ),
                        titlesData: FlTitlesData(
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, meta) {
                                final idx = value.toInt();
                                if (idx >= lineStats.length) {
                                  return const SizedBox.shrink();
                                }
                                return Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Text(
                                    '$lineLabel${lineStats[idx].line}',
                                    style: const TextStyle(fontSize: 10),
                                  ),
                                );
                              },
                              reservedSize: 24,
                            ),
                          ),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 40,
                              getTitlesWidget: (value, meta) {
                                return Text(
                                  '${(value * 100).toStringAsFixed(0)}%',
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
                        ),
                        borderData: FlBorderData(show: false),
                        barGroups:
                            lineStats.asMap().entries.map((entry) {
                          return BarChartGroupData(
                            x: entry.key,
                            barRods: [
                              BarChartRodData(
                                toY: entry.value.probability,
                                color: theme.colorScheme.primary,
                                width: 24,
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(4),
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

          // TOP 패턴
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '자주 나오는 $lineLabel 배분 패턴',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...patterns.asMap().entries.map((entry) {
                    final idx = entry.key;
                    final pattern = entry.value;
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 24,
                            child: Text(
                              '${idx + 1}',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color:
                                    theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ),
                          // 배분 패턴 시각화
                          Expanded(
                            child: Wrap(
                              spacing: 4,
                              children: pattern.distribution
                                  .split(':')
                                  .asMap()
                                  .entries
                                  .map((dEntry) {
                                final count =
                                    int.tryParse(dEntry.value) ?? 0;
                                return Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    color: count > 0
                                        ? theme.colorScheme.primary
                                            .withValues(
                                                alpha: 0.15 +
                                                    count * 0.15)
                                        : theme.colorScheme
                                            .surfaceContainerHighest,
                                    borderRadius:
                                        BorderRadius.circular(4),
                                  ),
                                  child: Center(
                                    child: Text(
                                      dEntry.value,
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        color: count > 0
                                            ? theme.colorScheme.primary
                                            : theme.colorScheme
                                                .onSurfaceVariant,
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          Text(
                            '${pattern.count}회',
                            style: theme.textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8),
                          SizedBox(
                            width: 50,
                            child: Text(
                              '${(pattern.probability * 100).toStringAsFixed(2)}%',
                              style: theme.textTheme.bodySmall,
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
