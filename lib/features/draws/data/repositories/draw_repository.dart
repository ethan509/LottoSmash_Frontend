import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/network/dio_client.dart';
import '../models/draw_models.dart';

final drawRepositoryProvider = Provider<DrawRepository>((ref) {
  return DrawRepository(ref.watch(dioProvider));
});

class DrawRepository {
  final Dio _dio;

  DrawRepository(this._dio);

  /// 당첨번호 목록 조회
  Future<DrawListResponse> getDraws({int limit = 20, int offset = 0}) async {
    return apiCall(() async {
      final response = await _dio.get(
        ApiEndpoints.draws,
        queryParameters: {'limit': limit, 'offset': offset},
      );
      return DrawListResponse.fromJson(response.data);
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
