import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../shared/widgets/error_widget.dart';
import '../../../../shared/widgets/loading_indicator.dart';
import '../../data/models/stats_models.dart';
import '../../providers/stats_provider.dart';

class ColorStatsScreen extends ConsumerWidget {
  const ColorStatsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsAsync = ref.watch(colorStatsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.colorStats),
      ),
      body: statsAsync.when(
        loading: () => const ShimmerList(itemCount: 3, itemHeight: 200),
        error: (error, _) => AppErrorWidget(
          message: error.toString(),
          onRetry: () => ref.invalidate(colorStatsProvider),
        ),
        data: (data) => RefreshIndicator(
          onRefresh: () async => ref.invalidate(colorStatsProvider),
          child: _ColorContent(data: data),
        ),
      ),
    );
  }
}

class _ColorContent extends StatelessWidget {
  final ColorStatsResponse data;

  const _ColorContent({required this.data});

  static const _colorMap = {
    'Y': ('노랑 (1-10)', AppColors.lottoYellow),
    'B': ('파랑 (11-20)', AppColors.lottoBlue),
    'R': ('빨강 (21-30)', AppColors.lottoRed),
    'G': ('회색 (31-40)', AppColors.lottoGray),
    'E': ('초록 (41-45)', AppColors.lottoGreen),
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorEntries = ['Y', 'B', 'R', 'G', 'E'];
    final maxCount = data.colorCounts.values
        .fold<int>(0, (m, c) => c > m ? c : m);

    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 색상별 출현 횟수 차트
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '색상별 출현 횟수',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '총 ${data.totalDraws}회 기준',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 200,
                    child: BarChart(
                      BarChartData(
                        alignment: BarChartAlignment.spaceEvenly,
                        maxY: maxCount * 1.15,
                        barTouchData: BarTouchData(
                          touchTooltipData: BarTouchTooltipData(
                            getTooltipItem:
                                (group, groupIndex, rod, rodIndex) {
                              final code = colorEntries[group.x.toInt()];
                              final info = _colorMap[code]!;
                              final count = data.colorCounts[code] ?? 0;
                              return BarTooltipItem(
                                '${info.$1}\n$count회',
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
                                if (idx >= colorEntries.length) {
                                  return const SizedBox.shrink();
                                }
                                final code = colorEntries[idx];
                                final info = _colorMap[code]!;
                                return Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Container(
                                    width: 16,
                                    height: 16,
                                    decoration: BoxDecoration(
                                      color: info.$2,
                                      shape: BoxShape.circle,
                                    ),
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
                        ),
                        borderData: FlBorderData(show: false),
                        barGroups:
                            colorEntries.asMap().entries.map((entry) {
                          final code = entry.value;
                          final count =
                              (data.colorCounts[code] ?? 0).toDouble();
                          final info = _colorMap[code]!;
                          return BarChartGroupData(
                            x: entry.key,
                            barRods: [
                              BarChartRodData(
                                toY: count,
                                color: info.$2,
                                width: 32,
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
                  const SizedBox(height: 12),
                  // 색상 범례
                  Wrap(
                    spacing: 16,
                    runSpacing: 8,
                    children: colorEntries.map((code) {
                      final info = _colorMap[code]!;
                      final count = data.colorCounts[code] ?? 0;
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: info.$2,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${info.$1}: $count',
                            style: theme.textTheme.labelSmall,
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // TOP 패턴 목록
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '자주 나오는 색상 패턴',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...data.topPatterns.asMap().entries.map((entry) {
                    final idx = entry.key;
                    final pattern = entry.value;
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
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
                          // 색상 패턴 시각화
                          ...pattern.pattern.split('').map((c) {
                            final info = _colorMap[c];
                            return Container(
                              width: 24,
                              height: 24,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 2),
                              decoration: BoxDecoration(
                                color: info?.$2 ?? Colors.grey,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  c,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            );
                          }),
                          const Spacer(),
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
