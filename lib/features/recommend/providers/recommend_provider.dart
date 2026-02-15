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
