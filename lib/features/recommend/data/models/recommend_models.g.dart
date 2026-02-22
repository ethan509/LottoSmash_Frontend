// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommend_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnalysisMethodImpl _$$AnalysisMethodImplFromJson(Map<String, dynamic> json) =>
    _$AnalysisMethodImpl(
      id: (json['id'] as num).toInt(),
      code: json['code'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      isActive: json['is_active'] as bool,
      sortOrder: (json['sort_order'] as num).toInt(),
    );

Map<String, dynamic> _$$AnalysisMethodImplToJson(
  _$AnalysisMethodImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'code': instance.code,
  'name': instance.name,
  'description': instance.description,
  'category': instance.category,
  'is_active': instance.isActive,
  'sort_order': instance.sortOrder,
};

_$MethodListResponseImpl _$$MethodListResponseImplFromJson(
  Map<String, dynamic> json,
) => _$MethodListResponseImpl(
  methods: (json['methods'] as List<dynamic>)
      .map((e) => AnalysisMethod.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalCount: (json['total_count'] as num).toInt(),
);

Map<String, dynamic> _$$MethodListResponseImplToJson(
  _$MethodListResponseImpl instance,
) => <String, dynamic>{
  'methods': instance.methods,
  'total_count': instance.totalCount,
};

_$CombineMethodImpl _$$CombineMethodImplFromJson(Map<String, dynamic> json) =>
    _$CombineMethodImpl(
      code: json['code'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      sortOrder: (json['sort_order'] as num).toInt(),
    );

Map<String, dynamic> _$$CombineMethodImplToJson(_$CombineMethodImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'description': instance.description,
      'sort_order': instance.sortOrder,
    };

_$CombineMethodListResponseImpl _$$CombineMethodListResponseImplFromJson(
  Map<String, dynamic> json,
) => _$CombineMethodListResponseImpl(
  methods: (json['methods'] as List<dynamic>)
      .map((e) => CombineMethod.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$CombineMethodListResponseImplToJson(
  _$CombineMethodListResponseImpl instance,
) => <String, dynamic>{'methods': instance.methods};

_$RecommendRequestImpl _$$RecommendRequestImplFromJson(
  Map<String, dynamic> json,
) => _$RecommendRequestImpl(
  methodCodes: (json['method_codes'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  combineCode: json['combine_code'] as String,
  weights: (json['weights'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, (e as num).toDouble()),
  ),
  minMaxMode: json['min_max_mode'] as String?,
  includeBonus: json['include_bonus'] as bool? ?? false,
  usePositionConstraint: json['use_position_constraint'] as bool? ?? false,
  count: (json['count'] as num?)?.toInt() ?? 5,
);

Map<String, dynamic> _$$RecommendRequestImplToJson(
  _$RecommendRequestImpl instance,
) => <String, dynamic>{
  'method_codes': instance.methodCodes,
  'combine_code': instance.combineCode,
  'weights': instance.weights,
  'min_max_mode': instance.minMaxMode,
  'include_bonus': instance.includeBonus,
  'use_position_constraint': instance.usePositionConstraint,
  'count': instance.count,
};

_$MethodDetailImpl _$$MethodDetailImplFromJson(Map<String, dynamic> json) =>
    _$MethodDetailImpl(
      numbers: (json['numbers'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      probability: (json['probability'] as num?)?.toDouble(),
      method: json['method'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$$MethodDetailImplToJson(_$MethodDetailImpl instance) =>
    <String, dynamic>{
      'numbers': instance.numbers,
      'probability': instance.probability,
      'method': instance.method,
      'type': instance.type,
    };

_$RecommendationImpl _$$RecommendationImplFromJson(Map<String, dynamic> json) =>
    _$RecommendationImpl(
      numbers: (json['numbers'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      bonus: (json['bonus'] as num?)?.toInt(),
      methodsUsed: (json['methods_used'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      combineMethod: json['combine_method'] as String,
      confidence: (json['confidence'] as num).toDouble(),
      details:
          (json['details'] as Map<String, dynamic>?)?.map(
            (k, e) =>
                MapEntry(k, MethodDetail.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
    );

Map<String, dynamic> _$$RecommendationImplToJson(
  _$RecommendationImpl instance,
) => <String, dynamic>{
  'numbers': instance.numbers,
  'bonus': instance.bonus,
  'methods_used': instance.methodsUsed,
  'combine_method': instance.combineMethod,
  'confidence': instance.confidence,
  'details': instance.details,
};

_$RecommendResponseImpl _$$RecommendResponseImplFromJson(
  Map<String, dynamic> json,
) => _$RecommendResponseImpl(
  recommendations: (json['recommendations'] as List<dynamic>)
      .map((e) => Recommendation.fromJson(e as Map<String, dynamic>))
      .toList(),
  generatedAt: json['generated_at'] as String?,
  latestDrawNo: (json['latest_draw_no'] as num?)?.toInt(),
);

Map<String, dynamic> _$$RecommendResponseImplToJson(
  _$RecommendResponseImpl instance,
) => <String, dynamic>{
  'recommendations': instance.recommendations,
  'generated_at': instance.generatedAt,
  'latest_draw_no': instance.latestDrawNo,
};

_$RecommendationHistoryImpl _$$RecommendationHistoryImplFromJson(
  Map<String, dynamic> json,
) => _$RecommendationHistoryImpl(
  id: (json['id'] as num).toInt(),
  userId: (json['user_id'] as num).toInt(),
  methodCodes: (json['method_codes'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  combineMethod: json['combine_method'] as String,
  numbers: (json['numbers'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toList(),
  bonusNumber: (json['bonus_number'] as num?)?.toInt(),
  confidence: (json['confidence'] as num).toDouble(),
  createdAt: json['created_at'] as String,
);

Map<String, dynamic> _$$RecommendationHistoryImplToJson(
  _$RecommendationHistoryImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'method_codes': instance.methodCodes,
  'combine_method': instance.combineMethod,
  'numbers': instance.numbers,
  'bonus_number': instance.bonusNumber,
  'confidence': instance.confidence,
  'created_at': instance.createdAt,
};

_$RecommendationHistoryResponseImpl
_$$RecommendationHistoryResponseImplFromJson(Map<String, dynamic> json) =>
    _$RecommendationHistoryResponseImpl(
      recommendations:
          (json['recommendations'] as List<dynamic>?)
              ?.map(
                (e) =>
                    RecommendationHistory.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      totalCount: (json['count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$RecommendationHistoryResponseImplToJson(
  _$RecommendationHistoryResponseImpl instance,
) => <String, dynamic>{
  'recommendations': instance.recommendations,
  'count': instance.totalCount,
};
