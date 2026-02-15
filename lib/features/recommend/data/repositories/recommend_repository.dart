import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/network/dio_client.dart';
import '../models/recommend_models.dart';

final recommendRepositoryProvider = Provider<RecommendRepository>((ref) {
  return RecommendRepository(ref.watch(dioProvider));
});

class RecommendRepository {
  final Dio _dio;

  RecommendRepository(this._dio);

  /// 분석 방법 목록
  Future<MethodListResponse> getMethods() async {
    return apiCall(() async {
      final response = await _dio.get(ApiEndpoints.methods);
      return MethodListResponse.fromJson(response.data);
    });
  }

  /// 결합 방법 목록
  Future<CombineMethodListResponse> getCombineMethods() async {
    return apiCall(() async {
      final response = await _dio.get(ApiEndpoints.combineMethods);
      return CombineMethodListResponse.fromJson(response.data);
    });
  }

  /// 번호 추천 생성
  Future<RecommendResponse> generateRecommendation(
      RecommendRequest request) async {
    return apiCall(() async {
      final response = await _dio.post(
        ApiEndpoints.recommend,
        data: request.toJson(),
      );
      return RecommendResponse.fromJson(response.data);
    });
  }
}
