// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fun_stats_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FunStatRecordImpl _$$FunStatRecordImplFromJson(Map<String, dynamic> json) =>
    _$FunStatRecordImpl(
      drawNo: (json['draw_no'] as num).toInt(),
      drawDate: json['draw_date'] as String,
      value: (json['value'] as num).toInt(),
    );

Map<String, dynamic> _$$FunStatRecordImplToJson(_$FunStatRecordImpl instance) =>
    <String, dynamic>{
      'draw_no': instance.drawNo,
      'draw_date': instance.drawDate,
      'value': instance.value,
    };

_$FunStatDrawImpl _$$FunStatDrawImplFromJson(Map<String, dynamic> json) =>
    _$FunStatDrawImpl(
      drawNo: (json['draw_no'] as num).toInt(),
      drawDate: json['draw_date'] as String,
      numbers: (json['numbers'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$$FunStatDrawImplToJson(_$FunStatDrawImpl instance) =>
    <String, dynamic>{
      'draw_no': instance.drawNo,
      'draw_date': instance.drawDate,
      'numbers': instance.numbers,
    };

_$FunStatAbsentImpl _$$FunStatAbsentImplFromJson(Map<String, dynamic> json) =>
    _$FunStatAbsentImpl(
      number: (json['number'] as num).toInt(),
      fromDrawNo: (json['from_draw_no'] as num).toInt(),
      toDrawNo: (json['to_draw_no'] as num).toInt(),
      duration: (json['duration'] as num).toInt(),
    );

Map<String, dynamic> _$$FunStatAbsentImplToJson(_$FunStatAbsentImpl instance) =>
    <String, dynamic>{
      'number': instance.number,
      'from_draw_no': instance.fromDrawNo,
      'to_draw_no': instance.toDrawNo,
      'duration': instance.duration,
    };

_$FunStatsImpl _$$FunStatsImplFromJson(Map<String, dynamic> json) =>
    _$FunStatsImpl(
      topMaxPrize: (json['top_max_prize'] as List<dynamic>)
          .map((e) => FunStatRecord.fromJson(e as Map<String, dynamic>))
          .toList(),
      topMinPrize: (json['top_min_prize'] as List<dynamic>)
          .map((e) => FunStatRecord.fromJson(e as Map<String, dynamic>))
          .toList(),
      maxWinners: FunStatRecord.fromJson(
        json['max_winners'] as Map<String, dynamic>,
      ),
      minWinners: FunStatRecord.fromJson(
        json['min_winners'] as Map<String, dynamic>,
      ),
      topLongestAbsent: (json['top_longest_absent'] as List<dynamic>)
          .map((e) => FunStatAbsent.fromJson(e as Map<String, dynamic>))
          .toList(),
      allOddDraws: (json['all_odd_draws'] as List<dynamic>)
          .map((e) => FunStatDraw.fromJson(e as Map<String, dynamic>))
          .toList(),
      allEvenDraws: (json['all_even_draws'] as List<dynamic>)
          .map((e) => FunStatDraw.fromJson(e as Map<String, dynamic>))
          .toList(),
      calculatedAt: json['calculated_at'] as String,
      basedOnDrawNo: (json['based_on_draw_no'] as num).toInt(),
    );

Map<String, dynamic> _$$FunStatsImplToJson(_$FunStatsImpl instance) =>
    <String, dynamic>{
      'top_max_prize': instance.topMaxPrize,
      'top_min_prize': instance.topMinPrize,
      'max_winners': instance.maxWinners,
      'min_winners': instance.minWinners,
      'top_longest_absent': instance.topLongestAbsent,
      'all_odd_draws': instance.allOddDraws,
      'all_even_draws': instance.allEvenDraws,
      'calculated_at': instance.calculatedAt,
      'based_on_draw_no': instance.basedOnDrawNo,
    };
