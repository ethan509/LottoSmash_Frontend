import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/network/api_exception.dart';
import '../../../../shared/widgets/error_widget.dart';
import '../../../../shared/widgets/loading_indicator.dart';
import '../../data/models/recommend_models.dart';
import '../../../auth/providers/auth_provider.dart';
import '../../data/repositories/recommend_repository.dart';
import '../../providers/recommend_provider.dart';
import '../widgets/combine_method_selector.dart';
import '../widgets/method_selector.dart';
import '../widgets/recommendation_result.dart';

class RecommendScreen extends ConsumerStatefulWidget {
  const RecommendScreen({super.key});

  @override
  ConsumerState<RecommendScreen> createState() => _RecommendScreenState();
}

class _RecommendScreenState extends ConsumerState<RecommendScreen> {
  bool _isGenerating = false;
  bool _isRandomGenerating = false;

  @override
  Widget build(BuildContext context) {
    final methodsAsync = ref.watch(analysisMethodsProvider);
    final combineAsync = ref.watch(combineMethodsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.recommend),
      ),
      body: methodsAsync.when(
        loading: () => const ShimmerList(itemCount: 4, itemHeight: 80),
        error: (error, _) => AppErrorWidget(
          message: error.toString(),
          onRetry: () => ref.invalidate(analysisMethodsProvider),
        ),
        data: (methodsData) => combineAsync.when(
          loading: () => const ShimmerList(itemCount: 4, itemHeight: 80),
          error: (error, _) => AppErrorWidget(
            message: error.toString(),
            onRetry: () => ref.invalidate(combineMethodsProvider),
          ),
          data: (combineData) => _buildContent(
            methodsData.methods,
            combineData.methods,
          ),
        ),
      ),
    );
  }

  Widget _buildContent(
    List<AnalysisMethod> methods,
    List<CombineMethod> combineMethods,
  ) {
    final theme = Theme.of(context);
    final selectedCodes = ref.watch(selectedMethodCodesProvider);
    final selectedCombine = ref.watch(selectedCombineCodeProvider);
    final weights = ref.watch(weightsProvider);
    final minMaxMode = ref.watch(minMaxModeProvider);
    final includeBonus = ref.watch(includeBonusProvider);
    final count = ref.watch(recommendCountProvider);
    final resultAsync = ref.watch(recommendResultProvider);
    final randomResultAsync = ref.watch(randomRecommendResultProvider);
    final randomIsOffline = ref.watch(randomIsOfflineProvider);
    final randomCount = ref.watch(randomRecommendCountProvider);

    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(analysisMethodsProvider);
        ref.invalidate(combineMethodsProvider);
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 추천 이력 배너
            _buildHistoryBanner(context),

            const SizedBox(height: 8),

            // 백테스팅 배너
            _buildBacktestBanner(context),

            const SizedBox(height: 8),

            // Step 1: 분석 방법 선택
            MethodSelector(
              methods: methods,
              selectedCodes: selectedCodes,
              onChanged: (codes) {
                ref.read(selectedMethodCodesProvider.notifier).state = codes;
                // 가중치 초기화
                if (codes.isNotEmpty) {
                  final equal = 1.0 / codes.length;
                  ref.read(weightsProvider.notifier).state = {
                    for (final c in codes) c: equal,
                  };
                }
              },
            ),

            const SizedBox(height: 24),

            // Step 2: 결합 방법 선택
            CombineMethodSelector(
              methods: combineMethods,
              selectedCode: selectedCombine,
              onChanged: (code) {
                ref.read(selectedCombineCodeProvider.notifier).state = code;
              },
              selectedMethodCodes: selectedCodes,
              weights: weights,
              onWeightsChanged: (w) {
                ref.read(weightsProvider.notifier).state = w;
              },
              minMaxMode: minMaxMode,
              onMinMaxChanged: (mode) {
                ref.read(minMaxModeProvider.notifier).state = mode;
              },
            ),

            const SizedBox(height: 24),

            // Step 3: 옵션
            Text(
              AppStrings.options,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Card(
              child: Column(
                children: [
                  SwitchListTile(
                    title: const Text(AppStrings.includeBonus),
                    value: includeBonus,
                    onChanged: (value) {
                      ref.read(includeBonusProvider.notifier).state = value;
                    },
                  ),
                  const Divider(height: 1),
                  ListTile(
                    title: const Text(AppStrings.setCount),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: count > 1
                              ? () => ref
                                  .read(recommendCountProvider.notifier)
                                  .state = count - 1
                              : null,
                          icon: const Icon(Icons.remove_circle_outline),
                        ),
                        SizedBox(
                          width: 32,
                          child: Text(
                            '$count',
                            textAlign: TextAlign.center,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: count < 10
                              ? () => ref
                                  .read(recommendCountProvider.notifier)
                                  .state = count + 1
                              : null,
                          icon: const Icon(Icons.add_circle_outline),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 추천 버튼
            FilledButton.icon(
              onPressed:
                  selectedCodes.isNotEmpty && !_isGenerating
                      ? _generateRecommendation
                      : null,
              icon: _isGenerating
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Icon(Icons.auto_awesome),
              label: Text(
                _isGenerating ? '생성 중...' : AppStrings.generateRecommend,
              ),
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                textStyle: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 24),

            // 결과 표시
            resultAsync.when(
              data: (result) {
                if (result == null) return const SizedBox.shrink();
                return RecommendationResult(response: result);
              },
              loading: () => const Center(
                child: Padding(
                  padding: EdgeInsets.all(32),
                  child: CircularProgressIndicator(),
                ),
              ),
              error: (error, _) => Card(
                color: theme.colorScheme.errorContainer,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    error.toString(),
                    style: TextStyle(color: theme.colorScheme.onErrorContainer),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 32),

            // ── 순수 랜덤 추천 섹션 ──────────────────────────────
            _buildRandomSection(
              theme: theme,
              randomCount: randomCount,
              randomResultAsync: randomResultAsync,
              randomIsOffline: randomIsOffline,
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildRandomSection({
    required ThemeData theme,
    required int randomCount,
    required AsyncValue<RecommendResponse?> randomResultAsync,
    required bool randomIsOffline,
  }) {
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // 구분선
        Row(
          children: [
            const Expanded(child: Divider()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                '또는',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ),
            const Expanded(child: Divider()),
          ],
        ),

        const SizedBox(height: 16),

        // 카드
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(
              color: colorScheme.outline.withValues(alpha: 0.3),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Icon(Icons.casino_outlined, color: colorScheme.tertiary),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '순수 랜덤 추천',
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '분석 없이 현재 시간 기반 rand()로만 생성',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // 오프라인 뱃지
                    if (randomIsOffline)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: colorScheme.tertiaryContainer,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.wifi_off,
                                size: 12,
                                color: colorScheme.onTertiaryContainer),
                            const SizedBox(width: 4),
                            Text(
                              '오프라인',
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: colorScheme.onTertiaryContainer,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),

                const SizedBox(height: 12),

                // 세트 수 선택
                Row(
                  children: [
                    Text('세트 수', style: theme.textTheme.bodyMedium),
                    const Spacer(),
                    IconButton(
                      visualDensity: VisualDensity.compact,
                      onPressed: randomCount > 1
                          ? () => ref
                              .read(randomRecommendCountProvider.notifier)
                              .state = randomCount - 1
                          : null,
                      icon: const Icon(Icons.remove_circle_outline, size: 20),
                    ),
                    SizedBox(
                      width: 28,
                      child: Text(
                        '$randomCount',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      visualDensity: VisualDensity.compact,
                      onPressed: randomCount < 10
                          ? () => ref
                              .read(randomRecommendCountProvider.notifier)
                              .state = randomCount + 1
                          : null,
                      icon: const Icon(Icons.add_circle_outline, size: 20),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                FilledButton.tonalIcon(
                  onPressed:
                      _isRandomGenerating ? null : _generateRandom,
                  icon: _isRandomGenerating
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.shuffle_rounded),
                  label: Text(_isRandomGenerating ? '생성 중...' : '랜덤 생성'),
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ],
            ),
          ),
        ),

        // 랜덤 결과 표시
        randomResultAsync.when(
          data: (result) {
            if (result == null) return const SizedBox.shrink();
            return Padding(
              padding: const EdgeInsets.only(top: 16),
              child: RecommendationResult(response: result),
            );
          },
          loading: () => const Center(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: CircularProgressIndicator(),
            ),
          ),
          error: (error, _) => Card(
            color: theme.colorScheme.errorContainer,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                error.toString(),
                style:
                    TextStyle(color: theme.colorScheme.onErrorContainer),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _generateRandom() async {
    final count = ref.read(randomRecommendCountProvider);

    setState(() => _isRandomGenerating = true);
    ref.read(randomRecommendResultProvider.notifier).state =
        const AsyncLoading();
    ref.read(randomIsOfflineProvider.notifier).state = false;

    try {
      final repo = ref.read(recommendRepositoryProvider);
      final (result, isOffline) =
          await repo.generateRandomRecommendation(count);
      ref.read(randomRecommendResultProvider.notifier).state =
          AsyncData(result);
      ref.read(randomIsOfflineProvider.notifier).state = isOffline;
    } catch (e) {
      ref.read(randomRecommendResultProvider.notifier).state =
          AsyncError(e.toString(), StackTrace.current);
    } finally {
      if (mounted) {
        setState(() => _isRandomGenerating = false);
      }
    }
  }

  Widget _buildHistoryBanner(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => context.go('/recommend/history'),
        splashColor: colorScheme.secondary.withValues(alpha: 0.12),
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                colorScheme.secondary.withValues(alpha: 0.15),
                colorScheme.tertiary.withValues(alpha: 0.10),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: colorScheme.secondary.withValues(alpha: 0.35),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: colorScheme.secondary.withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.history_rounded,
                    color: colorScheme.secondary,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.recommendHistory,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '저장된 추천 번호를 확인하세요',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.chevron_right_rounded,
                  color: colorScheme.onSurfaceVariant,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBacktestBanner(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => context.go('/recommend/backtest'),
        splashColor: colorScheme.tertiary.withValues(alpha: 0.12),
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                colorScheme.tertiary.withValues(alpha: 0.15),
                colorScheme.primary.withValues(alpha: 0.10),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: colorScheme.tertiary.withValues(alpha: 0.35),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: colorScheme.tertiary.withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.science_rounded,
                    color: colorScheme.tertiary,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '백테스팅',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '분석방법별 성능을 시뮬레이션으로 비교하세요',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.chevron_right_rounded,
                  color: colorScheme.onSurfaceVariant,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _generateRecommendation() async {
    final selectedCodes = ref.read(selectedMethodCodesProvider);
    final combineCode = ref.read(selectedCombineCodeProvider);
    final weights = ref.read(weightsProvider);
    final minMaxMode = ref.read(minMaxModeProvider);
    final includeBonus = ref.read(includeBonusProvider);
    final count = ref.read(recommendCountProvider);

    final request = RecommendRequest(
      methodCodes: selectedCodes,
      combineCode: combineCode,
      weights: combineCode == 'WEIGHTED_AVG' ? weights : null,
      minMaxMode: combineCode == 'MIN_MAX' ? minMaxMode : null,
      includeBonus: includeBonus,
      count: count,
    );

    setState(() => _isGenerating = true);
    ref.read(recommendResultProvider.notifier).state =
        const AsyncLoading();

    try {
      final repo = ref.read(recommendRepositoryProvider);
      final result = await repo.generateRecommendation(request);
      ref.read(recommendResultProvider.notifier).state = AsyncData(result);
      // Zam 잔액 갱신 + 이력 갱신
      ref.invalidate(currentUserProvider);
      ref.invalidate(recommendHistoryProvider);
    } on ApiException catch (e) {
      final msg = e.isInsufficientZam
          ? 'Zam 잔액이 부족합니다.\n추천 $count세트에 ${count * 10} Zam이 필요합니다.\n프로필에서 잔액을 확인해주세요.'
          : e.message;
      ref.read(recommendResultProvider.notifier).state =
          AsyncError(msg, StackTrace.current);
    } catch (e) {
      ref.read(recommendResultProvider.notifier).state =
          AsyncError(e.toString(), StackTrace.current);
    } finally {
      if (mounted) {
        setState(() => _isGenerating = false);
      }
    }
  }
}
