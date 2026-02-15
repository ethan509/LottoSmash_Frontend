import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/cache/cache_manager.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/network/dio_client.dart';
import '../models/stats_models.dart';

final statsRepositoryProvider = Provider<StatsRepository>((ref) {
  return StatsRepository(
    ref.watch(dioProvider),
    ref.watch(cacheManagerProvider),
  );
});

class StatsRepository {
  final Dio _dio;
  final CacheManager _cache;

  StatsRepository(this._dio, this._cache);

  /// 캐시 우선 API 호출 헬퍼
  Future<T> _cachedCall<T>(
    String cacheKey,
    Future<Map<String, dynamic>> Function() fetch,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    final cached = _cache.get(cacheKey);
    if (cached != null) {
      return fromJson(cached);
    }
    return apiCall(() async {
      final data = await fetch();
      await _cache.set(cacheKey, data);
      return fromJson(data);
    });
  }

  /// 번호 출현 빈도
  Future<NumberStatsResponse> getNumberStats() async {
    return _cachedCall(
      'stats_numbers',
      () async => (await _dio.get(ApiEndpoints.statsNumbers)).data,
      (data) => NumberStatsResponse.fromJson(data),
    );
  }

  /// 재출현 확률
  Future<StatsResponse> getReappearStats() async {
    return apiCall(() async {
      final response = await _dio.get(ApiEndpoints.statsReappear);
      // 재출현 API 응답은 { reappear_stats: [...] } 형태
      // StatsResponse에 맞추기 위해 number_stats 빈 배열 추가
      final data = response.data as Map<String, dynamic>;
      if (!data.containsKey('number_stats')) {
        data['number_stats'] = <dynamic>[];
      }
      if (!data.containsKey('latest_draw_no')) {
        data['latest_draw_no'] = 0;
      }
      return StatsResponse.fromJson(data);
    });
  }

  /// 첫번째/마지막 위치 통계
  Future<FirstLastResponse> getFirstLastStats() async {
    return _cachedCall(
      'stats_firstlast',
      () async => (await _dio.get(ApiEndpoints.statsFirstLast)).data,
      (data) => FirstLastResponse.fromJson(data),
    );
  }

  /// 번호 쌍 동시출현
  Future<PairStatsResponse> getPairStats({int top = 20}) async {
    return _cachedCall(
      'stats_pairs_$top',
      () async => (await _dio.get(
        ApiEndpoints.statsPairs,
        queryParameters: {'top': top},
      )).data,
      (data) => PairStatsResponse.fromJson(data),
    );
  }

  /// 연속번호 패턴
  Future<ConsecutiveResponse> getConsecutiveStats() async {
    return _cachedCall(
      'stats_consecutive',
      () async => (await _dio.get(ApiEndpoints.statsConsecutive)).data,
      (data) => ConsecutiveResponse.fromJson(data),
    );
  }

  /// 홀짝/고저 비율
  Future<RatioResponse> getRatioStats() async {
    return _cachedCall(
      'stats_ratio',
      () async => (await _dio.get(ApiEndpoints.statsRatio)).data,
      (data) => RatioResponse.fromJson(data),
    );
  }

  /// 색상 패턴
  Future<ColorStatsResponse> getColorStats({int top = 20}) async {
    return _cachedCall(
      'stats_colors_$top',
      () async => (await _dio.get(
        ApiEndpoints.statsColors,
        queryParameters: {'top': top},
      )).data,
      (data) => ColorStatsResponse.fromJson(data),
    );
  }

  /// 행열 패턴
  Future<GridResponse> getGridStats({int top = 20}) async {
    return _cachedCall(
      'stats_grid_$top',
      () async => (await _dio.get(
        ApiEndpoints.statsGrid,
        queryParameters: {'top': top},
      )).data,
      (data) => GridResponse.fromJson(data),
    );
  }

  /// 베이지안 분석
  Future<BayesianResponse> getBayesianStats({int window = 50}) async {
    return _cachedCall(
      'stats_bayesian_$window',
      () async => (await _dio.get(
        ApiEndpoints.statsBayesian,
        queryParameters: {'window': window},
      )).data,
      (data) => BayesianResponse.fromJson(data),
    );
  }

  /// 종합 통계
  Future<StatsResponse> getOverviewStats() async {
    return _cachedCall(
      'stats_overview',
      () async => (await _dio.get(ApiEndpoints.stats)).data,
      (data) => StatsResponse.fromJson(data),
    );
  }
}
