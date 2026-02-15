import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/network/dio_client.dart';
import '../../../stats/data/models/stats_models.dart';

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  return HomeRepository(ref.watch(dioProvider));
});

class HomeRepository {
  final Dio _dio;

  HomeRepository(this._dio);

  /// 베이지안 분석 요약 (HOT/COLD 번호)
  Future<BayesianResponse> getBayesianSummary({int window = 50}) async {
    return apiCall(() async {
      final response = await _dio.get(
        ApiEndpoints.statsBayesian,
        queryParameters: {'window': window},
      );
      return BayesianResponse.fromJson(response.data);
    });
  }
}
