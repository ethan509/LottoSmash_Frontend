// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'backtest_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BacktestRequestImpl _$$BacktestRequestImplFromJson(
  Map<String, dynamic> json,
) => _$BacktestRequestImpl(
  methodCodes: (json['method_codes'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  combineMethod: json['combine_method'] as String,
  drawNo: (json['draw_no'] as num).toInt(),
  count: (json['count'] as num).toInt(),
);

Map<String, dynamic> _$$BacktestRequestImplToJson(
  _$BacktestRequestImpl instance,
) => <String, dynamic>{
  'method_codes': instance.methodCodes,
  'combine_method': instance.combineMethod,
  'draw_no': instance.drawNo,
  'count': instance.count,
};

_$BacktestComparisonImpl _$$BacktestComparisonImplFromJson(
  Map<String, dynamic> json,
) => _$BacktestComparisonImpl(
  winRateAnalysis: (json['win_rate_analysis'] as num).toDouble(),
  winRateRandom: (json['win_rate_random'] as num).toDouble(),
  winRateDiff: (json['win_rate_diff'] as num).toDouble(),
  winRateRelative: (json['win_rate_relative'] as num).toDouble(),
  prizeRateDiff: (json['prize_rate_diff'] as Map<String, dynamic>).map(
    (k, e) => MapEntry(k, (e as num).toDouble()),
  ),
);

Map<String, dynamic> _$$BacktestComparisonImplToJson(
  _$BacktestComparisonImpl instance,
) => <String, dynamic>{
  'win_rate_analysis': instance.winRateAnalysis,
  'win_rate_random': instance.winRateRandom,
  'win_rate_diff': instance.winRateDiff,
  'win_rate_relative': instance.winRateRelative,
  'prize_rate_diff': instance.prizeRateDiff,
};

_$BacktestResultImpl _$$BacktestResultImplFromJson(
  Map<String, dynamic> json,
) => _$BacktestResultImpl(
  request: BacktestRequest.fromJson(json['request'] as Map<String, dynamic>),
  totalSimulations: (json['total_simulations'] as num).toInt(),
  prizeDistribution: Map<String, int>.from(json['prize_distribution'] as Map),
  prizeRates: (json['prize_rates'] as Map<String, dynamic>).map(
    (k, e) => MapEntry(k, (e as num).toDouble()),
  ),
  randomPrizeDistribution: Map<String, int>.from(
    json['random_prize_distribution'] as Map,
  ),
  randomPrizeRates: (json['random_prize_rates'] as Map<String, dynamic>).map(
    (k, e) => MapEntry(k, (e as num).toDouble()),
  ),
  comparison: BacktestComparison.fromJson(
    json['comparison'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$$BacktestResultImplToJson(
  _$BacktestResultImpl instance,
) => <String, dynamic>{
  'request': instance.request,
  'total_simulations': instance.totalSimulations,
  'prize_distribution': instance.prizeDistribution,
  'prize_rates': instance.prizeRates,
  'random_prize_distribution': instance.randomPrizeDistribution,
  'random_prize_rates': instance.randomPrizeRates,
  'comparison': instance.comparison,
};
