// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'draw_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LottoDrawImpl _$$LottoDrawImplFromJson(Map<String, dynamic> json) =>
    _$LottoDrawImpl(
      drawNo: (json['draw_no'] as num).toInt(),
      drawDate: json['draw_date'] as String,
      num1: (json['num1'] as num).toInt(),
      num2: (json['num2'] as num).toInt(),
      num3: (json['num3'] as num).toInt(),
      num4: (json['num4'] as num).toInt(),
      num5: (json['num5'] as num).toInt(),
      num6: (json['num6'] as num).toInt(),
      bonusNum: (json['bonus_num'] as num).toInt(),
      firstPrize: (json['first_prize'] as num?)?.toInt() ?? 0,
      firstWinners: (json['first_winners'] as num?)?.toInt() ?? 0,
      firstPerGame: (json['first_per_game'] as num?)?.toInt() ?? 0,
      secondPrize: (json['second_prize'] as num?)?.toInt() ?? 0,
      secondWinners: (json['second_winners'] as num?)?.toInt() ?? 0,
      secondPerGame: (json['second_per_game'] as num?)?.toInt() ?? 0,
      thirdPrize: (json['third_prize'] as num?)?.toInt() ?? 0,
      fourthPrize: (json['fourth_prize'] as num?)?.toInt() ?? 0,
      fifthPrize: (json['fifth_prize'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$LottoDrawImplToJson(_$LottoDrawImpl instance) =>
    <String, dynamic>{
      'draw_no': instance.drawNo,
      'draw_date': instance.drawDate,
      'num1': instance.num1,
      'num2': instance.num2,
      'num3': instance.num3,
      'num4': instance.num4,
      'num5': instance.num5,
      'num6': instance.num6,
      'bonus_num': instance.bonusNum,
      'first_prize': instance.firstPrize,
      'first_winners': instance.firstWinners,
      'first_per_game': instance.firstPerGame,
      'second_prize': instance.secondPrize,
      'second_winners': instance.secondWinners,
      'second_per_game': instance.secondPerGame,
      'third_prize': instance.thirdPrize,
      'fourth_prize': instance.fourthPrize,
      'fifth_prize': instance.fifthPrize,
    };

_$DrawListResponseImpl _$$DrawListResponseImplFromJson(
  Map<String, dynamic> json,
) => _$DrawListResponseImpl(
  draws: (json['draws'] as List<dynamic>)
      .map((e) => LottoDraw.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalCount: (json['total_count'] as num).toInt(),
  latestDraw: (json['latest_draw'] as num).toInt(),
);

Map<String, dynamic> _$$DrawListResponseImplToJson(
  _$DrawListResponseImpl instance,
) => <String, dynamic>{
  'draws': instance.draws,
  'total_count': instance.totalCount,
  'latest_draw': instance.latestDraw,
};
