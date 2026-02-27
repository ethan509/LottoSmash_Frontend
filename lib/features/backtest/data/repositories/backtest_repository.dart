import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/network/dio_client.dart';
import '../models/backtest_models.dart';

final backtestRepositoryProvider = Provider<BacktestRepository>((ref) {
  return BacktestRepository(ref.watch(dioProvider));
});

class BacktestRepository {
  final Dio _dio;

  BacktestRepository(this._dio);

  Future<BacktestResult> runBacktest(BacktestRequest request) async {
    return apiCall(() async {
      final response = await _dio.post(
        ApiEndpoints.backtest,
        data: request.toJson(),
      );
      return BacktestResult.fromJson(response.data);
    });
  }
}
