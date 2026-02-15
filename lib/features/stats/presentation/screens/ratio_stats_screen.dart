import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../shared/widgets/error_widget.dart';
import '../../../../shared/widgets/loading_indicator.dart';
import '../../data/models/stats_models.dart';
import '../../providers/stats_provider.dart';

class RatioStatsScreen extends ConsumerWidget {
  const RatioStatsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsAsync = ref.watch(ratioStatsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.ratioStats),
      ),
      body: statsAsync.when(
        loading: () => const ShimmerList(itemCount: 3, itemHeight: 200),
        error: (error, _) => AppErrorWidget(
          message: error.toString(),
          onRetry: () => ref.invalidate(ratioStatsProvider),
        ),
        data: (data) => RefreshIndicator(
          onRefresh: () async => ref.invalidate(ratioStatsProvider),
          child: _RatioContent(data: data),
        ),
      ),
    );
  }
}

class _RatioContent extends StatelessWidget {
  final RatioResponse data;

  const _RatioContent({required this.data});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // 홀짝 비율
          _RatioSection(
            title: '홀짝 비율',
            subtitle: '총 ${data.totalDraws}회 기준',
            stats: data.oddEvenStats,
            colors: _oddEvenColors,
            labelPrefix: '홀:짝',
            theme: theme,
          ),
          const SizedBox(height: 16),
          // 고저 비율
          _RatioSection(
            title: '고저 비율',
            subtitle: '기준: 23 이하 저, 24 이상 고',
            stats: data.highLowStats,
            colors: _highLowColors,
            labelPrefix: '고:저',
            theme: theme,
          ),
        ],
      ),
    );
  }

  static const _oddEvenColors = [
    Color(0xFF6750A4),
    Color(0xFF7B61BD),
    Color(0xFF9C88D5),
    Color(0xFFBDA8EC),
    Color(0xFFD8C6F7),
    Color(0xFFEDE3FF),
    Color(0xFFF5EEFF),
  ];

  static const _highLowColors = [
    Color(0xFF00796B),
    Color(0xFF26A69A),
    Color(0xFF4DB6AC),
    Color(0xFF80CBC4),
    Color(0xFFB2DFDB),
    Color(0xFFE0F2F1),
    Color(0xFFF0FAF8),
  ];
}

class _RatioSection extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<RatioStat> stats;
  final List<Color> colors;
  final String labelPrefix;
  final ThemeData theme;

  const _RatioSection({
    required this.title,
    required this.subtitle,
    required this.stats,
    required this.colors,
    required this.labelPrefix,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 16),
            // 파이 차트
            SizedBox(
              height: 200,
              child: PieChart(
                PieChartData(
                  sectionsSpace: 2,
                  centerSpaceRadius: 40,
                  sections: stats.asMap().entries.map((entry) {
                    final idx = entry.key;
                    final stat = entry.value;
                    return PieChartSectionData(
                      value: stat.probability * 100,
                      title:
                          '${(stat.probability * 100).toStringAsFixed(1)}%',
                      color: colors[idx % colors.length],
                      radius: 60,
                      titleStyle: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // 범례 + 상세
            ...stats.asMap().entries.map((entry) {
              final idx = entry.key;
              final stat = entry.value;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: colors[idx % colors.length],
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '$labelPrefix = ${stat.ratio}',
                      style: theme.textTheme.bodySmall,
                    ),
                    const Spacer(),
                    Text(
                      '${stat.count}회',
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    SizedBox(
                      width: 50,
                      child: Text(
                        '${(stat.probability * 100).toStringAsFixed(1)}%',
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
    );
  }
}
