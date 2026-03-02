import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../shared/widgets/error_widget.dart';
import '../../../../shared/widgets/loading_indicator.dart';
import '../../data/models/stats_models.dart';
import '../../providers/stats_provider.dart';

// ── 초기하분포 이론값 ──────────────────────────────
// 45개 공에서 6개 추첨, C(45,6) = 8,145,060

/// 홀:짝 이론값 (k = 홀수 개수, 0:6 → 6:0 순)
/// P(k) = C(23,k) × C(22, 6-k) / C(45,6)
const _oddEvenTheory = [
  0.009162, // 0:6  (홀0, 짝6)
  0.074362, // 1:5
  0.227211, // 2:4
  0.334840, // 3:3  ← 피크
  0.251137, // 4:2
  0.090889, // 5:1
  0.012393, // 6:0  (홀6, 짝0)
];

/// 고:저 이론값 (k = 고수 개수, 0:6 → 6:0 순)
/// P(k) = C(22,k) × C(23, 6-k) / C(45,6)
const _highLowTheory = [
  0.012393, // 0:6  (고0, 저6)
  0.090889, // 1:5
  0.251137, // 2:4
  0.334840, // 3:3  ← 피크
  0.227211, // 4:2
  0.074362, // 5:1
  0.009162, // 6:0  (고6, 저0)
];

const _oddEvenColor = Color(0xFF1565C0); // 파란 계열
const _highLowColor = Color(0xFFC62828); // 빨간 계열

// 백테스팅 화면과 동일한 +/- 색상
const _positiveColor = Color(0xFF4CAF50); // 양의 편차
const _negativeColor = Color(0xFFF44336); // 음의 편차

/// 비율 문자열의 첫 번째 숫자 기준 오름차순 정렬
List<RatioStat> _sortByRatioOrder(List<RatioStat> stats) {
  final sorted = [...stats];
  sorted.sort((a, b) {
    final aVal = int.tryParse(a.ratio.split(':').first.trim()) ?? 0;
    final bVal = int.tryParse(b.ratio.split(':').first.trim()) ?? 0;
    return aVal.compareTo(bVal);
  });
  return sorted;
}

// ─────────────────────────────────────────────
class RatioStatsScreen extends ConsumerWidget {
  const RatioStatsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsAsync = ref.watch(ratioStatsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.ratioStats)),
      body: statsAsync.when(
        loading: () => const ShimmerList(itemCount: 3, itemHeight: 300),
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
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _RatioSection(
            title: '홀짝 비율',
            subtitle: '홀수 : 짝수  ·  총 ${data.totalDraws}회 기준',
            labelPrefix: '홀:짝',
            stats: data.oddEvenStats,
            theory: _oddEvenTheory,
            color: _oddEvenColor,
          ),
          const SizedBox(height: 16),
          _RatioSection(
            title: '고저 비율',
            subtitle: '고수(24이상) : 저수(23이하)  ·  총 ${data.totalDraws}회 기준',
            labelPrefix: '고:저',
            stats: data.highLowStats,
            theory: _highLowTheory,
            color: _highLowColor,
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
// 단일 비율 섹션 — StatefulWidget (실제/이론 토글)
// ─────────────────────────────────────────────
class _RatioSection extends StatefulWidget {
  final String title;
  final String subtitle;
  final String labelPrefix;
  final List<RatioStat> stats;
  final List<double> theory;
  final Color color;

  const _RatioSection({
    required this.title,
    required this.subtitle,
    required this.labelPrefix,
    required this.stats,
    required this.theory,
    required this.color,
  });

  @override
  State<_RatioSection> createState() => _RatioSectionState();
}

class _RatioSectionState extends State<_RatioSection> {
  bool _showActual = true;
  bool _showTheory = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // 비율 순 정렬 (0:6 → 6:0) — theory 배열과 인덱스 일치
    final ratioOrdered = _sortByRatioOrder(widget.stats);
    // 편차 테이블용: 확률 내림차순, (ratioIndex, stat) 쌍 유지
    final tableRows = ratioOrdered.asMap().entries.toList()
      ..sort((a, b) => b.value.probability.compareTo(a.value.probability));

    final maxActual = ratioOrdered.fold<double>(
        0, (m, s) => s.probability > m ? s.probability : m);
    final maxTheory =
        widget.theory.fold<double>(0, (m, v) => v > m ? v : m);
    final maxY =
        (maxActual > maxTheory ? maxActual : maxTheory) * 100 * 1.25;
    final xLabels = ratioOrdered.map((s) => s.ratio).toList();

    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── 헤더
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Text(
                widget.title,
                style: theme.textTheme.titleSmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Text(
                widget.subtitle,
                style: theme.textTheme.bodySmall
                    ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
              ),
            ),
            const SizedBox(height: 10),
            // ── 범례 (실제/이론 모두 토글 가능)
            Row(
              children: [
                const SizedBox(width: 4),
                _ToggleActualChip(
                  color: widget.color,
                  isActive: _showActual,
                  onTap: () => setState(() => _showActual = !_showActual),
                ),
                const SizedBox(width: 10),
                _ToggleTheoryChip(
                  isActive: _showTheory,
                  onTap: () => setState(() => _showTheory = !_showTheory),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // ── 차트
            SizedBox(
              height: 220,
              child: LineChart(
                LineChartData(
                  minX: 0,
                  maxX: (xLabels.length - 1).toDouble(),
                  minY: 0,
                  maxY: maxY,
                  lineBarsData: [
                    // barIndex 0 : 실제 데이터 (solid, 토글)
                    _buildActualLine(ratioOrdered, widget.color, _showActual),
                    // barIndex 1 : 이론값 (dashed, 토글)
                    _buildTheoryLine(widget.theory, _showTheory),
                  ],
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30,
                        getTitlesWidget: (value, meta) {
                          final idx = value.toInt();
                          if (idx < 0 ||
                              idx >= xLabels.length ||
                              value != idx.toDouble()) {
                            return const SizedBox.shrink();
                          }
                          return Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: Text(
                              xLabels[idx],
                              style: TextStyle(
                                fontSize: 9,
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 38,
                        getTitlesWidget: (value, meta) {
                          if (value == 0) return const SizedBox.shrink();
                          return Text(
                            '${value.toStringAsFixed(0)}%',
                            style: TextStyle(
                              fontSize: 9,
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          );
                        },
                      ),
                    ),
                    topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                    rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                  ),
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    getDrawingHorizontalLine: (value) => FlLine(
                      color: theme.dividerColor.withValues(alpha: 0.4),
                      strokeWidth: 0.8,
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  lineTouchData: LineTouchData(
                    touchTooltipData: LineTouchTooltipData(
                      getTooltipItems: (spots) {
                        return spots.map((spot) {
                          if (spot.barIndex == 0) {
                            if (!_showActual) return null;
                            final stat = ratioOrdered[spot.spotIndex];
                            return LineTooltipItem(
                              '실제: ${stat.ratio}\n',
                              TextStyle(
                                color: widget.color,
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                              ),
                              children: [
                                TextSpan(
                                  text:
                                      '${stat.count}회  ${spot.y.toStringAsFixed(3)}%',
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            );
                          } else {
                            if (!_showTheory) return null;
                            return LineTooltipItem(
                              '이론값\n',
                              TextStyle(
                                color: Colors.grey.shade300,
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                              ),
                              children: [
                                TextSpan(
                                  text: '${spot.y.toStringAsFixed(3)}%',
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            );
                          }
                        }).toList();
                      },
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Divider(height: 1),
            const SizedBox(height: 10),
            // ── 편차 테이블 헤더
            _tableHeader(theme),
            const SizedBox(height: 4),
            // ── 편차 테이블 행 (확률 내림차순)
            ...tableRows.map((entry) {
              final theoryPct = widget.theory[entry.key] * 100;
              final actualPct = entry.value.probability * 100;
              final deviation = actualPct - theoryPct;
              return _DeviationRow(
                stat: entry.value,
                actualPct: actualPct,
                theoryPct: theoryPct,
                deviation: deviation,
                color: widget.color,
                theme: theme,
              );
            }),
          ],
        ),
      ),
    );
  }

  static LineChartBarData _buildActualLine(
      List<RatioStat> sorted, Color color, bool visible) {
    return LineChartBarData(
      spots: sorted
          .asMap()
          .entries
          .map((e) => FlSpot(e.key.toDouble(), e.value.probability * 100))
          .toList(),
      isCurved: true,
      curveSmoothness: 0.35,
      preventCurveOverShooting: true,
      color: visible ? color : Colors.transparent,
      barWidth: visible ? 2.5 : 0,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: visible,
        getDotPainter: (spot, percent, bar, index) => FlDotCirclePainter(
          radius: 3.5,
          color: color,
          strokeWidth: 1.5,
          strokeColor: Colors.white,
        ),
      ),
      belowBarData: BarAreaData(
        show: visible,
        gradient: LinearGradient(
          colors: [
            color.withValues(alpha: 0.18),
            color.withValues(alpha: 0.0),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }

  static LineChartBarData _buildTheoryLine(
      List<double> theory, bool visible) {
    return LineChartBarData(
      spots: theory
          .asMap()
          .entries
          .map((e) => FlSpot(e.key.toDouble(), e.value * 100))
          .toList(),
      isCurved: true,
      curveSmoothness: 0.35,
      preventCurveOverShooting: true,
      // visible=false 시 투명 처리 (barIndex 유지를 위해 리스트에서 제거 안 함)
      color: visible
          ? Colors.grey.withValues(alpha: 0.65)
          : Colors.transparent,
      barWidth: visible ? 1.5 : 0,
      dashArray: [6, 4],
      isStrokeCapRound: true,
      dotData: FlDotData(show: false),
      belowBarData: BarAreaData(show: false),
    );
  }

  Widget _tableHeader(ThemeData theme) {
    final style = theme.textTheme.labelSmall?.copyWith(
      color: theme.colorScheme.onSurfaceVariant,
      fontWeight: FontWeight.bold,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        children: [
          SizedBox(
              width: 36,
              child: Text('비율', style: style, textAlign: TextAlign.center)),
          const SizedBox(width: 8),
          Expanded(
              child:
                  Text('실제', style: style, textAlign: TextAlign.end)),
          const SizedBox(width: 8),
          SizedBox(
              width: 64,
              child: Text('이론', style: style, textAlign: TextAlign.end)),
          const SizedBox(width: 8),
          SizedBox(
              width: 72,
              child:
                  Text('편차(%p)', style: style, textAlign: TextAlign.end)),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
// 실제 데이터 토글 칩
// ─────────────────────────────────────────────
class _ToggleActualChip extends StatelessWidget {
  final Color color;
  final bool isActive;
  final VoidCallback onTap;

  const _ToggleActualChip({
    required this.color,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final displayColor = isActive ? color : Colors.grey;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: isActive
              ? color.withValues(alpha: 0.1)
              : Colors.grey.withValues(alpha: 0.04),
          border: Border.all(
            color: isActive ? color : Colors.grey.withValues(alpha: 0.3),
            width: 1.2,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 18,
              height: 2.5,
              decoration: BoxDecoration(
                color: displayColor,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 3),
            Container(
              width: 7,
              height: 7,
              decoration:
                  BoxDecoration(color: displayColor, shape: BoxShape.circle),
            ),
            const SizedBox(width: 5),
            Text(
              '실제 데이터',
              style: TextStyle(
                fontSize: 11,
                color: displayColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (!isActive) ...[
              const SizedBox(width: 4),
              Icon(Icons.visibility_off_outlined,
                  size: 12, color: Colors.grey.withValues(alpha: 0.6)),
            ],
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// 이론값 토글 칩
// ─────────────────────────────────────────────
class _ToggleTheoryChip extends StatelessWidget {
  final bool isActive;
  final VoidCallback onTap;

  const _ToggleTheoryChip({required this.isActive, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final chipColor =
        isActive ? Colors.grey.shade600 : Colors.grey.withValues(alpha: 0.35);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: isActive
              ? Colors.grey.withValues(alpha: 0.1)
              : Colors.grey.withValues(alpha: 0.04),
          border: Border.all(
            color: isActive
                ? Colors.grey.shade500
                : Colors.grey.withValues(alpha: 0.3),
            width: 1.2,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 점선 아이콘
            Row(
              children: [
                Container(width: 4, height: 2, color: chipColor),
                const SizedBox(width: 2),
                Container(width: 4, height: 2, color: chipColor),
                const SizedBox(width: 2),
                Container(width: 4, height: 2, color: chipColor),
              ],
            ),
            const SizedBox(width: 5),
            Text(
              '이론값 기준선',
              style: TextStyle(
                fontSize: 11,
                color: chipColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (!isActive) ...[
              const SizedBox(width: 4),
              Icon(Icons.visibility_off_outlined,
                  size: 12,
                  color: Colors.grey.withValues(alpha: 0.5)),
            ],
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// 편차 테이블 행
// ─────────────────────────────────────────────
class _DeviationRow extends StatelessWidget {
  final RatioStat stat;
  final double actualPct;
  final double theoryPct;
  final double deviation;
  final Color color;
  final ThemeData theme;

  const _DeviationRow({
    required this.stat,
    required this.actualPct,
    required this.theoryPct,
    required this.deviation,
    required this.color,
    required this.theme,
  });

  /// 백테스팅 화면과 동일한 색상 규칙
  Color _deviationColor() {
    if (deviation.abs() < 0.001) return theme.colorScheme.onSurfaceVariant;
    return deviation > 0 ? _positiveColor : _negativeColor;
  }

  @override
  Widget build(BuildContext context) {
    final devColor = _deviationColor();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 4),
      child: Row(
        children: [
          // 비율 배지
          Container(
            width: 36,
            padding: const EdgeInsets.symmetric(vertical: 2),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              stat.ratio,
              style: theme.textTheme.bodySmall
                  ?.copyWith(color: color, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(width: 8),
          // 실제값
          Expanded(
            child: Text(
              '${stat.count}회  ${actualPct.toStringAsFixed(3)}%',
              style: theme.textTheme.bodySmall
                  ?.copyWith(fontWeight: FontWeight.w500),
              textAlign: TextAlign.end,
            ),
          ),
          const SizedBox(width: 8),
          // 이론값
          SizedBox(
            width: 64,
            child: Text(
              '${theoryPct.toStringAsFixed(3)}%',
              style: theme.textTheme.bodySmall
                  ?.copyWith(color: Colors.grey.shade600),
              textAlign: TextAlign.end,
            ),
          ),
          const SizedBox(width: 8),
          // 편차 (+green / -red, 백테스팅 동일)
          SizedBox(
            width: 72,
            child: Text(
              '${deviation >= 0 ? '+' : ''}${deviation.toStringAsFixed(3)}%p',
              style: theme.textTheme.bodySmall?.copyWith(
                color: devColor,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
