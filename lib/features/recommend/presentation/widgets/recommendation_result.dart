import 'package:flutter/material.dart';
import '../../../../shared/widgets/lotto_ball.dart';
import '../../data/models/recommend_models.dart';

const _setLabels = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J'];

class RecommendationResult extends StatefulWidget {
  final RecommendResponse response;

  const RecommendationResult({
    super.key,
    required this.response,
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
                Text(
                  '평균 신뢰도 ${(avgConfidence * 100).toStringAsFixed(1)}%',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: _confidenceColor(avgConfidence),
                    fontWeight: FontWeight.w600,
                  ),
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
