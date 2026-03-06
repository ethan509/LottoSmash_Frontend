import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../shared/widgets/error_widget.dart';
import '../../../../shared/widgets/loading_indicator.dart';
import '../../../draws/data/models/draw_models.dart';
import '../../../draws/data/repositories/draw_repository.dart';
import '../../data/models/stats_models.dart';
import '../../providers/stats_provider.dart';

final _patternDrawsProvider = FutureProvider<List<LottoDraw>>((ref) async {
  final repo = ref.watch(drawRepositoryProvider);
  final response = await repo.getDraws(limit: 100, offset: 0);
  return response.draws;
});

class GridStatsScreen extends ConsumerWidget {
  const GridStatsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsAsync = ref.watch(gridStatsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.gridStats)),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            const TabBar(
              tabs: [
                Tab(text: '행(Row) 분포'),
                Tab(text: '열(Col) 분포'),
                Tab(text: '패턴 보기'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // 기존 행 분포
                  statsAsync.when(
                    loading: () =>
                        const ShimmerList(itemCount: 2, itemHeight: 200),
                    error: (e, _) => AppErrorWidget(
                      message: e.toString(),
                      onRetry: () => ref.invalidate(gridStatsProvider),
                    ),
                    data: (data) => _GridTabContent(
                      lineStats: data.rowStats,
                      patterns: data.topRowPatterns,
                      lineLabel: '행',
                    ),
                  ),
                  // 기존 열 분포
                  statsAsync.when(
                    loading: () =>
                        const ShimmerList(itemCount: 2, itemHeight: 200),
                    error: (e, _) => AppErrorWidget(
                      message: e.toString(),
                      onRetry: () => ref.invalidate(gridStatsProvider),
                    ),
                    data: (data) => _GridTabContent(
                      lineStats: data.colStats,
                      patterns: data.topColPatterns,
                      lineLabel: '열',
                    ),
                  ),
                  // 새 패턴 시각화 탭
                  const _PatternGridTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// 행/열 분포 탭
// ─────────────────────────────────────────────

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
    final maxProb =
        lineStats.fold<double>(0, (m, s) => s.probability > m ? s.probability : m);

    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── 히트맵 그리드 (새 추가) ──
          _DistributionHeatmap(
            lineStats: lineStats,
            lineLabel: lineLabel,
            isRow: lineLabel == '행',
          ),
          const SizedBox(height: 16),

          // ── 기존 바차트 ──
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$lineLabel별 번호 출현 분포',
                    style: theme.textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
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
                            getTooltipItem: (group, groupIndex, rod, rodIndex) {
                              final stat = lineStats[group.x.toInt()];
                              return BarTooltipItem(
                                '$lineLabel ${stat.line}\n${stat.count}회 (${(stat.probability * 100).toStringAsFixed(1)}%)',
                                TextStyle(
                                  color: theme.colorScheme.onInverseSurface,
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
                              getTitlesWidget: (value, meta) => Text(
                                '${(value * 100).toStringAsFixed(0)}%',
                                style: const TextStyle(fontSize: 10),
                              ),
                            ),
                          ),
                          topTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false)),
                          rightTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false)),
                        ),
                        gridData: FlGridData(show: true, drawVerticalLine: false),
                        borderData: FlBorderData(show: false),
                        barGroups: lineStats.asMap().entries.map((entry) {
                          return BarChartGroupData(
                            x: entry.key,
                            barRods: [
                              BarChartRodData(
                                toY: entry.value.probability,
                                color: theme.colorScheme.primary,
                                width: 24,
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(4)),
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
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '자주 나오는 $lineLabel 배분 패턴',
                    style: theme.textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
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
                                  color: theme.colorScheme.onSurfaceVariant),
                            ),
                          ),
                          Expanded(
                            child: Wrap(
                              spacing: 4,
                              children: pattern.distribution
                                  .split(':')
                                  .asMap()
                                  .entries
                                  .map((dEntry) {
                                final count = int.tryParse(dEntry.value) ?? 0;
                                return Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    color: count > 0
                                        ? theme.colorScheme.primary
                                            .withValues(
                                                alpha: 0.15 + count * 0.15)
                                        : theme.colorScheme
                                            .surfaceContainerHighest,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Center(
                                    child: Text(
                                      dEntry.value,
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        color: count > 0
                                            ? theme.colorScheme.primary
                                            : theme.colorScheme.onSurfaceVariant,
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          Text(
                            '${pattern.count}회',
                            style: theme.textTheme.bodySmall
                                ?.copyWith(fontWeight: FontWeight.bold),
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

// ─────────────────────────────────────────────
// 히트맵 그리드 위젯
// ─────────────────────────────────────────────

class _DistributionHeatmap extends StatelessWidget {
  final List<GridLineStat> lineStats;
  final String lineLabel;
  final bool isRow;

  const _DistributionHeatmap({
    required this.lineStats,
    required this.lineLabel,
    required this.isRow,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // line → probability 맵 (line은 1-based)
    final probMap = {for (final s in lineStats) s.line: s.probability};
    final probs = probMap.values.toList();
    final mean = probs.isEmpty
        ? 0.0
        : probs.reduce((a, b) => a + b) / probs.length;

    // 평균과의 편차를 기준으로 정규화 (-1.0 ~ +1.0)
    // 값이 좁은 범위에 몰려있어도 차이가 명확히 보이도록
    final maxDev = probs
        .map((v) => (v - mean).abs())
        .fold<double>(0, (m, v) => v > m ? v : m);

    // 반환값: 0.0 (평균 이하 최대) ~ 0.5 (평균) ~ 1.0 (평균 이상 최대)
    double intensity(int lineIdx) {
      final p = probMap[lineIdx] ?? mean;
      if (maxDev == 0) return 0.5;
      return ((p - mean) / maxDev) * 0.5 + 0.5;
    }

    // 분기형 색상: 파랑(평균 이하) ↔ 중립(평균) ↔ 빨강(평균 이상)
    // t: 0.0=가장 차가움, 0.5=평균, 1.0=가장 뜨거움
    Color cellColor(double t) {
      final neutral = colorScheme.surfaceContainerHigh;
      if (t < 0.5) {
        return Color.lerp(
          const Color(0xFF1565C0).withValues(alpha: 0.75), // 진한 파랑
          neutral,
          t * 2, // 0→0=파랑, 0.5→1=중립
        )!;
      } else {
        return Color.lerp(
          neutral,
          colorScheme.error.withValues(alpha: 0.85), // 빨강
          (t - 0.5) * 2, // 0.5→0=중립, 1.0→1=빨강
        )!;
      }
    }

    Color textColor(double t) {
      if (t < 0.2 || t > 0.8) return Colors.white;
      return colorScheme.onSurfaceVariant;
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '$lineLabel별 확률 히트맵',
                  style: theme.textTheme.titleSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '색이 진할수록 출현 빈도 높음',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),

            // 그리드 + 우측 라벨
            LayoutBuilder(builder: (context, constraints) {
              // 행 탭일 때만 우측 라벨 공간 예약
              final labelW = isRow ? 52.0 : 0.0;
              final gridW = isRow
                  ? constraints.maxWidth - labelW - 8
                  : constraints.maxWidth;
              final cellW = gridW / 7;
              const cellH = 36.0;
              const rows = 7;

              return Column(
                children: List.generate(rows, (rowIdx) {
                  final lineIdx = rowIdx + 1; // 행은 rowIdx+1
                  final stat = lineStats.firstWhere(
                    (s) => s.line == lineIdx,
                    orElse: () => GridLineStat(
                        line: lineIdx, count: 0, probability: 0),
                  );

                  return SizedBox(
                    height: cellH,
                    child: Row(
                      children: [
                        // 7개 셀
                        ...List.generate(7, (colIdx) {
                          final num = rowIdx * 7 + colIdx + 1;
                          if (num > 45) {
                            return SizedBox(width: cellW);
                          }

                          // 행 탭: 행 인덱스 기준 / 열 탭: 열 인덱스(colIdx+1) 기준
                          final t = isRow
                              ? intensity(rowIdx + 1)
                              : intensity(colIdx + 1);
                          final bg = cellColor(t);
                          final fg = textColor(t);

                          return SizedBox(
                            width: cellW,
                            height: cellH,
                            child: Padding(
                              padding: const EdgeInsets.all(1.5),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: bg,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Text(
                                    '$num',
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: t > 0.55
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                      color: fg,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),

                        if (isRow) const SizedBox(width: 8),

                        // 우측 라벨 (행 탭에서만 의미있는 값)
                        SizedBox(
                          width: labelW,
                          child: isRow
                              ? Row(
                                  children: [
                                    // 강도 바
                                    Container(
                                      width: 4,
                                      height: cellH * 0.65,
                                      decoration: BoxDecoration(
                                        color: cellColor(intensity(lineIdx)),
                                        borderRadius:
                                            BorderRadius.circular(2),
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '행$lineIdx',
                                            style: theme.textTheme.labelSmall
                                                ?.copyWith(
                                              color: colorScheme
                                                  .onSurfaceVariant,
                                              fontSize: 9,
                                            ),
                                          ),
                                          Text(
                                            '${(stat.probability * 100).toStringAsFixed(1)}%',
                                            style: theme.textTheme.labelSmall
                                                ?.copyWith(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              : const SizedBox.shrink(),
                        ),
                      ],
                    ),
                  );
                }),
              );
            }),

            // 열 탭일 때: 하단에 열 라벨 표시
            if (!isRow) ...[
              const SizedBox(height: 8),
              LayoutBuilder(builder: (context, constraints) {
                final cellW = constraints.maxWidth / 7;
                return Row(
                  children: List.generate(7, (colIdx) {
                    final lineIdx = colIdx + 1;
                    final stat = lineStats.firstWhere(
                      (s) => s.line == lineIdx,
                      orElse: () => GridLineStat(
                          line: lineIdx, count: 0, probability: 0),
                    );
                    final t = intensity(lineIdx);
                    return SizedBox(
                      width: cellW,
                      child: Column(
                        children: [
                          Container(
                            width: 4,
                            height: 12,
                            decoration: BoxDecoration(
                              color: cellColor(t),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            '${(stat.probability * 100).toStringAsFixed(1)}%',
                            style: theme.textTheme.labelSmall?.copyWith(
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  }),
                );
              }),
            ],

            // 범례 (분기형)
            const SizedBox(height: 12),
            Row(
              children: [
                Text(
                  '평균 이하',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: const Color(0xFF1565C0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(3),
                    child: SizedBox(
                      height: 8,
                      child: CustomPaint(
                        painter: _DivergingLegendPainter(
                          cold: const Color(0xFF1565C0),
                          neutral: colorScheme.surfaceContainerHigh,
                          hot: colorScheme.error,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  '평균 이상',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colorScheme.error,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _DivergingLegendPainter extends CustomPainter {
  final Color cold;
  final Color neutral;
  final Color hot;
  const _DivergingLegendPainter(
      {required this.cold, required this.neutral, required this.hot});

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final paint = Paint()
      ..shader = LinearGradient(
        colors: [cold, neutral, hot],
        stops: const [0.0, 0.5, 1.0],
      ).createShader(rect);
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(_DivergingLegendPainter old) =>
      old.cold != cold || old.neutral != neutral || old.hot != hot;
}

// ─────────────────────────────────────────────
// 패턴 시각화 탭
// ─────────────────────────────────────────────

class _PatternGridTab extends ConsumerWidget {
  const _PatternGridTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final drawsAsync = ref.watch(_patternDrawsProvider);

    return drawsAsync.when(
      loading: () => const ShimmerList(itemCount: 4, itemHeight: 260),
      error: (e, _) => AppErrorWidget(
        message: e.toString(),
        onRetry: () => ref.invalidate(_patternDrawsProvider),
      ),
      data: (draws) => _PatternGridList(draws: draws),
    );
  }
}

class _PatternGridList extends StatelessWidget {
  final List<LottoDraw> draws;
  const _PatternGridList({required this.draws});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        // 안내 텍스트
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 4),
          child: Row(
            children: [
              Icon(Icons.info_outline,
                  size: 14, color: theme.colorScheme.onSurfaceVariant),
              const SizedBox(width: 6),
              Text(
                '당첨번호의 그리드 위치와 연결 패턴을 확인하세요',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
            itemCount: draws.length,
            itemBuilder: (context, idx) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _PatternCard(draw: draws[idx]),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _PatternCard extends StatelessWidget {
  final LottoDraw draw;
  const _PatternCard({required this.draw});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final sortedNums = [...draw.numbers]..sort();

    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: colorScheme.outlineVariant.withValues(alpha: 0.6),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 헤더
          Container(
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer.withValues(alpha: 0.5),
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            child: Row(
              children: [
                Text(
                  '${draw.drawNo}회',
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onPrimaryContainer,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  draw.drawDate,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                const Spacer(),
                // 보너스 표시
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                  decoration: BoxDecoration(
                    color: colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '+${draw.bonusNum}',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: colorScheme.onSecondaryContainer,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // 번호 연결 그리드
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 8, 10, 6),
            child: _MiniPatternGrid(
              sortedNumbers: sortedNums,
              bonusNum: draw.bonusNum,
            ),
          ),

          // 하단: 당첨번호 색상별 표시
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 0, 14, 10),
            child: Row(
              children: [
                ...sortedNums.map((n) => _ColorDot(number: n)),
                const SizedBox(width: 6),
                Text('+', style: theme.textTheme.bodySmall),
                const SizedBox(width: 4),
                _ColorDot(number: draw.bonusNum, isBonus: true),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ColorDot extends StatelessWidget {
  final int number;
  final bool isBonus;
  const _ColorDot({required this.number, this.isBonus = false});

  @override
  Widget build(BuildContext context) {
    final color = AppColors.getBallColor(number);
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: Container(
        width: 22,
        height: 22,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: isBonus
              ? Border.all(
                  color: Theme.of(context).colorScheme.primary, width: 1.5)
              : null,
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.4),
              blurRadius: 3,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Center(
          child: Text(
            '$number',
            style: const TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class _MiniPatternGrid extends StatelessWidget {
  final List<int> sortedNumbers;
  final int bonusNum;

  const _MiniPatternGrid({
    required this.sortedNumbers,
    required this.bonusNum,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final winSet = sortedNumbers.toSet();

    return LayoutBuilder(builder: (context, constraints) {
      final cellW = constraints.maxWidth / 7;
      const cellH = 32.0;
      const rows = 7;

      return SizedBox(
        height: cellH * rows,
        child: Stack(
          children: [
            // 셀 그리드
            Column(
              children: List.generate(rows, (rowIdx) {
                return SizedBox(
                  height: cellH,
                  child: Row(
                    children: List.generate(7, (colIdx) {
                      final num = rowIdx * 7 + colIdx + 1;
                      if (num > 45) return SizedBox(width: cellW);

                      final isWinner = winSet.contains(num);
                      return SizedBox(
                        width: cellW,
                        height: cellH,
                        child: Center(
                          child: isWinner
                              ? _GridWinnerDot(number: num)
                              : _GridNormalDot(
                                  number: num, colorScheme: colorScheme),
                        ),
                      );
                    }),
                  ),
                );
              }),
            ),

            // 연결선 (당첨번호 사이)
            Positioned.fill(
              child: CustomPaint(
                painter: _PatternLinePainter(
                  numbers: sortedNumbers,
                  cellW: cellW,
                  cellH: cellH,
                  lineColor: colorScheme.primary.withValues(alpha: 0.55),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

class _GridWinnerDot extends StatelessWidget {
  final int number;
  const _GridWinnerDot({required this.number});

  @override
  Widget build(BuildContext context) {
    final color = AppColors.getBallColor(number);
    return Container(
      width: 26,
      height: 26,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.5),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Center(
        child: Text(
          '$number',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 9,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _GridNormalDot extends StatelessWidget {
  final int number;
  final ColorScheme colorScheme;
  const _GridNormalDot({required this.number, required this.colorScheme});

  @override
  Widget build(BuildContext context) {
    return Text(
      '$number',
      style: TextStyle(
        fontSize: 10,
        color: colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
      ),
    );
  }
}

class _PatternLinePainter extends CustomPainter {
  final List<int> numbers;
  final double cellW;
  final double cellH;
  final Color lineColor;

  const _PatternLinePainter({
    required this.numbers,
    required this.cellW,
    required this.cellH,
    required this.lineColor,
  });

  Offset _center(int num) {
    final row = (num - 1) ~/ 7;
    final col = (num - 1) % 7;
    return Offset(col * cellW + cellW / 2, row * cellH + cellH / 2);
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (numbers.length < 2) return;
    final paint = Paint()
      ..color = lineColor
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    for (int i = 0; i < numbers.length - 1; i++) {
      canvas.drawLine(_center(numbers[i]), _center(numbers[i + 1]), paint);
    }
  }

  @override
  bool shouldRepaint(_PatternLinePainter old) =>
      old.numbers != numbers ||
      old.cellW != cellW ||
      old.cellH != cellH ||
      old.lineColor != lineColor;
}
