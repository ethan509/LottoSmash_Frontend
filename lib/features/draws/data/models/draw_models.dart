import 'package:freezed_annotation/freezed_annotation.dart';

part 'draw_models.freezed.dart';
part 'draw_models.g.dart';

@freezed
class LottoDraw with _$LottoDraw {
  const factory LottoDraw({
    @JsonKey(name: 'draw_no') required int drawNo,
    @JsonKey(name: 'draw_date') required String drawDate,
    required int num1,
    required int num2,
    required int num3,
    required int num4,
    required int num5,
    required int num6,
    @JsonKey(name: 'bonus_num') required int bonusNum,
    @JsonKey(name: 'first_prize') @Default(0) int firstPrize,
    @JsonKey(name: 'first_winners') @Default(0) int firstWinners,
    @JsonKey(name: 'first_per_game') @Default(0) int firstPerGame,
    @JsonKey(name: 'second_prize') @Default(0) int secondPrize,
    @JsonKey(name: 'second_winners') @Default(0) int secondWinners,
    @JsonKey(name: 'second_per_game') @Default(0) int secondPerGame,
    @JsonKey(name: 'third_prize') @Default(0) int thirdPrize,
    @JsonKey(name: 'third_winners') @Default(0) int thirdWinners,
    @JsonKey(name: 'third_per_game') @Default(0) int thirdPerGame,
    @JsonKey(name: 'fourth_prize') @Default(0) int fourthPrize,
    @JsonKey(name: 'fourth_winners') @Default(0) int fourthWinners,
    @JsonKey(name: 'fourth_per_game') @Default(0) int fourthPerGame,
    @JsonKey(name: 'fifth_prize') @Default(0) int fifthPrize,
    @JsonKey(name: 'fifth_winners') @Default(0) int fifthWinners,
    @JsonKey(name: 'fifth_per_game') @Default(0) int fifthPerGame,
  }) = _LottoDraw;

  factory LottoDraw.fromJson(Map<String, dynamic> json) =>
      _$LottoDrawFromJson(json);
}

extension LottoDrawX on LottoDraw {
  List<int> get numbers => [num1, num2, num3, num4, num5, num6];
}

@freezed
class DrawListResponse with _$DrawListResponse {
  const factory DrawListResponse({
    required List<LottoDraw> draws,
    @JsonKey(name: 'total_count') required int totalCount,
    @JsonKey(name: 'latest_draw') required int latestDraw,
  }) = _DrawListResponse;

  factory DrawListResponse.fromJson(Map<String, dynamic> json) =>
      _$DrawListResponseFromJson(json);
}
