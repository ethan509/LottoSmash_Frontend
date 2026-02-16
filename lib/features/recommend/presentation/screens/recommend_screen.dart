import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/network/api_exception.dart';
import '../../../../shared/widgets/error_widget.dart';
import '../../../../shared/widgets/loading_indicator.dart';
import '../../data/models/recommend_models.dart';
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

  @override
  Widget build(BuildContext context) {
    final methodsAsync = ref.watch(analysisMethodsProvider);
    final combineAsync = ref.watch(combineMethodsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.recommend),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            tooltip: AppStrings.recommendHistory,
            onPressed: () => context.go('/recommend/history'),
          ),
        ],
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
          ],
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
      ref.read(recommendResultProvider.notifier).state =
          AsyncData(result);
    } on ApiException catch (e) {
      ref.read(recommendResultProvider.notifier).state =
          AsyncError(e.message, StackTrace.current);
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
