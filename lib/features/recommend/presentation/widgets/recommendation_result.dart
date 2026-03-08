import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../shared/widgets/lotto_ball.dart';
import '../../data/models/recommend_models.dart';

const _setLabels = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J'];

class RecommendationResult extends StatefulWidget {
  final RecommendResponse response;
  final List<int> fixedNumbers;

  const RecommendationResult({
    super.key,
    required this.response,
    this.fixedNumbers = const [],
  });

  @override
  State<RecommendationResult> createState() => _RecommendationResultState();
}

class _RecommendationResultState extends State<RecommendationResult> {
  bool _showDetails = false;

  @override
  Widget build(BuildContext context) {
    final recs = widget.response.recommendations;
    final avgConfidence =
        recs.fold(0.0, (s, r) => s + r.confidence) / recs.length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // 컴팩트 카드 (캡처용)
        _buildCompactCard(recs, avgConfidence),

        // 패턴 보기 아코디언
        const SizedBox(height: 8),
        _PatternAccordion(recommendations: recs),

        // 상세 분석 (접힌 상태)
        if (_showDetails) ...[
          const SizedBox(height: 8),
          ...recs.asMap().entries.map((entry) => _DetailCard(
                index: entry.key,
                recommendation: entry.value,
              )),
        ],
      ],
    );
  }

  Widget _buildCompactCard(List<Recommendation> recs, double avgConfidence) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final methods = recs.isNotEmpty ? recs.first.methodsUsed.join(' + ') : '';
    final combineLabel = recs.isNotEmpty
        ? _combineLabel(recs.first.combineMethod)
        : '';

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 헤더
            Row(
              children: [
                Icon(Icons.auto_awesome_rounded,
                    size: 18, color: colorScheme.primary),
                const SizedBox(width: 6),
                Text(
                  '추천 번호',
                  style: theme.textTheme.titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  '기준 ${widget.response.latestDrawNo ?? '-'}회',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            if (methods.isNotEmpty) ...[
              const SizedBox(height: 2),
              Text(
                combineLabel.isNotEmpty ? '$methods  /  $combineLabel' : methods,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
            if (widget.fixedNumbers.isNotEmpty) ...[
              const SizedBox(height: 6),
              Row(
                children: [
                  Icon(
                    Icons.push_pin_rounded,
                    size: 13,
                    color: colorScheme.primary,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '고정 번호: ',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  ...widget.fixedNumbers.map((n) => Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: AppColors.getBallColor(n),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              '$n',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 9,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )),
                ],
              ),
            ],

            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Divider(height: 1),
            ),

            // 세트 목록
            ...recs.asMap().entries.map(
                  (entry) => _SetRow(
                    label: _setLabels[entry.key % _setLabels.length],
                    recommendation: entry.value,
                  ),
                ),

            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Divider(height: 1),
            ),

            // 하단: 신뢰도 + 상세 토글
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '평균 신뢰도 ${(avgConfidence * 100).toStringAsFixed(1)}%',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: _confidenceColor(avgConfidence),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (widget.fixedNumbers.isNotEmpty)
                      Text(
                        '고정 번호 제외 나머지 번호 기준',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                  ],
                ),
                const Spacer(),
                TextButton(
                  onPressed: () =>
                      setState(() => _showDetails = !_showDetails),
                  style: TextButton.styleFrom(
                    visualDensity: VisualDensity.compact,
                    padding: EdgeInsets.zero,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        _showDetails ? '상세 접기' : '방법별 상세',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.primary,
                        ),
                      ),
                      const SizedBox(width: 2),
                      Icon(
                        _showDetails
                            ? Icons.keyboard_arrow_up_rounded
                            : Icons.keyboard_arrow_down_rounded,
                        size: 16,
                        color: colorScheme.primary,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _combineLabel(String code) {
    switch (code) {
      case 'SIMPLE_AVG':
        return '단순 평균';
      case 'WEIGHTED_AVG':
        return '가중 평균';
      case 'BAYESIAN_COMBINE':
        return '베이지안 결합';
      case 'GEOMETRIC_MEAN':
        return '기하 평균';
      case 'MIN_MAX':
        return '최대/최소';
      default:
        return code;
    }
  }
}

// ────────────────────────────────────────────
// 세트 한 줄 (A  [공][공][공][공][공][공]  ●72%)
// ────────────────────────────────────────────

class _SetRow extends StatelessWidget {
  final String label;
  final Recommendation recommendation;

  const _SetRow({required this.label, required this.recommendation});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          // 세트 레이블 (A, B, C …)
          SizedBox(
            width: 20,
            child: Text(
              label,
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
            ),
          ),
          const SizedBox(width: 8),

          // 로또 공들 (화면 너비에 꽉 차도록)
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final ballCount = recommendation.numbers.length +
                    (recommendation.bonus != null ? 1 : 0);
                // '+' 기호 너비 약 16, 간격 포함
                final extraWidth =
                    recommendation.bonus != null ? 20.0 : 0.0;
                final totalSpacing =
                    (ballCount - 1) * 5.0 + extraWidth;
                final ballSize =
                    ((constraints.maxWidth - totalSpacing) / ballCount)
                        .clamp(28.0, 44.0);

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...recommendation.numbers.map((n) =>
                        LottoBall(number: n, size: ballSize)),
                    if (recommendation.bonus != null) ...[
                      Text(
                        '+',
                        style: TextStyle(
                          fontSize: ballSize * 0.35,
                          fontWeight: FontWeight.bold,
                          color:
                              theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      LottoBall(
                        number: recommendation.bonus!,
                        size: ballSize,
                        isBonus: true,
                      ),
                    ],
                  ],
                );
              },
            ),
          ),

          const SizedBox(width: 10),

          // 신뢰도 도트 + 퍼센트
          _ConfidenceBadge(confidence: recommendation.confidence),
        ],
      ),
    );
  }
}

class _ConfidenceBadge extends StatelessWidget {
  final double confidence;

  const _ConfidenceBadge({required this.confidence});

  @override
  Widget build(BuildContext context) {
    final color = _confidenceColor(confidence);
    final pct = (confidence * 100).toStringAsFixed(0);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 7,
          height: 7,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 3),
        Text(
          '$pct%',
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: color,
          ),
        ),
      ],
    );
  }
}

Color _confidenceColor(double c) {
  if (c >= 0.7) return Colors.green;
  if (c >= 0.4) return Colors.orange;
  return Colors.red;
}

// ────────────────────────────────────────────
// 패턴 보기 아코디언
// ────────────────────────────────────────────

class _PatternAccordion extends StatelessWidget {
  final List<Recommendation> recommendations;
  const _PatternAccordion({required this.recommendations});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: colorScheme.outlineVariant.withValues(alpha: 0.5),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Theme(
          data: theme.copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            tilePadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
            childrenPadding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            backgroundColor: Colors.transparent,
            collapsedBackgroundColor: Colors.transparent,
            shape: const RoundedRectangleBorder(),
            collapsedShape: const RoundedRectangleBorder(),
            iconColor: colorScheme.primary,
            collapsedIconColor: colorScheme.onSurfaceVariant,
            leading: Icon(
              Icons.grid_view_rounded,
              size: 20,
              color: colorScheme.primary,
            ),
            title: Text(
              '패턴 보기',
              style: theme.textTheme.bodyLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              '1-45 격자에서 번호 위치 및 연결 패턴',
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            children: [
              Divider(
                height: 1,
                color: colorScheme.outlineVariant.withValues(alpha: 0.4),
              ),
              const SizedBox(height: 10),
              // 세트가 여럿이면 세로로 쌓음
              ...recommendations.asMap().entries.map((entry) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: _RecommendSetGrid(
                    label: _setLabels[entry.key % _setLabels.length],
                    recommendation: entry.value,
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

// ────────────────────────────────────────────
// 세트 1개의 패턴 그리드
// ────────────────────────────────────────────

class _RecommendSetGrid extends StatelessWidget {
  final String label;
  final Recommendation recommendation;

  const _RecommendSetGrid({
    required this.label,
    required this.recommendation,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final sortedNums = [...recommendation.numbers]..sort();
    final winSet = sortedNums.toSet();

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.4),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 세트 헤더
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 8, 10, 6),
            child: Row(
              children: [
                Container(
                  width: 22,
                  height: 22,
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      label,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: colorScheme.onPrimaryContainer,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                // 번호 컬러 도트 요약
                ...sortedNums.map((n) => Padding(
                      padding: const EdgeInsets.only(right: 3),
                      child: Container(
                        width: 18,
                        height: 18,
                        decoration: BoxDecoration(
                          color: AppColors.getBallColor(n),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color:
                                  AppColors.getBallColor(n).withValues(alpha: 0.4),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            '$n',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )),
                if (recommendation.bonus != null) ...[
                  Padding(
                    padding: const EdgeInsets.only(left: 2),
                    child: Text(
                      '+',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 3),
                    child: Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        color: AppColors.getBallColor(recommendation.bonus!),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: colorScheme.primary,
                          width: 1.5,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '${recommendation.bonus}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),

          // 7×7 그리드
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
            child: LayoutBuilder(builder: (context, constraints) {
              final cellW = constraints.maxWidth / 7;
              const cellH = 32.0;

              return SizedBox(
                height: cellH * 7,
                child: Stack(
                  children: [
                    // 셀
                    Column(
                      children: List.generate(7, (rowIdx) {
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
                                      ? _WinnerDot(number: num)
                                      : _NormalDot(
                                          number: num,
                                          colorScheme: colorScheme,
                                        ),
                                ),
                              );
                            }),
                          ),
                        );
                      }),
                    ),
                    // 연결선
                    Positioned.fill(
                      child: CustomPaint(
                        painter: _RecommendLinePainter(
                          numbers: sortedNums,
                          cellW: cellW,
                          cellH: cellH,
                          lineColor:
                              colorScheme.primary.withValues(alpha: 0.5),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class _WinnerDot extends StatelessWidget {
  final int number;
  const _WinnerDot({required this.number});

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

class _NormalDot extends StatelessWidget {
  final int number;
  final ColorScheme colorScheme;
  const _NormalDot({required this.number, required this.colorScheme});

  @override
  Widget build(BuildContext context) {
    return Text(
      '$number',
      style: TextStyle(
        fontSize: 10,
        color: colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
      ),
    );
  }
}

class _RecommendLinePainter extends CustomPainter {
  final List<int> numbers;
  final double cellW;
  final double cellH;
  final Color lineColor;

  const _RecommendLinePainter({
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
  bool shouldRepaint(_RecommendLinePainter old) =>
      old.numbers != numbers ||
      old.cellW != cellW ||
      old.cellH != cellH ||
      old.lineColor != lineColor;
}

// ────────────────────────────────────────────
// 상세 분석 카드 (방법별 결과 - 접힘 상태에서 표시)
// ────────────────────────────────────────────

class _DetailCard extends StatelessWidget {
  final int index;
  final Recommendation recommendation;

  const _DetailCard({required this.index, required this.recommendation});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final label = _setLabels[index % _setLabels.length];

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 26,
                  height: 26,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      label,
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: theme.colorScheme.onPrimaryContainer,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '세트 ${index + 1}  방법별 분석',
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            if (recommendation.details.isNotEmpty) ...[
              const SizedBox(height: 10),
              ...recommendation.details.entries.map((entry) {
                final detail = entry.value;
                final prob = detail.probability != null
                    ? '${(detail.probability! * 100).toStringAsFixed(1)}%'
                    : '-';
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            entry.key,
                            style: theme.textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            prob,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                      if (detail.numbers != null) ...[
                        const SizedBox(height: 4),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: LottoBallRow(
                            numbers: detail.numbers!,
                            ballSize: 30,
                            spacing: 2,
                          ),
                        ),
                      ],
                    ],
                  ),
                );
              }),
            ],
          ],
        ),
      ),
    );
  }
}
