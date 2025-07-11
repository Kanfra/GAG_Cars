// recommended_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'recommendedModel.freezed.dart';
part 'recommendedModel.g.dart';

@freezed
class Recommended with _$Recommended {
  const factory Recommended({
    required int id,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'item_id') required String itemId,
    @JsonKey(name: 'start_at') required String startAt,
    @JsonKey(name: 'end_at') required String endAt,
    required String status,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _Recommended;

  factory Recommended.fromJson(Map<String, dynamic> json) =>
      _$RecommendedFromJson(json);
}

@freezed
class RecommendedResponse with _$RecommendedResponse {
  const factory RecommendedResponse({
    required List<Recommended> data,
  }) = _RecommendedResponse;

  factory RecommendedResponse.fromJson(Map<String, dynamic> json) =>
      _$RecommendedResponseFromJson(json);
}