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

/// 위치 선행 조건 사용 여부 (첫번째·마지막 번호를 FIRST/LAST_POSITION으로 결정)
final usePositionConstraintProvider = StateProvider<bool>((ref) => false);

/// 과거 당첨번호와 동일한 조합 제외 여부
final excludePastWinnersProvider = StateProvider<bool>((ref) => false);

/// 고정 번호 설정 활성화 여부
final fixedNumbersEnabledProvider = StateProvider<bool>((ref) => false);

/// 고정 번호 목록 (1~5개)
final fixedNumbersProvider = StateProvider<List<int>>((ref) => []);

/// 보너스 번호 포함 여부
final includeBonusProvider = StateProvider<bool>((ref) => false);

/// 추천 세트 수
final recommendCountProvider = StateProvider<int>((ref) => 5);

/// 추천 결과
final recommendResultProvider =
    StateProvider<AsyncValue<RecommendResponse?>>((ref) => const AsyncData(null));

/// 순수 랜덤 추천 결과
final randomRecommendResultProvider =
    StateProvider<AsyncValue<RecommendResponse?>>((ref) => const AsyncData(null));

/// 순수 랜덤 추천이 오프라인으로 생성됐는지 여부
final randomIsOfflineProvider = StateProvider<bool>((ref) => false);

/// 순수 랜덤 추천 세트 수
final randomRecommendCountProvider = StateProvider<int>((ref) => 5);

/// 추천 이력 (섹션 구조)
final recommendHistoryProvider =
    AsyncNotifierProvider<RecommendHistoryNotifier, SectionedHistoryResponse>(
        () => RecommendHistoryNotifier());

class RecommendHistoryNotifier
    extends AsyncNotifier<SectionedHistoryResponse> {
  @override
  Future<SectionedHistoryResponse> build() async {
    final repo = ref.read(recommendRepositoryProvider);
    return repo.getRecommendationHistory();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(recommendRepositoryProvider);
      return repo.getRecommendationHistory();
    });
  }
}
