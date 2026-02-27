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

_$BacktestResultImpl _$$BacktestResultImplFromJson(
  Map<String, dynamic> json,
) => _$BacktestResultImpl(
  request: BacktestRequest.fromJson(json['request'] as Map<String, dynamic>),
  totalSimulations: (json['total_simulations'] as num).toInt(),
  prizeDistribution: Map<String, int>.from(json['prize_distribution'] as Map),
  prizeRates: (json['prize_rates'] as Map<String, dynamic>).map(
    (k, e) => MapEntry(k, (e as num).toDouble()),
  ),
);

Map<String, dynamic> _$$BacktestResultImplToJson(
  _$BacktestResultImpl instance,
) => <String, dynamic>{
  'request': instance.request,
  'total_simulations': instance.totalSimulations,
  'prize_distribution': instance.prizeDistribution,
  'prize_rates': instance.prizeRates,
};
