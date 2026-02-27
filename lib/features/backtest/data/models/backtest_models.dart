import 'package:freezed_annotation/freezed_annotation.dart';

part 'backtest_models.freezed.dart';
part 'backtest_models.g.dart';

@freezed
class BacktestRequest with _$BacktestRequest {
  const factory BacktestRequest({
    @JsonKey(name: 'method_codes') required List<String> methodCodes,
    @JsonKey(name: 'combine_method') required String combineMethod,
    @JsonKey(name: 'draw_no') required int drawNo,
    required int count,
  }) = _BacktestRequest;

  factory BacktestRequest.fromJson(Map<String, dynamic> json) =>
      _$BacktestRequestFromJson(json);
}

@freezed
class BacktestResult with _$BacktestResult {
  const factory BacktestResult({
    required BacktestRequest request,
    @JsonKey(name: 'total_simulations') required int totalSimulations,
    @JsonKey(name: 'prize_distribution') required Map<String, int> prizeDistribution,
    @JsonKey(name: 'prize_rates') required Map<String, double> prizeRates,
  }) = _BacktestResult;

  factory BacktestResult.fromJson(Map<String, dynamic> json) =>
      _$BacktestResultFromJson(json);
}
