import 'package:freezed_annotation/freezed_annotation.dart';

part 'stats_models.freezed.dart';
part 'stats_models.g.dart';

@freezed
class NumberStat with _$NumberStat {
  const factory NumberStat({
    required int number,
    @JsonKey(name: 'total_count') required int totalCount,
    @JsonKey(name: 'bonus_count') @Default(0) int bonusCount,
    @JsonKey(name: 'last_draw_no') @Default(0) int lastDrawNo,
  }) = _NumberStat;

  factory NumberStat.fromJson(Map<String, dynamic> json) =>
      _$NumberStatFromJson(json);
}

@freezed
class ReappearStat with _$ReappearStat {
  const factory ReappearStat({
    required int number,
    @JsonKey(name: 'total_appear') required int totalAppear,
    @JsonKey(name: 'reappear_count') required int reappearCount,
    required double probability,
  }) = _ReappearStat;

  factory ReappearStat.fromJson(Map<String, dynamic> json) =>
      _$ReappearStatFromJson(json);
}

@freezed
class StatsResponse with _$StatsResponse {
  const factory StatsResponse({
    @JsonKey(name: 'number_stats') required List<NumberStat> numberStats,
    @JsonKey(name: 'reappear_stats') required List<ReappearStat> reappearStats,
    @JsonKey(name: 'latest_draw_no') required int latestDrawNo,
  }) = _StatsResponse;

  factory StatsResponse.fromJson(Map<String, dynamic> json) =>
      _$StatsResponseFromJson(json);
}

@freezed
class NumberStatsResponse with _$NumberStatsResponse {
  const factory NumberStatsResponse({
    @JsonKey(name: 'number_stats') required List<NumberStat> numberStats,
  }) = _NumberStatsResponse;

  factory NumberStatsResponse.fromJson(Map<String, dynamic> json) =>
      _$NumberStatsResponseFromJson(json);
}

@freezed
class FirstLastStat with _$FirstLastStat {
  const factory FirstLastStat({
    required int number,
    required int count,
    required double probability,
  }) = _FirstLastStat;

  factory FirstLastStat.fromJson(Map<String, dynamic> json) =>
      _$FirstLastStatFromJson(json);
}

@freezed
class FirstLastResponse with _$FirstLastResponse {
  const factory FirstLastResponse({
    @JsonKey(name: 'first_stats') required List<FirstLastStat> firstStats,
    @JsonKey(name: 'last_stats') required List<FirstLastStat> lastStats,
    @JsonKey(name: 'total_draws') required int totalDraws,
  }) = _FirstLastResponse;

  factory FirstLastResponse.fromJson(Map<String, dynamic> json) =>
      _$FirstLastResponseFromJson(json);
}

@freezed
class PairStat with _$PairStat {
  const factory PairStat({
    @JsonKey(name: 'number1') required int number1,
    @JsonKey(name: 'number2') required int number2,
    required int count,
    required double probability,
  }) = _PairStat;

  factory PairStat.fromJson(Map<String, dynamic> json) =>
      _$PairStatFromJson(json);
}

@freezed
class PairStatsResponse with _$PairStatsResponse {
  const factory PairStatsResponse({
    @JsonKey(name: 'top_pairs') required List<PairStat> topPairs,
    @JsonKey(name: 'bottom_pairs') required List<PairStat> bottomPairs,
    @JsonKey(name: 'total_draws') required int totalDraws,
  }) = _PairStatsResponse;

  factory PairStatsResponse.fromJson(Map<String, dynamic> json) =>
      _$PairStatsResponseFromJson(json);
}

@freezed
class ConsecutiveCountStat with _$ConsecutiveCountStat {
  const factory ConsecutiveCountStat({
    @JsonKey(name: 'consecutive_count') required int consecutiveCount,
    @JsonKey(name: 'draw_count') required int drawCount,
    required double probability,
  }) = _ConsecutiveCountStat;

  factory ConsecutiveCountStat.fromJson(Map<String, dynamic> json) =>
      _$ConsecutiveCountStatFromJson(json);
}

@freezed
class ConsecutiveExample with _$ConsecutiveExample {
  const factory ConsecutiveExample({
    @JsonKey(name: 'draw_no') required int drawNo,
    required List<int> numbers,
    @JsonKey(name: 'consecutive_count') required int consecutiveCount,
  }) = _ConsecutiveExample;

  factory ConsecutiveExample.fromJson(Map<String, dynamic> json) =>
      _$ConsecutiveExampleFromJson(json);
}

@freezed
class ConsecutiveResponse with _$ConsecutiveResponse {
  const factory ConsecutiveResponse({
    @JsonKey(name: 'count_stats') required List<ConsecutiveCountStat> countStats,
    @JsonKey(name: 'recent_examples') required List<ConsecutiveExample> recentExamples,
    @JsonKey(name: 'total_draws') required int totalDraws,
  }) = _ConsecutiveResponse;

  factory ConsecutiveResponse.fromJson(Map<String, dynamic> json) =>
      _$ConsecutiveResponseFromJson(json);
}

@freezed
class RatioStat with _$RatioStat {
  const factory RatioStat({
    required String ratio,
    required int count,
    required double probability,
  }) = _RatioStat;

  factory RatioStat.fromJson(Map<String, dynamic> json) =>
      _$RatioStatFromJson(json);
}

@freezed
class RatioResponse with _$RatioResponse {
  const factory RatioResponse({
    @JsonKey(name: 'odd_even_stats') required List<RatioStat> oddEvenStats,
    @JsonKey(name: 'high_low_stats') required List<RatioStat> highLowStats,
    @JsonKey(name: 'total_draws') required int totalDraws,
  }) = _RatioResponse;

  factory RatioResponse.fromJson(Map<String, dynamic> json) =>
      _$RatioResponseFromJson(json);
}

@freezed
class ColorPattern with _$ColorPattern {
  const factory ColorPattern({
    required String pattern,
    required int count,
    required double probability,
  }) = _ColorPattern;

  factory ColorPattern.fromJson(Map<String, dynamic> json) =>
      _$ColorPatternFromJson(json);
}

@freezed
class ColorStatsResponse with _$ColorStatsResponse {
  const factory ColorStatsResponse({
    @JsonKey(name: 'top_patterns') required List<ColorPattern> topPatterns,
    @JsonKey(name: 'color_counts') required Map<String, int> colorCounts,
    @JsonKey(name: 'total_draws') required int totalDraws,
  }) = _ColorStatsResponse;

  factory ColorStatsResponse.fromJson(Map<String, dynamic> json) =>
      _$ColorStatsResponseFromJson(json);
}

@freezed
class GridLineStat with _$GridLineStat {
  const factory GridLineStat({
    required int line,
    required int count,
    required double probability,
  }) = _GridLineStat;

  factory GridLineStat.fromJson(Map<String, dynamic> json) =>
      _$GridLineStatFromJson(json);
}

@freezed
class GridPatternStat with _$GridPatternStat {
  const factory GridPatternStat({
    required String distribution,
    required int count,
    required double probability,
  }) = _GridPatternStat;

  factory GridPatternStat.fromJson(Map<String, dynamic> json) =>
      _$GridPatternStatFromJson(json);
}

@freezed
class GridResponse with _$GridResponse {
  const factory GridResponse({
    @JsonKey(name: 'row_stats') required List<GridLineStat> rowStats,
    @JsonKey(name: 'col_stats') required List<GridLineStat> colStats,
    @JsonKey(name: 'top_row_patterns') required List<GridPatternStat> topRowPatterns,
    @JsonKey(name: 'top_col_patterns') required List<GridPatternStat> topColPatterns,
  }) = _GridResponse;

  factory GridResponse.fromJson(Map<String, dynamic> json) =>
      _$GridResponseFromJson(json);
}

@freezed
class GridPatternCell with _$GridPatternCell {
  const factory GridPatternCell({
    required int number,
    required int row,
    required int col,
    @JsonKey(name: 'row_prob') required double rowProb,
    @JsonKey(name: 'col_prob') required double colProb,
    required double score,
    @JsonKey(name: 'is_empty') required bool isEmpty,
  }) = _GridPatternCell;

  factory GridPatternCell.fromJson(Map<String, dynamic> json) =>
      _$GridPatternCellFromJson(json);
}

@freezed
class GridPatternResponse with _$GridPatternResponse {
  const factory GridPatternResponse({
    required List<List<GridPatternCell>> cells,
    @JsonKey(name: 'row_scores') required List<double> rowScores,
    @JsonKey(name: 'col_scores') required List<double> colScores,
    @JsonKey(name: 'max_score') required double maxScore,
    @JsonKey(name: 'latest_draw_no') required int latestDrawNo,
  }) = _GridPatternResponse;

  factory GridPatternResponse.fromJson(Map<String, dynamic> json) =>
      _$GridPatternResponseFromJson(json);
}

@freezed
class GridEntropyCell with _$GridEntropyCell {
  const factory GridEntropyCell({
    required int number,
    required int row,
    required int col,
    @JsonKey(name: 'entropy_score') required double entropyScore,
    @JsonKey(name: 'is_empty') required bool isEmpty,
  }) = _GridEntropyCell;

  factory GridEntropyCell.fromJson(Map<String, dynamic> json) =>
      _$GridEntropyCellFromJson(json);
}

@freezed
class GridEntropyResponse with _$GridEntropyResponse {
  const factory GridEntropyResponse({
    required List<List<GridEntropyCell>> cells,
    @JsonKey(name: 'row_scores') required List<double> rowScores,
    @JsonKey(name: 'col_scores') required List<double> colScores,
    @JsonKey(name: 'max_score') required double maxScore,
    @JsonKey(name: 'avg_entropy') required double avgEntropy,
    @JsonKey(name: 'latest_draw_no') required int latestDrawNo,
  }) = _GridEntropyResponse;

  factory GridEntropyResponse.fromJson(Map<String, dynamic> json) =>
      _$GridEntropyResponseFromJson(json);
}

@freezed
class BayesianNumber with _$BayesianNumber {
  const factory BayesianNumber({
    required int number,
    required double prior,
    required double likelihood,
    required double posterior,
    @JsonKey(name: 'recent_count') required int recentCount,
    @JsonKey(name: 'expected_count') required double expectedCount,
    required double deviation,
    required String status,
    @JsonKey(name: 'last_appear_draw') required int lastAppearDraw,
    @JsonKey(name: 'gap_since_last') required int gapSinceLast,
  }) = _BayesianNumber;

  factory BayesianNumber.fromJson(Map<String, dynamic> json) =>
      _$BayesianNumberFromJson(json);
}

@freezed
class BayesianResponse with _$BayesianResponse {
  const factory BayesianResponse({
    required List<BayesianNumber> numbers,
    @JsonKey(name: 'hot_numbers') required List<BayesianNumber> hotNumbers,
    @JsonKey(name: 'cold_numbers') required List<BayesianNumber> coldNumbers,
    @JsonKey(name: 'window_size') required int windowSize,
    @JsonKey(name: 'total_draws') required int totalDraws,
  }) = _BayesianResponse;

  factory BayesianResponse.fromJson(Map<String, dynamic> json) =>
      _$BayesianResponseFromJson(json);
}

@freezed
class BayesianHistoryEntry with _$BayesianHistoryEntry {
  const factory BayesianHistoryEntry({
    @JsonKey(name: 'draw_no') required int drawNo,
    required double prior,
    required double posterior,
    required bool appeared,
  }) = _BayesianHistoryEntry;

  factory BayesianHistoryEntry.fromJson(Map<String, dynamic> json) =>
      _$BayesianHistoryEntryFromJson(json);
}

@freezed
class BayesianHistoryResponse with _$BayesianHistoryResponse {
  const factory BayesianHistoryResponse({
    required int number,
    required List<BayesianHistoryEntry> history,
  }) = _BayesianHistoryResponse;

  factory BayesianHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$BayesianHistoryResponseFromJson(json);
}

@freezed
class AnalysisStat with _$AnalysisStat {
  const factory AnalysisStat({
    @JsonKey(name: 'draw_no') required int drawNo,
    required int number,
    @JsonKey(name: 'total_count') required int totalCount,
    @JsonKey(name: 'total_prob') required double totalProb,
    @JsonKey(name: 'bonus_count') required int bonusCount,
    @JsonKey(name: 'bonus_prob') required double bonusProb,
    @JsonKey(name: 'first_count') required int firstCount,
    @JsonKey(name: 'first_prob') required double firstProb,
    @JsonKey(name: 'last_count') required int lastCount,
    @JsonKey(name: 'last_prob') required double lastProb,
    @JsonKey(name: 'reappear_total') required int reappearTotal,
    @JsonKey(name: 'reappear_count') required int reappearCount,
    @JsonKey(name: 'reappear_prob') required double reappearProb,
    @JsonKey(name: 'bayesian_prior') required double bayesianPrior,
    @JsonKey(name: 'bayesian_post') required double bayesianPost,
    @JsonKey(name: 'color_count') required int colorCount,
    @JsonKey(name: 'color_prob') required double colorProb,
    @JsonKey(name: 'row_count') required int rowCount,
    @JsonKey(name: 'row_prob') required double rowProb,
    @JsonKey(name: 'col_count') required int colCount,
    @JsonKey(name: 'col_prob') required double colProb,
    required bool appeared,
  }) = _AnalysisStat;

  factory AnalysisStat.fromJson(Map<String, dynamic> json) =>
      _$AnalysisStatFromJson(json);
}

@freezed
class AnalysisResponse with _$AnalysisResponse {
  const factory AnalysisResponse({
    required List<AnalysisStat> stats,
    @JsonKey(name: 'latest_draw_no') required int latestDrawNo,
  }) = _AnalysisResponse;

  factory AnalysisResponse.fromJson(Map<String, dynamic> json) =>
      _$AnalysisResponseFromJson(json);
}
