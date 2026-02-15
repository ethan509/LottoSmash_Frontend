import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/network/dio_client.dart';
import '../models/stats_models.dart';

final statsRepositoryProvider = Provider<StatsRepository>((ref) {
  return StatsRepository(ref.watch(dioProvider));
});

class StatsRepository {
  final Dio _dio;

  StatsRepository(this._dio);

  /// 번호 출현 빈도
  Future<NumberStatsResponse> getNumberStats() async {
    return apiCall(() async {
      final response = await _dio.get(ApiEndpoints.statsNumbers);
      return NumberStatsResponse.fromJson(response.data);
    });
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
    return apiCall(() async {
      final response = await _dio.get(ApiEndpoints.statsFirstLast);
      return FirstLastResponse.fromJson(response.data);
    });
  }

  /// 번호 쌍 동시출현
  Future<PairStatsResponse> getPairStats({int top = 20}) async {
    return apiCall(() async {
      final response = await _dio.get(
        ApiEndpoints.statsPairs,
        queryParameters: {'top': top},
      );
      return PairStatsResponse.fromJson(response.data);
    });
  }

  /// 연속번호 패턴
  Future<ConsecutiveResponse> getConsecutiveStats() async {
    return apiCall(() async {
      final response = await _dio.get(ApiEndpoints.statsConsecutive);
      return ConsecutiveResponse.fromJson(response.data);
    });
  }

  /// 홀짝/고저 비율
  Future<RatioResponse> getRatioStats() async {
    return apiCall(() async {
      final response = await _dio.get(ApiEndpoints.statsRatio);
      return RatioResponse.fromJson(response.data);
    });
  }

  /// 색상 패턴
  Future<ColorStatsResponse> getColorStats({int top = 20}) async {
    return apiCall(() async {
      final response = await _dio.get(
        ApiEndpoints.statsColors,
        queryParameters: {'top': top},
      );
      return ColorStatsResponse.fromJson(response.data);
    });
  }

  /// 행열 패턴
  Future<GridResponse> getGridStats({int top = 20}) async {
    return apiCall(() async {
      final response = await _dio.get(
        ApiEndpoints.statsGrid,
        queryParameters: {'top': top},
      );
      return GridResponse.fromJson(response.data);
    });
  }

  /// 베이지안 분석
  Future<BayesianResponse> getBayesianStats({int window = 50}) async {
    return apiCall(() async {
      final response = await _dio.get(
        ApiEndpoints.statsBayesian,
        queryParameters: {'window': window},
      );
      return BayesianResponse.fromJson(response.data);
    });
  }

  /// 종합 통계
  Future<StatsResponse> getOverviewStats() async {
    return apiCall(() async {
      final response = await _dio.get(ApiEndpoints.stats);
      return StatsResponse.fromJson(response.data);
    });
  }
}
