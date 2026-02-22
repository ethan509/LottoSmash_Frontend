import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/error_widget.dart';
import '../../../../shared/widgets/loading_indicator.dart';
import '../../data/models/stats_models.dart';
import '../../providers/stats_provider.dart';

class GridPatternScreen extends ConsumerWidget {
  const GridPatternScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataAsync = ref.watch(gridPatternProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('행/열 분포 히트맵'),
      ),
      body: dataAsync.when(
        loading: () => const ShimmerList(itemCount: 4, itemHeight: 120),
        error: (error, _) => AppErrorWidget(
          message: error.toString(),
          onRetry: () => ref.invalidate(gridPatternProvider),
        ),
        data: (data) => RefreshIndicator(
          onRefresh: () async => ref.invalidate(gridPatternProvider),
          child: _GridPatternContent(data: data),
        ),
      ),
    );
  }
}

class _GridPatternContent extends StatelessWidget {
  final GridPatternResponse data;

  const _GridPatternContent({required this.data});

  /// score(0~1) → 히트맵 색상 (blue → yellow → red)
  Color _scoreToColor(double score, bool isDark) {
    final base = Color.lerp(
      isDark ? const Color(0xFF1565C0) : const Color(0xFF90CAF9), // 낮음: 파랑
      const Color(0xFFFFD700),                                     // 중간: 노랑
      score.clamp(0.0, 1.0) < 0.5
          ? (score.clamp(0.0, 1.0) * 2)
          : 0.0,
    );
    if (score.clamp(0.0, 1.0) >= 0.5) {
      return Color.lerp(
        const Color(0xFFFFD700),    // 노랑
        const Color(0xFFE53935),    // 높음: 빨강
        (score.clamp(0.0, 1.0) - 0.5) * 2,
      )!;
    }
    return base!;
  }

  /// row_score / col_score → 헤더 색상
  Color _headerColor(double prob, bool isDark) {
    // 0.13 ~ 0.15 범위가 일반적 → 이 범위 기준으로 정규화
    const min = 0.10;
    const max = 0.16;
    final normalized = ((prob - min) / (max - min)).clamp(0.0, 1.0);
    return Color.lerp(
      isDark ? const Color(0xFF1B5E20) : const Color(0xFFA5D6A7),
      const Color(0xFF2E7D32),
      normalized,
    )!;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 설명 카드
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ROW_COL_DIST 분석',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '7×7 격자에서 각 번호의 행/열 출현 빈도를 분석합니다.\n'
                    '점수(score) = 행 확률 × 열 확률 기반으로, 붉을수록 추천 확률이 높습니다.',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '기준 회차: ${data.latestDrawNo}회',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // 7×7 격자 히트맵
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Text(
                    '번호 히트맵',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // 열 헤더
                  Row(
                    children: [
                      const SizedBox(width: 36), // 행 헤더 공간
                      ...List.generate(7, (colIdx) {
                        final colScore = colIdx < data.colScores.length
                            ? data.colScores[colIdx]
                            : 0.0;
                        return Expanded(
                          child: Container(
                            height: 28,
                            margin: const EdgeInsets.symmetric(horizontal: 1),
                            decoration: BoxDecoration(
                              color: _headerColor(colScore, isDark),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Center(
                              child: Text(
                                '${colIdx + 1}열',
                                style: const TextStyle(
                                  fontSize: 8,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                  const SizedBox(height: 4),
                  // 격자 행
                  ...data.cells.asMap().entries.map((rowEntry) {
                    final rowIdx = rowEntry.key;
                    final rowCells = rowEntry.value;
                    final rowScore = rowIdx < data.rowScores.length
                        ? data.rowScores[rowIdx]
                        : 0.0;

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: Row(
                        children: [
                          // 행 헤더
                          Container(
                            width: 36,
                            height: 40,
                            margin: const EdgeInsets.only(right: 2),
                            decoration: BoxDecoration(
                              color: _headerColor(rowScore, isDark),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${rowIdx + 1}행',
                                  style: const TextStyle(
                                    fontSize: 8,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '${(rowScore * 100).toStringAsFixed(1)}%',
                                  style: const TextStyle(
                                    fontSize: 7,
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // 셀들
                          ...rowCells.map((cell) {
                            if (cell.isEmpty) {
                              return Expanded(
                                child: Container(
                                  height: 40,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 1),
                                  decoration: BoxDecoration(
                                    color: theme.colorScheme
                                        .surfaceContainerHighest
                                        .withValues(alpha: 0.4),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              );
                            }
                            final cellColor =
                                _scoreToColor(cell.score, isDark);
                            final luminance = cellColor.computeLuminance();
                            final textColor = luminance > 0.4
                                ? Colors.black87
                                : Colors.white;
                            return Expanded(
                              child: Tooltip(
                                message:
                                    '${cell.number}번\n'
                                    '행확률: ${(cell.rowProb * 100).toStringAsFixed(1)}%\n'
                                    '열확률: ${(cell.colProb * 100).toStringAsFixed(1)}%\n'
                                    '점수: ${cell.score.toStringAsFixed(3)}',
                                child: Container(
                                  height: 40,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 1),
                                  decoration: BoxDecoration(
                                    color: cellColor,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${cell.number}',
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                          color: textColor,
                                        ),
                                      ),
                                      Text(
                                        cell.score.toStringAsFixed(2),
                                        style: TextStyle(
                                          fontSize: 7,
                                          color: textColor.withValues(
                                              alpha: 0.8),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),

          // 범례
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '색상 범례',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: isDark
                              ? const Color(0xFF1565C0)
                              : const Color(0xFF90CAF9),
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text('낮음 (추천 확률 낮음)',
                          style: theme.textTheme.bodySmall),
                      const Spacer(),
                      Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFD700),
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text('중간', style: theme.textTheme.bodySmall),
                      const Spacer(),
                      Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE53935),
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text('높음 (추천 확률 높음)',
                          style: theme.textTheme.bodySmall),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),

          // TOP 10 번호
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'TOP 10 추천 번호',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildTopNumbers(context, theme, isDark),
                ],
              ),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildTopNumbers(
      BuildContext context, ThemeData theme, bool isDark) {
    // 모든 셀 중 is_empty=false인 것만 score 내림차순 정렬
    final allCells = data.cells
        .expand((row) => row)
        .where((cell) => !cell.isEmpty)
        .toList()
      ..sort((a, b) => b.score.compareTo(a.score));
    final top10 = allCells.take(10).toList();

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: top10.asMap().entries.map((entry) {
        final rank = entry.key + 1;
        final cell = entry.value;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: _scoreToColor(cell.score, isDark),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.15),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      '${cell.number}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color:
                            _scoreToColor(cell.score, isDark).computeLuminance() >
                                    0.4
                                ? Colors.black87
                                : Colors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: -4,
                  right: -4,
                  child: Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '$rank',
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              cell.score.toStringAsFixed(3),
              style: theme.textTheme.bodySmall?.copyWith(fontSize: 9),
            ),
          ],
        );
      }).toList(),
    );
  }
}
