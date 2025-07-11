// trending_make_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'trendingMakeModel.freezed.dart';
part 'trendingMakeModel.g.dart';

@freezed
class TrendingMake with _$TrendingMake {
  const factory TrendingMake({
    required int id,
    @JsonKey(name: 'user_id') required String userId,
    required String name,
    required String slug,
    required String image,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _TrendingMake;

  factory TrendingMake.fromJson(Map<String, dynamic> json) =>
      _$TrendingMakeFromJson(json);
}

@freezed
class TrendingMakeResponse with _$TrendingMakeResponse {
  const factory TrendingMakeResponse(Map<String, dynamic> json, {
    required List<TrendingMake> data,
  }) = _TrendingMakeResponse;

  factory TrendingMakeResponse.fromJson(Map<String, dynamic> json) =>
      _$TrendingMakeResponseFromJson(json);
}