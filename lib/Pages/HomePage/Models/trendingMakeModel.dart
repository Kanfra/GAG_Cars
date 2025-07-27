import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'trendingMakeModel.freezed.dart';
part 'trendingMakeModel.g.dart';

@freezed
class TrendingMake with _$TrendingMake {
  const factory TrendingMake({
    required int id,
    @JsonKey(name: 'user_id') String? userId,
    required String name,
    required String slug,
    required String image,
    @JsonKey(name: 'created_at') required String createdAt, // Changed to String
    @JsonKey(name: 'updated_at') required String updatedAt, // Changed to String
  }) = _TrendingMake;

  factory TrendingMake.fromJson(Map<String, dynamic> json) =>
      _$TrendingMakeFromJson(json);
}

@freezed
class TrendingMakeResponse with _$TrendingMakeResponse {
  const factory TrendingMakeResponse({
    required List<TrendingMake> data,
    required PaginationLinks links,
    required PaginationMeta meta,
  }) = _TrendingMakeResponse;

  factory TrendingMakeResponse.fromJson(Map<String, dynamic> json) =>
      _$TrendingMakeResponseFromJson(json);
}

@freezed
class PaginationLinks with _$PaginationLinks {
  const factory PaginationLinks({
    required String first,
    required String last,
    String? prev,
    String? next,
  }) = _PaginationLinks;

  factory PaginationLinks.fromJson(Map<String, dynamic> json) =>
      _$PaginationLinksFromJson(json);
}

@freezed
class PaginationMeta with _$PaginationMeta {
  const factory PaginationMeta({
    @JsonKey(name: 'current_page') required int currentPage,
    required int from,
    @JsonKey(name: 'last_page') required int lastPage,
    required List<PaginationMetaLink> links,
    required String path,
    @JsonKey(name: 'per_page') required int perPage,
    required int to,
    required int total,
  }) = _PaginationMeta;

  factory PaginationMeta.fromJson(Map<String, dynamic> json) =>
      _$PaginationMetaFromJson(json);
}

@freezed
class PaginationMetaLink with _$PaginationMetaLink {
  const factory PaginationMetaLink({
    String? url,
    required String label,
    required bool active,
  }) = _PaginationMetaLink;

  factory PaginationMetaLink.fromJson(Map<String, dynamic> json) =>
      _$PaginationMetaLinkFromJson(json);
}