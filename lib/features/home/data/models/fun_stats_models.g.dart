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
      maxPrizePerGame: FunStatRecord.fromJson(
        json['max_prize_per_game'] as Map<String, dynamic>,
      ),
      minPrizePerGame: FunStatRecord.fromJson(
        json['min_prize_per_game'] as Map<String, dynamic>,
      ),
      maxWinners: FunStatRecord.fromJson(
        json['max_winners'] as Map<String, dynamic>,
      ),
      minWinners: FunStatRecord.fromJson(
        json['min_winners'] as Map<String, dynamic>,
      ),
      longestAbsent: FunStatAbsent.fromJson(
        json['longest_absent'] as Map<String, dynamic>,
      ),
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
      'max_prize_per_game': instance.maxPrizePerGame,
      'min_prize_per_game': instance.minPrizePerGame,
      'max_winners': instance.maxWinners,
      'min_winners': instance.minWinners,
      'longest_absent': instance.longestAbsent,
      'all_odd_draws': instance.allOddDraws,
      'all_even_draws': instance.allEvenDraws,
      'calculated_at': instance.calculatedAt,
      'based_on_draw_no': instance.basedOnDrawNo,
    };
