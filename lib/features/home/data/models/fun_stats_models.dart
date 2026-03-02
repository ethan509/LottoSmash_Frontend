import 'package:freezed_annotation/freezed_annotation.dart';

part 'fun_stats_models.freezed.dart';
part 'fun_stats_models.g.dart';

/// 특정 회차 기록값 (당첨금 최대/최소, 당첨자 수 최대/최소 공용)
@freezed
class FunStatRecord with _$FunStatRecord {
  const factory FunStatRecord({
    @JsonKey(name: 'draw_no') required int drawNo,
    @JsonKey(name: 'draw_date') required String drawDate,
    required int value,
  }) = _FunStatRecord;

  factory FunStatRecord.fromJson(Map<String, dynamic> json) =>
      _$FunStatRecordFromJson(json);
}

/// 홀수/짝수 전체 당첨 회차 정보
@freezed
class FunStatDraw with _$FunStatDraw {
  const factory FunStatDraw({
    @JsonKey(name: 'draw_no') required int drawNo,
    @JsonKey(name: 'draw_date') required String drawDate,
    required List<int> numbers,
  }) = _FunStatDraw;

  factory FunStatDraw.fromJson(Map<String, dynamic> json) =>
      _$FunStatDrawFromJson(json);
}

/// 가장 오래 미출현한 번호 정보
@freezed
class FunStatAbsent with _$FunStatAbsent {
  const factory FunStatAbsent({
    required int number,
    @JsonKey(name: 'from_draw_no') required int fromDrawNo,
    @JsonKey(name: 'to_draw_no') required int toDrawNo,
    required int duration,
  }) = _FunStatAbsent;

  factory FunStatAbsent.fromJson(Map<String, dynamic> json) =>
      _$FunStatAbsentFromJson(json);
}

/// GET /api/lotto/fun-stats 응답
@freezed
class FunStats with _$FunStats {
  const factory FunStats({
    @JsonKey(name: 'top_max_prize') required List<FunStatRecord> topMaxPrize,
    @JsonKey(name: 'top_min_prize') required List<FunStatRecord> topMinPrize,
    @JsonKey(name: 'max_winners') required FunStatRecord maxWinners,
    @JsonKey(name: 'min_winners') required FunStatRecord minWinners,
    @JsonKey(name: 'top_longest_absent')
    required List<FunStatAbsent> topLongestAbsent,
    @JsonKey(name: 'all_odd_draws') required List<FunStatDraw> allOddDraws,
    @JsonKey(name: 'all_even_draws') required List<FunStatDraw> allEvenDraws,
    @JsonKey(name: 'calculated_at') required String calculatedAt,
    @JsonKey(name: 'based_on_draw_no') required int basedOnDrawNo,
  }) = _FunStats;

  factory FunStats.fromJson(Map<String, dynamic> json) =>
      _$FunStatsFromJson(json);
}
