import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../shared/widgets/error_widget.dart';
import '../../../../shared/widgets/loading_indicator.dart';
import '../../../../shared/widgets/lotto_ball.dart';
import '../../data/models/stats_models.dart';
import '../../providers/stats_provider.dart';

class FirstLastPositionScreen extends ConsumerStatefulWidget {
  const FirstLastPositionScreen({super.key});

  @override
  ConsumerState<FirstLastPositionScreen> createState() =>
      _FirstLastPositionScreenState();
}

class _FirstLastPositionScreenState
    extends ConsumerState<FirstLastPositionScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final statsAsync = ref.watch(firstLastStatsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('위치 분포 통계'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: '첫 번째 자리'),
            Tab(text: '마지막 자리'),
          ],
        ),
      ),
      body: statsAsync.when(
        loading: () => const ShimmerList(itemCount: 3, itemHeight: 200),
        error: (error, _) => AppErrorWidget(
          message: error.toString(),
          onRetry: () => ref.invalidate(firstLastStatsProvider),
        ),
        data: (data) => RefreshIndicator(
          onRefresh: () async => ref.invalidate(firstLastStatsProvider),
          child: TabBarView(
            controller: _tabController,
            children: [
              _PositionContent(
                stats: data.firstStats,
                totalDraws: data.totalDraws,
                label: '첫 번째',
                description: '6개 번호 중 가장 작은 번호 자리에 자주 등장하는 번호예요.',
              ),
              _PositionContent(
                stats: data.lastStats,
                totalDraws: data.totalDraws,
                label: '마지막',
                description: '6개 번호 중 가장 큰 번호 자리에 자주 등장하는 번호예요.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PositionContent extends StatelessWidget {
  final List<FirstLastStat> stats;
  final int totalDraws;
  final String label;
  final String description;

  const _PositionContent({
    required this.stats,
    required this.totalDraws,
    required this.label,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // 번호 오름차순 정렬 (차트용)
    final byNumber = List<FirstLastStat>.from(stats)
      ..sort((a, b) => a.number.compareTo(b.number));

    // 확률 내림차순 정렬 (목록용)
    final byProb = List<FirstLastStat>.from(stats)
      ..sort((a, b) => b.probability.compareTo(a.probability));

    final maxProb =
        byNumber.fold<double>(0, (m, s) => s.probability > m ? s.probability : m);

    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 설명 카드
          Card(
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    size: 18,
                    color: theme.colorScheme.primary,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      description,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),

          // 차트
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$label 자리 확률 분포 (번호 순)',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '총 $totalDraws회차 기준',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 220,
                    child: BarChart(
                      BarChartData(
                        alignment: BarChartAlignment.spaceAround,
                        maxY: maxProb * 1.15,
                        barTouchData: BarTouchData(
                          touchTooltipData: BarTouchTooltipData(
                            getTooltipItem: (group, groupIndex, rod, rodIndex) {
                              final stat = byNumber[group.x.toInt()];
                              final pct =
                                  (stat.probability * 100).toStringAsFixed(2);
                              return BarTooltipItem(
                                '${stat.number}번\n${stat.count}회 ($pct%)',
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
                                if (idx >= byNumber.length) {
                                  return const SizedBox.shrink();
                                }
                                final number = byNumber[idx].number;
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
                              reservedSize: 42,
                              getTitlesWidget: (value, meta) {
                                return Text(
                                  '${(value * 100).toStringAsFixed(1)}%',
                                  style: const TextStyle(fontSize: 9),
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
                          horizontalInterval: maxProb / 4,
                        ),
                        borderData: FlBorderData(show: false),
                        barGroups: byNumber.asMap().entries.map((entry) {
                          final stat = entry.value;
                          return BarChartGroupData(
                            x: entry.key,
                            barRods: [
                              BarChartRodData(
                                toY: stat.probability,
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

          // Top 10 랭킹
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Top 10 — $label 자리 자주 등장하는 번호',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...byProb.take(10).toList().asMap().entries.map((entry) {
                    final rank = entry.key + 1;
                    final stat = entry.value;
                    final ratio = maxProb > 0 ? stat.probability / maxProb : 0.0;
                    final pct = (stat.probability * 100).toStringAsFixed(2);
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 24,
                            child: Text(
                              '$rank',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: rank <= 3
                                    ? theme.colorScheme.primary
                                    : theme.colorScheme.onSurfaceVariant,
                                fontWeight: rank <= 3
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(width: 8),
                          LottoBall(number: stat.number, size: 32),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${stat.count}회',
                                      style: theme.textTheme.bodySmall,
                                    ),
                                    Text(
                                      '$pct%',
                                      style: theme.textTheme.bodySmall
                                          ?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.getBallColor(
                                            stat.number),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 3),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: LinearProgressIndicator(
                                    value: ratio,
                                    minHeight: 6,
                                    backgroundColor: AppColors.getBallColor(
                                            stat.number)
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
                  }),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // 전체 목록
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '전체 번호 목록',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...byProb.map((stat) {
                    final ratio =
                        maxProb > 0 ? stat.probability / maxProb : 0.0;
                    final pct = (stat.probability * 100).toStringAsFixed(2);
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        children: [
                          LottoBall(number: stat.number, size: 30),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${stat.count}회',
                                      style: theme.textTheme.bodySmall,
                                    ),
                                    Text(
                                      '$pct%',
                                      style: theme.textTheme.bodySmall
                                          ?.copyWith(
                                        color: AppColors.getBallColor(
                                            stat.number),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 2),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: LinearProgressIndicator(
                                    value: ratio,
                                    minHeight: 5,
                                    backgroundColor: AppColors.getBallColor(
                                            stat.number)
                                        .withValues(alpha: 0.1),
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
