import 'package:freezed_annotation/freezed_annotation.dart';

part 'recommend_models.freezed.dart';
part 'recommend_models.g.dart';

@freezed
class AnalysisMethod with _$AnalysisMethod {
  const factory AnalysisMethod({
    required int id,
    required String code,
    required String name,
    required String description,
    required String category,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'sort_order') required int sortOrder,
  }) = _AnalysisMethod;

  factory AnalysisMethod.fromJson(Map<String, dynamic> json) =>
      _$AnalysisMethodFromJson(json);
}

@freezed
class MethodListResponse with _$MethodListResponse {
  const factory MethodListResponse({
    required List<AnalysisMethod> methods,
    @JsonKey(name: 'total_count') required int totalCount,
  }) = _MethodListResponse;

  factory MethodListResponse.fromJson(Map<String, dynamic> json) =>
      _$MethodListResponseFromJson(json);
}

@freezed
class CombineMethod with _$CombineMethod {
  const factory CombineMethod({
    required String code,
    required String name,
    required String description,
    @JsonKey(name: 'sort_order') required int sortOrder,
  }) = _CombineMethod;

  factory CombineMethod.fromJson(Map<String, dynamic> json) =>
      _$CombineMethodFromJson(json);
}

@freezed
class CombineMethodListResponse with _$CombineMethodListResponse {
  const factory CombineMethodListResponse({
    required List<CombineMethod> methods,
  }) = _CombineMethodListResponse;

  factory CombineMethodListResponse.fromJson(Map<String, dynamic> json) =>
      _$CombineMethodListResponseFromJson(json);
}

@freezed
class RecommendRequest with _$RecommendRequest {
  const factory RecommendRequest({
    @JsonKey(name: 'method_codes') required List<String> methodCodes,
    @JsonKey(name: 'combine_code') required String combineCode,
    Map<String, double>? weights,
    @JsonKey(name: 'min_max_mode') String? minMaxMode,
    @JsonKey(name: 'include_bonus') @Default(false) bool includeBonus,
    @JsonKey(name: 'use_position_constraint') @Default(false) bool usePositionConstraint,
    @Default(5) int count,
  }) = _RecommendRequest;

  factory RecommendRequest.fromJson(Map<String, dynamic> json) =>
      _$RecommendRequestFromJson(json);
}

@freezed
class MethodDetail with _$MethodDetail {
  const factory MethodDetail({
    List<int>? numbers,
    double? probability,
    String? method,
    String? type,
  }) = _MethodDetail;

  factory MethodDetail.fromJson(Map<String, dynamic> json) =>
      _$MethodDetailFromJson(json);
}

@freezed
class Recommendation with _$Recommendation {
  const factory Recommendation({
    required List<int> numbers,
    int? bonus,
    @JsonKey(name: 'methods_used') required List<String> methodsUsed,
    @JsonKey(name: 'combine_method') required String combineMethod,
    required double confidence,
    @Default({}) Map<String, MethodDetail> details,
  }) = _Recommendation;

  factory Recommendation.fromJson(Map<String, dynamic> json) =>
      _$RecommendationFromJson(json);
}

@freezed
class RecommendResponse with _$RecommendResponse {
  const factory RecommendResponse({
    required List<Recommendation> recommendations,
    @JsonKey(name: 'generated_at') String? generatedAt,
    @JsonKey(name: 'latest_draw_no') int? latestDrawNo,
  }) = _RecommendResponse;

  factory RecommendResponse.fromJson(Map<String, dynamic> json) =>
      _$RecommendResponseFromJson(json);
}

@freezed
class RecommendationHistory with _$RecommendationHistory {
  const factory RecommendationHistory({
    required int id,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'method_codes') required List<String> methodCodes,
    @JsonKey(name: 'combine_method') required String combineMethod,
    required List<int> numbers,
    @JsonKey(name: 'bonus_number') int? bonusNumber,
    required double confidence,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _RecommendationHistory;

  factory RecommendationHistory.fromJson(Map<String, dynamic> json) =>
      _$RecommendationHistoryFromJson(json);
}

@freezed
class RecommendationHistoryResponse with _$RecommendationHistoryResponse {
  const factory RecommendationHistoryResponse({
    required List<RecommendationHistory> recommendations,
    @JsonKey(name: 'count') @Default(0) int totalCount,
  }) = _RecommendationHistoryResponse;

  factory RecommendationHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$RecommendationHistoryResponseFromJson(json);
}
