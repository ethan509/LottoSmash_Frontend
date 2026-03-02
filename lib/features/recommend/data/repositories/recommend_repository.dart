import 'dart:math';

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

  /// 순수 랜덤 번호 추천
  /// 서버 접속 가능 → 서버에서 시간 기반 rand() 실행 후 반환 (기록 저장됨)
  /// 서버 접속 불가 → 프론트에서 직접 시간 기반 rand() 실행 (기록 저장 안 됨)
  /// 반환값: (RecommendResponse, isOffline)
  Future<(RecommendResponse, bool)> generateRandomRecommendation(
      int count) async {
    try {
      final response = await _dio.post(
        ApiEndpoints.recommendRandom,
        data: {'count': count},
        options: Options(sendTimeout: const Duration(seconds: 5)),
      );
      return (RecommendResponse.fromJson(response.data), false);
    } on DioException {
      // 서버 접속 불가 → 로컬 생성
      final result = _generateLocalRandom(count);
      return (result, true);
    }
  }

  /// 로컬에서 시간 기반 순수 랜덤 번호 생성 (오프라인용)
  RecommendResponse _generateLocalRandom(int count) {
    final rng = Random(DateTime.now().microsecondsSinceEpoch);
    final recs = List.generate(count, (_) {
      final pool = List.generate(45, (i) => i + 1);
      // Fisher-Yates shuffle
      for (int j = 44; j > 0; j--) {
        final k = rng.nextInt(j + 1);
        final tmp = pool[j];
        pool[j] = pool[k];
        pool[k] = tmp;
      }
      final numbers = pool.sublist(0, 6)..sort();
      return Recommendation(
        numbers: numbers,
        methodsUsed: const ['PURE_RANDOM'],
        combineMethod: 'PURE_RANDOM',
        confidence: 0.0,
      );
    });

    return RecommendResponse(
      recommendations: recs,
      generatedAt: DateTime.now().toIso8601String(),
    );
  }

  /// 추천 이력 조회
  Future<RecommendationHistoryResponse> getRecommendationHistory({
    int limit = 20,
    int offset = 0,
  }) async {
    return apiCall(() async {
      final response = await _dio.get(
        ApiEndpoints.recommendations,
        queryParameters: {'limit': limit, 'offset': offset},
      );
      return RecommendationHistoryResponse.fromJson(response.data);
    });
  }
}
