import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../stats/data/models/stats_models.dart';
import '../data/models/fun_stats_models.dart';
import '../data/repositories/home_repository.dart';

/// 베이지안 HOT/COLD 요약 (홈 화면용)
final bayesianSummaryProvider = FutureProvider<BayesianResponse>((ref) async {
  final repo = ref.watch(homeRepositoryProvider);
  return await repo.getBayesianSummary();
});

/// 재미로 보는 통계
final funStatsProvider = FutureProvider<FunStats>((ref) async {
  final repo = ref.watch(homeRepositoryProvider);
  return await repo.getFunStats();
});
