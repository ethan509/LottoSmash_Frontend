import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/cache/cache_manager.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/network/dio_client.dart';
import '../models/draw_models.dart';

final drawRepositoryProvider = Provider<DrawRepository>((ref) {
  return DrawRepository(
    ref.watch(dioProvider),
    ref.watch(cacheManagerProvider),
  );
});

class DrawRepository {
  final Dio _dio;
  final CacheManager _cache;

  DrawRepository(this._dio, this._cache);

  /// 당첨번호 목록 조회 (첫 페이지 캐시)
  Future<DrawListResponse> getDraws({int limit = 20, int offset = 0}) async {
    final cacheKey = 'draws_${limit}_$offset';

    // 첫 페이지만 캐시
    if (offset == 0) {
      final cached = _cache.get(cacheKey);
      if (cached != null) {
        return DrawListResponse.fromJson(cached);
      }
    }

    return apiCall(() async {
      final response = await _dio.get(
        ApiEndpoints.draws,
        queryParameters: {'limit': limit, 'offset': offset},
      );
      final result = DrawListResponse.fromJson(response.data);

      if (offset == 0) {
        await _cache.set(cacheKey, response.data);
      }

      return result;
    });
  }

  /// 특정 회차 조회
  Future<LottoDraw> getDraw(int drawNo) async {
    return apiCall(() async {
      final response = await _dio.get(ApiEndpoints.draw(drawNo));
      return LottoDraw.fromJson(response.data);
    });
  }
}
