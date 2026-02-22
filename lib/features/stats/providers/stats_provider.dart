import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/models/stats_models.dart';
import '../data/repositories/stats_repository.dart';

/// 번호 출현 빈도
final numberStatsProvider = FutureProvider<NumberStatsResponse>((ref) async {
  final repo = ref.watch(statsRepositoryProvider);
  return await repo.getNumberStats();
});

/// 베이지안 분석 (window 파라미터)
final bayesianStatsProvider =
    FutureProvider.family<BayesianResponse, int>((ref, window) async {
  final repo = ref.watch(statsRepositoryProvider);
  return await repo.getBayesianStats(window: window);
});

/// 베이지안 기본 (window=50)
final bayesianDefaultProvider = FutureProvider<BayesianResponse>((ref) async {
  final repo = ref.watch(statsRepositoryProvider);
  return await repo.getBayesianStats();
});

/// 번호 쌍 통계
final pairStatsProvider = FutureProvider<PairStatsResponse>((ref) async {
  final repo = ref.watch(statsRepositoryProvider);
  return await repo.getPairStats();
});

/// 연속번호 패턴
final consecutiveStatsProvider =
    FutureProvider<ConsecutiveResponse>((ref) async {
  final repo = ref.watch(statsRepositoryProvider);
  return await repo.getConsecutiveStats();
});

/// 홀짝/고저 비율
final ratioStatsProvider = FutureProvider<RatioResponse>((ref) async {
  final repo = ref.watch(statsRepositoryProvider);
  return await repo.getRatioStats();
});

/// 색상 패턴
final colorStatsProvider = FutureProvider<ColorStatsResponse>((ref) async {
  final repo = ref.watch(statsRepositoryProvider);
  return await repo.getColorStats();
});

/// 행열 패턴
final gridStatsProvider = FutureProvider<GridResponse>((ref) async {
  final repo = ref.watch(statsRepositoryProvider);
  return await repo.getGridStats();
});

/// 행/열 분포 격자 히트맵 (ROW_COL_DIST)
final gridPatternProvider = FutureProvider<GridPatternResponse>((ref) async {
  final repo = ref.watch(statsRepositoryProvider);
  return await repo.getGridPattern();
});

/// 종합 통계 (개요)
final overviewStatsProvider = FutureProvider<StatsResponse>((ref) async {
  final repo = ref.watch(statsRepositoryProvider);
  return await repo.getOverviewStats();
});
