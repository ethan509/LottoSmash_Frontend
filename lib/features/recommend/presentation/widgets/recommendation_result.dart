import 'package:flutter/material.dart';
import '../../../../shared/widgets/lotto_ball.dart';
import '../../data/models/recommend_models.dart';

class RecommendationResult extends StatelessWidget {
  final RecommendResponse response;

  const RecommendationResult({
    super.key,
    required this.response,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '추천 결과',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Text(
              '기준 회차: ${response.latestDrawNo}회',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ...response.recommendations.asMap().entries.map((entry) {
          final index = entry.key;
          final rec = entry.value;
          return _RecommendationCard(
            index: index + 1,
            recommendation: rec,
          );
        }),
      ],
    );
  }
}

class _RecommendationCard extends StatelessWidget {
  final int index;
  final Recommendation recommendation;

  const _RecommendationCard({
    required this.index,
    required this.recommendation,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final confidencePercent = (recommendation.confidence * 100).toStringAsFixed(1);

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 헤더: 세트 번호 + 신뢰도
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '세트 $index',
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: theme.colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: _getConfidenceColor(recommendation.confidence)
                        .withAlpha(30),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '신뢰도 $confidencePercent%',
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: _getConfidenceColor(recommendation.confidence),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // 추천 번호
            Center(
              child: LottoBallRow(
                numbers: recommendation.numbers,
                bonusNumber: recommendation.bonus,
                ballSize: 44,
                spacing: 6,
              ),
            ),
            // 상세 분석 (각 방법별 결과)
            if (recommendation.details.isNotEmpty) ...[
              const SizedBox(height: 12),
              const Divider(),
              const SizedBox(height: 8),
              Text(
                '분석 방법별 결과',
                style: theme.textTheme.labelMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 8),
              ...recommendation.details.entries.map((entry) {
                final methodCode = entry.key;
                final detail = entry.value;
                final prob = detail.probability != null
                    ? ((detail.probability! * 100).toStringAsFixed(1))
                    : '-';
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            methodCode,
                            style: theme.textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            '$prob%',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                      if (detail.numbers != null) ...[
                        const SizedBox(height: 4),
                        LottoBallRow(
                          numbers: detail.numbers!,
                          ballSize: 30,
                          spacing: 2,
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

  Color _getConfidenceColor(double confidence) {
    if (confidence >= 0.7) return Colors.green;
    if (confidence >= 0.4) return Colors.orange;
    return Colors.red;
  }
}
