// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NumberStatImpl _$$NumberStatImplFromJson(Map<String, dynamic> json) =>
    _$NumberStatImpl(
      number: (json['number'] as num).toInt(),
      totalCount: (json['total_count'] as num).toInt(),
      bonusCount: (json['bonus_count'] as num?)?.toInt() ?? 0,
      lastDrawNo: (json['last_draw_no'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$NumberStatImplToJson(_$NumberStatImpl instance) =>
    <String, dynamic>{
      'number': instance.number,
      'total_count': instance.totalCount,
      'bonus_count': instance.bonusCount,
      'last_draw_no': instance.lastDrawNo,
    };

_$ReappearStatImpl _$$ReappearStatImplFromJson(Map<String, dynamic> json) =>
    _$ReappearStatImpl(
      number: (json['number'] as num).toInt(),
      totalAppear: (json['total_appear'] as num).toInt(),
      reappearCount: (json['reappear_count'] as num).toInt(),
      probability: (json['probability'] as num).toDouble(),
    );

Map<String, dynamic> _$$ReappearStatImplToJson(_$ReappearStatImpl instance) =>
    <String, dynamic>{
      'number': instance.number,
      'total_appear': instance.totalAppear,
      'reappear_count': instance.reappearCount,
      'probability': instance.probability,
    };

_$StatsResponseImpl _$$StatsResponseImplFromJson(Map<String, dynamic> json) =>
    _$StatsResponseImpl(
      numberStats: (json['number_stats'] as List<dynamic>)
          .map((e) => NumberStat.fromJson(e as Map<String, dynamic>))
          .toList(),
      reappearStats: (json['reappear_stats'] as List<dynamic>)
          .map((e) => ReappearStat.fromJson(e as Map<String, dynamic>))
          .toList(),
      latestDrawNo: (json['latest_draw_no'] as num).toInt(),
    );

Map<String, dynamic> _$$StatsResponseImplToJson(_$StatsResponseImpl instance) =>
    <String, dynamic>{
      'number_stats': instance.numberStats,
      'reappear_stats': instance.reappearStats,
      'latest_draw_no': instance.latestDrawNo,
    };

_$NumberStatsResponseImpl _$$NumberStatsResponseImplFromJson(
  Map<String, dynamic> json,
) => _$NumberStatsResponseImpl(
  numberStats: (json['number_stats'] as List<dynamic>)
      .map((e) => NumberStat.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$NumberStatsResponseImplToJson(
  _$NumberStatsResponseImpl instance,
) => <String, dynamic>{'number_stats': instance.numberStats};

_$FirstLastStatImpl _$$FirstLastStatImplFromJson(Map<String, dynamic> json) =>
    _$FirstLastStatImpl(
      number: (json['number'] as num).toInt(),
      count: (json['count'] as num).toInt(),
      probability: (json['probability'] as num).toDouble(),
    );

Map<String, dynamic> _$$FirstLastStatImplToJson(_$FirstLastStatImpl instance) =>
    <String, dynamic>{
      'number': instance.number,
      'count': instance.count,
      'probability': instance.probability,
    };

_$FirstLastResponseImpl _$$FirstLastResponseImplFromJson(
  Map<String, dynamic> json,
) => _$FirstLastResponseImpl(
  firstStats: (json['first_stats'] as List<dynamic>)
      .map((e) => FirstLastStat.fromJson(e as Map<String, dynamic>))
      .toList(),
  lastStats: (json['last_stats'] as List<dynamic>)
      .map((e) => FirstLastStat.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalDraws: (json['total_draws'] as num).toInt(),
);

Map<String, dynamic> _$$FirstLastResponseImplToJson(
  _$FirstLastResponseImpl instance,
) => <String, dynamic>{
  'first_stats': instance.firstStats,
  'last_stats': instance.lastStats,
  'total_draws': instance.totalDraws,
};

_$PairStatImpl _$$PairStatImplFromJson(Map<String, dynamic> json) =>
    _$PairStatImpl(
      number1: (json['number1'] as num).toInt(),
      number2: (json['number2'] as num).toInt(),
      count: (json['count'] as num).toInt(),
      probability: (json['probability'] as num).toDouble(),
    );

Map<String, dynamic> _$$PairStatImplToJson(_$PairStatImpl instance) =>
    <String, dynamic>{
      'number1': instance.number1,
      'number2': instance.number2,
      'count': instance.count,
      'probability': instance.probability,
    };

_$PairStatsResponseImpl _$$PairStatsResponseImplFromJson(
  Map<String, dynamic> json,
) => _$PairStatsResponseImpl(
  topPairs: (json['top_pairs'] as List<dynamic>)
      .map((e) => PairStat.fromJson(e as Map<String, dynamic>))
      .toList(),
  bottomPairs: (json['bottom_pairs'] as List<dynamic>)
      .map((e) => PairStat.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalDraws: (json['total_draws'] as num).toInt(),
);

Map<String, dynamic> _$$PairStatsResponseImplToJson(
  _$PairStatsResponseImpl instance,
) => <String, dynamic>{
  'top_pairs': instance.topPairs,
  'bottom_pairs': instance.bottomPairs,
  'total_draws': instance.totalDraws,
};

_$ConsecutiveCountStatImpl _$$ConsecutiveCountStatImplFromJson(
  Map<String, dynamic> json,
) => _$ConsecutiveCountStatImpl(
  consecutiveCount: (json['consecutive_count'] as num).toInt(),
  drawCount: (json['draw_count'] as num).toInt(),
  probability: (json['probability'] as num).toDouble(),
);

Map<String, dynamic> _$$ConsecutiveCountStatImplToJson(
  _$ConsecutiveCountStatImpl instance,
) => <String, dynamic>{
  'consecutive_count': instance.consecutiveCount,
  'draw_count': instance.drawCount,
  'probability': instance.probability,
};

_$ConsecutiveExampleImpl _$$ConsecutiveExampleImplFromJson(
  Map<String, dynamic> json,
) => _$ConsecutiveExampleImpl(
  drawNo: (json['draw_no'] as num).toInt(),
  numbers: (json['numbers'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toList(),
  consecutiveCount: (json['consecutive_count'] as num).toInt(),
);

Map<String, dynamic> _$$ConsecutiveExampleImplToJson(
  _$ConsecutiveExampleImpl instance,
) => <String, dynamic>{
  'draw_no': instance.drawNo,
  'numbers': instance.numbers,
  'consecutive_count': instance.consecutiveCount,
};

_$ConsecutiveResponseImpl _$$ConsecutiveResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ConsecutiveResponseImpl(
  countStats: (json['count_stats'] as List<dynamic>)
      .map((e) => ConsecutiveCountStat.fromJson(e as Map<String, dynamic>))
      .toList(),
  recentExamples: (json['recent_examples'] as List<dynamic>)
      .map((e) => ConsecutiveExample.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalDraws: (json['total_draws'] as num).toInt(),
);

Map<String, dynamic> _$$ConsecutiveResponseImplToJson(
  _$ConsecutiveResponseImpl instance,
) => <String, dynamic>{
  'count_stats': instance.countStats,
  'recent_examples': instance.recentExamples,
  'total_draws': instance.totalDraws,
};

_$RatioStatImpl _$$RatioStatImplFromJson(Map<String, dynamic> json) =>
    _$RatioStatImpl(
      ratio: json['ratio'] as String,
      count: (json['count'] as num).toInt(),
      probability: (json['probability'] as num).toDouble(),
    );

Map<String, dynamic> _$$RatioStatImplToJson(_$RatioStatImpl instance) =>
    <String, dynamic>{
      'ratio': instance.ratio,
      'count': instance.count,
      'probability': instance.probability,
    };

_$RatioResponseImpl _$$RatioResponseImplFromJson(Map<String, dynamic> json) =>
    _$RatioResponseImpl(
      oddEvenStats: (json['odd_even_stats'] as List<dynamic>)
          .map((e) => RatioStat.fromJson(e as Map<String, dynamic>))
          .toList(),
      highLowStats: (json['high_low_stats'] as List<dynamic>)
          .map((e) => RatioStat.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalDraws: (json['total_draws'] as num).toInt(),
    );

Map<String, dynamic> _$$RatioResponseImplToJson(_$RatioResponseImpl instance) =>
    <String, dynamic>{
      'odd_even_stats': instance.oddEvenStats,
      'high_low_stats': instance.highLowStats,
      'total_draws': instance.totalDraws,
    };

_$ColorPatternImpl _$$ColorPatternImplFromJson(Map<String, dynamic> json) =>
    _$ColorPatternImpl(
      pattern: json['pattern'] as String,
      count: (json['count'] as num).toInt(),
      probability: (json['probability'] as num).toDouble(),
    );

Map<String, dynamic> _$$ColorPatternImplToJson(_$ColorPatternImpl instance) =>
    <String, dynamic>{
      'pattern': instance.pattern,
      'count': instance.count,
      'probability': instance.probability,
    };

_$ColorStatsResponseImpl _$$ColorStatsResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ColorStatsResponseImpl(
  topPatterns: (json['top_patterns'] as List<dynamic>)
      .map((e) => ColorPattern.fromJson(e as Map<String, dynamic>))
      .toList(),
  colorCounts: Map<String, int>.from(json['color_counts'] as Map),
  totalDraws: (json['total_draws'] as num).toInt(),
);

Map<String, dynamic> _$$ColorStatsResponseImplToJson(
  _$ColorStatsResponseImpl instance,
) => <String, dynamic>{
  'top_patterns': instance.topPatterns,
  'color_counts': instance.colorCounts,
  'total_draws': instance.totalDraws,
};

_$GridLineStatImpl _$$GridLineStatImplFromJson(Map<String, dynamic> json) =>
    _$GridLineStatImpl(
      line: (json['line'] as num).toInt(),
      count: (json['count'] as num).toInt(),
      probability: (json['probability'] as num).toDouble(),
    );

Map<String, dynamic> _$$GridLineStatImplToJson(_$GridLineStatImpl instance) =>
    <String, dynamic>{
      'line': instance.line,
      'count': instance.count,
      'probability': instance.probability,
    };

_$GridPatternStatImpl _$$GridPatternStatImplFromJson(
  Map<String, dynamic> json,
) => _$GridPatternStatImpl(
  distribution: json['distribution'] as String,
  count: (json['count'] as num).toInt(),
  probability: (json['probability'] as num).toDouble(),
);

Map<String, dynamic> _$$GridPatternStatImplToJson(
  _$GridPatternStatImpl instance,
) => <String, dynamic>{
  'distribution': instance.distribution,
  'count': instance.count,
  'probability': instance.probability,
};

_$GridResponseImpl _$$GridResponseImplFromJson(Map<String, dynamic> json) =>
    _$GridResponseImpl(
      rowStats: (json['row_stats'] as List<dynamic>)
          .map((e) => GridLineStat.fromJson(e as Map<String, dynamic>))
          .toList(),
      colStats: (json['col_stats'] as List<dynamic>)
          .map((e) => GridLineStat.fromJson(e as Map<String, dynamic>))
          .toList(),
      topRowPatterns: (json['top_row_patterns'] as List<dynamic>)
          .map((e) => GridPatternStat.fromJson(e as Map<String, dynamic>))
          .toList(),
      topColPatterns: (json['top_col_patterns'] as List<dynamic>)
          .map((e) => GridPatternStat.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GridResponseImplToJson(_$GridResponseImpl instance) =>
    <String, dynamic>{
      'row_stats': instance.rowStats,
      'col_stats': instance.colStats,
      'top_row_patterns': instance.topRowPatterns,
      'top_col_patterns': instance.topColPatterns,
    };

_$GridPatternCellImpl _$$GridPatternCellImplFromJson(
  Map<String, dynamic> json,
) => _$GridPatternCellImpl(
  number: (json['number'] as num).toInt(),
  row: (json['row'] as num).toInt(),
  col: (json['col'] as num).toInt(),
  rowProb: (json['row_prob'] as num).toDouble(),
  colProb: (json['col_prob'] as num).toDouble(),
  score: (json['score'] as num).toDouble(),
  isEmpty: json['is_empty'] as bool,
);

Map<String, dynamic> _$$GridPatternCellImplToJson(
  _$GridPatternCellImpl instance,
) => <String, dynamic>{
  'number': instance.number,
  'row': instance.row,
  'col': instance.col,
  'row_prob': instance.rowProb,
  'col_prob': instance.colProb,
  'score': instance.score,
  'is_empty': instance.isEmpty,
};

_$GridPatternResponseImpl _$$GridPatternResponseImplFromJson(
  Map<String, dynamic> json,
) => _$GridPatternResponseImpl(
  cells: (json['cells'] as List<dynamic>)
      .map(
        (e) => (e as List<dynamic>)
            .map((e) => GridPatternCell.fromJson(e as Map<String, dynamic>))
            .toList(),
      )
      .toList(),
  rowScores: (json['row_scores'] as List<dynamic>)
      .map((e) => (e as num).toDouble())
      .toList(),
  colScores: (json['col_scores'] as List<dynamic>)
      .map((e) => (e as num).toDouble())
      .toList(),
  maxScore: (json['max_score'] as num).toDouble(),
  latestDrawNo: (json['latest_draw_no'] as num).toInt(),
);

Map<String, dynamic> _$$GridPatternResponseImplToJson(
  _$GridPatternResponseImpl instance,
) => <String, dynamic>{
  'cells': instance.cells,
  'row_scores': instance.rowScores,
  'col_scores': instance.colScores,
  'max_score': instance.maxScore,
  'latest_draw_no': instance.latestDrawNo,
};

_$BayesianNumberImpl _$$BayesianNumberImplFromJson(Map<String, dynamic> json) =>
    _$BayesianNumberImpl(
      number: (json['number'] as num).toInt(),
      prior: (json['prior'] as num).toDouble(),
      likelihood: (json['likelihood'] as num).toDouble(),
      posterior: (json['posterior'] as num).toDouble(),
      recentCount: (json['recent_count'] as num).toInt(),
      expectedCount: (json['expected_count'] as num).toDouble(),
      deviation: (json['deviation'] as num).toDouble(),
      status: json['status'] as String,
      lastAppearDraw: (json['last_appear_draw'] as num).toInt(),
      gapSinceLast: (json['gap_since_last'] as num).toInt(),
    );

Map<String, dynamic> _$$BayesianNumberImplToJson(
  _$BayesianNumberImpl instance,
) => <String, dynamic>{
  'number': instance.number,
  'prior': instance.prior,
  'likelihood': instance.likelihood,
  'posterior': instance.posterior,
  'recent_count': instance.recentCount,
  'expected_count': instance.expectedCount,
  'deviation': instance.deviation,
  'status': instance.status,
  'last_appear_draw': instance.lastAppearDraw,
  'gap_since_last': instance.gapSinceLast,
};

_$BayesianResponseImpl _$$BayesianResponseImplFromJson(
  Map<String, dynamic> json,
) => _$BayesianResponseImpl(
  numbers: (json['numbers'] as List<dynamic>)
      .map((e) => BayesianNumber.fromJson(e as Map<String, dynamic>))
      .toList(),
  hotNumbers: (json['hot_numbers'] as List<dynamic>)
      .map((e) => BayesianNumber.fromJson(e as Map<String, dynamic>))
      .toList(),
  coldNumbers: (json['cold_numbers'] as List<dynamic>)
      .map((e) => BayesianNumber.fromJson(e as Map<String, dynamic>))
      .toList(),
  windowSize: (json['window_size'] as num).toInt(),
  totalDraws: (json['total_draws'] as num).toInt(),
);

Map<String, dynamic> _$$BayesianResponseImplToJson(
  _$BayesianResponseImpl instance,
) => <String, dynamic>{
  'numbers': instance.numbers,
  'hot_numbers': instance.hotNumbers,
  'cold_numbers': instance.coldNumbers,
  'window_size': instance.windowSize,
  'total_draws': instance.totalDraws,
};

_$BayesianHistoryEntryImpl _$$BayesianHistoryEntryImplFromJson(
  Map<String, dynamic> json,
) => _$BayesianHistoryEntryImpl(
  drawNo: (json['draw_no'] as num).toInt(),
  prior: (json['prior'] as num).toDouble(),
  posterior: (json['posterior'] as num).toDouble(),
  appeared: json['appeared'] as bool,
);

Map<String, dynamic> _$$BayesianHistoryEntryImplToJson(
  _$BayesianHistoryEntryImpl instance,
) => <String, dynamic>{
  'draw_no': instance.drawNo,
  'prior': instance.prior,
  'posterior': instance.posterior,
  'appeared': instance.appeared,
};

_$BayesianHistoryResponseImpl _$$BayesianHistoryResponseImplFromJson(
  Map<String, dynamic> json,
) => _$BayesianHistoryResponseImpl(
  number: (json['number'] as num).toInt(),
  history: (json['history'] as List<dynamic>)
      .map((e) => BayesianHistoryEntry.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$BayesianHistoryResponseImplToJson(
  _$BayesianHistoryResponseImpl instance,
) => <String, dynamic>{'number': instance.number, 'history': instance.history};

_$AnalysisStatImpl _$$AnalysisStatImplFromJson(Map<String, dynamic> json) =>
    _$AnalysisStatImpl(
      drawNo: (json['draw_no'] as num).toInt(),
      number: (json['number'] as num).toInt(),
      totalCount: (json['total_count'] as num).toInt(),
      totalProb: (json['total_prob'] as num).toDouble(),
      bonusCount: (json['bonus_count'] as num).toInt(),
      bonusProb: (json['bonus_prob'] as num).toDouble(),
      firstCount: (json['first_count'] as num).toInt(),
      firstProb: (json['first_prob'] as num).toDouble(),
      lastCount: (json['last_count'] as num).toInt(),
      lastProb: (json['last_prob'] as num).toDouble(),
      reappearTotal: (json['reappear_total'] as num).toInt(),
      reappearCount: (json['reappear_count'] as num).toInt(),
      reappearProb: (json['reappear_prob'] as num).toDouble(),
      bayesianPrior: (json['bayesian_prior'] as num).toDouble(),
      bayesianPost: (json['bayesian_post'] as num).toDouble(),
      colorCount: (json['color_count'] as num).toInt(),
      colorProb: (json['color_prob'] as num).toDouble(),
      rowCount: (json['row_count'] as num).toInt(),
      rowProb: (json['row_prob'] as num).toDouble(),
      colCount: (json['col_count'] as num).toInt(),
      colProb: (json['col_prob'] as num).toDouble(),
      appeared: json['appeared'] as bool,
    );

Map<String, dynamic> _$$AnalysisStatImplToJson(_$AnalysisStatImpl instance) =>
    <String, dynamic>{
      'draw_no': instance.drawNo,
      'number': instance.number,
      'total_count': instance.totalCount,
      'total_prob': instance.totalProb,
      'bonus_count': instance.bonusCount,
      'bonus_prob': instance.bonusProb,
      'first_count': instance.firstCount,
      'first_prob': instance.firstProb,
      'last_count': instance.lastCount,
      'last_prob': instance.lastProb,
      'reappear_total': instance.reappearTotal,
      'reappear_count': instance.reappearCount,
      'reappear_prob': instance.reappearProb,
      'bayesian_prior': instance.bayesianPrior,
      'bayesian_post': instance.bayesianPost,
      'color_count': instance.colorCount,
      'color_prob': instance.colorProb,
      'row_count': instance.rowCount,
      'row_prob': instance.rowProb,
      'col_count': instance.colCount,
      'col_prob': instance.colProb,
      'appeared': instance.appeared,
    };

_$AnalysisResponseImpl _$$AnalysisResponseImplFromJson(
  Map<String, dynamic> json,
) => _$AnalysisResponseImpl(
  stats: (json['stats'] as List<dynamic>)
      .map((e) => AnalysisStat.fromJson(e as Map<String, dynamic>))
      .toList(),
  latestDrawNo: (json['latest_draw_no'] as num).toInt(),
);

Map<String, dynamic> _$$AnalysisResponseImplToJson(
  _$AnalysisResponseImpl instance,
) => <String, dynamic>{
  'stats': instance.stats,
  'latest_draw_no': instance.latestDrawNo,
};
