import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/models/recommend_models.dart';
import '../data/repositories/recommend_repository.dart';

/// 분석 방법 목록
final analysisMethodsProvider =
    FutureProvider<MethodListResponse>((ref) async {
  final repo = ref.watch(recommendRepositoryProvider);
  return await repo.getMethods();
});

/// 결합 방법 목록
final combineMethodsProvider =
    FutureProvider<CombineMethodListResponse>((ref) async {
  final repo = ref.watch(recommendRepositoryProvider);
  return await repo.getCombineMethods();
});

/// 선택된 분석 방법 코드
final selectedMethodCodesProvider =
    StateProvider<List<String>>((ref) => []);

/// 선택된 결합 방법 코드
final selectedCombineCodeProvider =
    StateProvider<String>((ref) => 'SIMPLE_AVG');

/// 가중치 (WEIGHTED_AVG용)
final weightsProvider =
    StateProvider<Map<String, double>>((ref) => {});

/// MIN_MAX 모드
final minMaxModeProvider = StateProvider<String>((ref) => 'MAX');

/// 보너스 번호 포함 여부
final includeBonusProvider = StateProvider<bool>((ref) => false);

/// 추천 세트 수
final recommendCountProvider = StateProvider<int>((ref) => 5);

/// 추천 결과
final recommendResultProvider =
    StateProvider<AsyncValue<RecommendResponse?>>((ref) => const AsyncData(null));

/// 추천 이력 (페이지네이션)
final recommendHistoryProvider =
    AsyncNotifierProvider<RecommendHistoryNotifier, RecommendHistoryState>(
        () => RecommendHistoryNotifier());

class RecommendHistoryState {
  final List<RecommendationHistory> items;
  final int totalCount;
  final bool hasMore;
  final bool isLoadingMore;

  const RecommendHistoryState({
    this.items = const [],
    this.totalCount = 0,
    this.hasMore = true,
    this.isLoadingMore = false,
  });

  RecommendHistoryState copyWith({
    List<RecommendationHistory>? items,
    int? totalCount,
    bool? hasMore,
    bool? isLoadingMore,
  }) {
    return RecommendHistoryState(
      items: items ?? this.items,
      totalCount: totalCount ?? this.totalCount,
      hasMore: hasMore ?? this.hasMore,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

class RecommendHistoryNotifier extends AsyncNotifier<RecommendHistoryState> {
  static const _pageSize = 20;

  @override
  Future<RecommendHistoryState> build() async {
    return _fetchPage(0);
  }

  Future<RecommendHistoryState> _fetchPage(int offset) async {
    final repo = ref.read(recommendRepositoryProvider);
    final response = await repo.getRecommendationHistory(
      limit: _pageSize,
      offset: offset,
    );
    return RecommendHistoryState(
      items: response.recommendations,
      totalCount: response.totalCount,
      hasMore: response.recommendations.length >= _pageSize,
    );
  }

  Future<void> loadMore() async {
    final current = state.valueOrNull;
    if (current == null || !current.hasMore || current.isLoadingMore) return;

    state = AsyncData(current.copyWith(isLoadingMore: true));

    try {
      final repo = ref.read(recommendRepositoryProvider);
      final response = await repo.getRecommendationHistory(
        limit: _pageSize,
        offset: current.items.length,
      );
      state = AsyncData(current.copyWith(
        items: [...current.items, ...response.recommendations],
        totalCount: response.totalCount,
        hasMore: response.recommendations.length >= _pageSize,
        isLoadingMore: false,
      ));
    } catch (e) {
      state = AsyncData(current.copyWith(isLoadingMore: false));
      rethrow;
    }
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _fetchPage(0));
  }
}
