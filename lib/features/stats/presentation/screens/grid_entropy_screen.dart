import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/error_widget.dart';
import '../../../../shared/widgets/loading_indicator.dart';
import '../../data/models/stats_models.dart';
import '../../providers/stats_provider.dart';

class GridEntropyScreen extends ConsumerWidget {
  const GridEntropyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataAsync = ref.watch(gridEntropyProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('엔트로피 히트맵'),
      ),
      body: dataAsync.when(
        loading: () => const ShimmerList(itemCount: 4, itemHeight: 120),
        error: (error, _) => AppErrorWidget(
          message: error.toString(),
          onRetry: () => ref.invalidate(gridEntropyProvider),
        ),
        data: (data) => RefreshIndicator(
          onRefresh: () async => ref.invalidate(gridEntropyProvider),
          child: _GridEntropyContent(data: data),
        ),
      ),
    );
  }
}

class _GridEntropyContent extends StatelessWidget {
  final GridEntropyResponse data;

  const _GridEntropyContent({required this.data});

  /// entropy_score(0~1) → 히트맵 색상 (purple → teal → amber)
  Color _entropyToColor(double score, bool isDark) {
    // 낮음(밀집) → 보라, 중간 → 청록, 높음(산개 친화) → 황금
    if (score < 0.5) {
      return Color.lerp(
        isDark ? const Color(0xFF4A148C) : const Color(0xFFCE93D8), // 낮음: 보라
        const Color(0xFF00897B),                                     // 중간: 청록
        score * 2,
      )!;
    } else {
      return Color.lerp(
        const Color(0xFF00897B),    // 청록
        const Color(0xFFFFB300),    // 높음: 황금 (산개 친화)
        (score - 0.5) * 2,
      )!;
    }
  }

  /// row/col 헤더 색상
  Color _headerColor(double score, bool isDark) {
    return Color.lerp(
      isDark ? const Color(0xFF1A237E) : const Color(0xFF9FA8DA),
      const Color(0xFF1565C0),
      score.clamp(0.0, 1.0),
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
                    'GRID_ENTROPY 분석',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '7×7 격자의 열역학적 엔트로피를 분석합니다.\n'
                    '엔트로피가 높을수록 번호가 격자 전체에 골고루 산개된 회차에 유리한 번호입니다.',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        '기준 회차: ${data.latestDrawNo}회',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        '평균 엔트로피: ${data.avgEntropy.toStringAsFixed(3)}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.secondary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
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
                    '엔트로피 히트맵',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // 열 헤더
                  Row(
                    children: [
                      const SizedBox(width: 36),
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
                                  '${(rowScore * 100).toStringAsFixed(0)}%',
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
                                _entropyToColor(cell.entropyScore, isDark);
                            final luminance = cellColor.computeLuminance();
                            final textColor = luminance > 0.4
                                ? Colors.black87
                                : Colors.white;
                            return Expanded(
                              child: Tooltip(
                                message:
                                    '${cell.number}번\n'
                                    '엔트로피: ${cell.entropyScore.toStringAsFixed(3)}',
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
                                        cell.entropyScore.toStringAsFixed(2),
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
                              ? const Color(0xFF4A148C)
                              : const Color(0xFFCE93D8),
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text('낮음 (밀집 패턴)',
                            style: theme.textTheme.bodySmall),
                      ),
                      Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: const Color(0xFF00897B),
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child:
                            Text('중간', style: theme.textTheme.bodySmall),
                      ),
                      Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFB300),
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text('높음 (산개 친화)',
                            style: theme.textTheme.bodySmall),
                      ),
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
                    'TOP 10 산개 친화 번호',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '엔트로피 점수가 높은 번호 — 골고루 분산된 회차에서 자주 등장',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
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
    final allCells = data.cells
        .expand((row) => row)
        .where((cell) => !cell.isEmpty)
        .toList()
      ..sort((a, b) => b.entropyScore.compareTo(a.entropyScore));
    final top10 = allCells.take(10).toList();

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: top10.asMap().entries.map((entry) {
        final rank = entry.key + 1;
        final cell = entry.value;
        final cellColor = _entropyToColor(cell.entropyScore, isDark);
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
                    color: cellColor,
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
                        color: cellColor.computeLuminance() > 0.4
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
                      color: theme.colorScheme.secondary,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '$rank',
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onSecondary,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              cell.entropyScore.toStringAsFixed(3),
              style: theme.textTheme.bodySmall?.copyWith(fontSize: 9),
            ),
          ],
        );
      }).toList(),
    );
  }
}
