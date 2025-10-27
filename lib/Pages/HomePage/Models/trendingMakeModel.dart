import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'trendingMakeModel.freezed.dart';
part 'trendingMakeModel.g.dart';

@freezed
class TrendingMake with _$TrendingMake {
  const factory TrendingMake({
    @JsonKey(fromJson: _safeParseInt) required int id,
    @JsonKey(name: 'user_id', fromJson: _safeParseString) String? userId,
    @JsonKey(fromJson: _safeParseStringWithDefault) required String name,
    @JsonKey(fromJson: _safeParseStringWithDefault) required String slug,
    @JsonKey(fromJson: _safeParseStringWithDefault) required String image,
    @JsonKey(name: 'created_at', fromJson: _safeParseStringWithDefault) required String createdAt,
    @JsonKey(name: 'updated_at', fromJson: _safeParseStringWithDefault) required String updatedAt,
  }) = _TrendingMake;

  factory TrendingMake.fromJson(Map<String, dynamic> json) =>
      _$TrendingMakeFromJson(json);
}

@freezed
class TrendingMakeResponse with _$TrendingMakeResponse {
  const factory TrendingMakeResponse({
    @JsonKey(fromJson: _safeParseTrendingMakeList) required List<TrendingMake> data,
    @JsonKey(fromJson: _safeParsePaginationLinks) required PaginationLinks links,
    @JsonKey(fromJson: _safeParsePaginationMeta) required PaginationMeta meta,
  }) = _TrendingMakeResponse;

  factory TrendingMakeResponse.fromJson(Map<String, dynamic> json) =>
      _$TrendingMakeResponseFromJson(json);
}

@freezed
class PaginationLinks with _$PaginationLinks {
  const factory PaginationLinks({
    @JsonKey(fromJson: _safeParseStringWithDefault) required String first,
    @JsonKey(fromJson: _safeParseStringWithDefault) required String last,
    @JsonKey(fromJson: _safeParseString) String? prev,
    @JsonKey(fromJson: _safeParseString) String? next,
  }) = _PaginationLinks;

  factory PaginationLinks.fromJson(Map<String, dynamic> json) =>
      _$PaginationLinksFromJson(json);
}

@freezed
class PaginationMeta with _$PaginationMeta {
  const factory PaginationMeta({
    @JsonKey(name: 'current_page', fromJson: _safeParseIntWithDefault) required int currentPage,
    @JsonKey(fromJson: _safeParseIntWithDefault) required int from,
    @JsonKey(name: 'last_page', fromJson: _safeParseIntWithDefault) required int lastPage,
    @JsonKey(fromJson: _safeParsePaginationMetaLinkList) required List<PaginationMetaLink> links,
    @JsonKey(fromJson: _safeParseStringWithDefault) required String path,
    @JsonKey(name: 'per_page', fromJson: _safeParseIntWithDefault) required int perPage,
    @JsonKey(fromJson: _safeParseIntWithDefault) required int to,
    @JsonKey(fromJson: _safeParseIntWithDefault) required int total,
  }) = _PaginationMeta;

  factory PaginationMeta.fromJson(Map<String, dynamic> json) =>
      _$PaginationMetaFromJson(json);
}

@freezed
class PaginationMetaLink with _$PaginationMetaLink {
  const factory PaginationMetaLink({
    @JsonKey(fromJson: _safeParseString) String? url,
    @JsonKey(fromJson: _safeParseStringWithDefault) required String label,
    @JsonKey(fromJson: _safeParseBoolWithDefault) required bool active,
  }) = _PaginationMetaLink;

  factory PaginationMetaLink.fromJson(Map<String, dynamic> json) =>
      _$PaginationMetaLinkFromJson(json);
}

// Helper functions for safe parsing (used in @JsonKey fromJson parameters)
int _safeParseInt(dynamic value) => _safeParseIntWithDefault(value, 0);

int _safeParseIntWithDefault(dynamic value, [int defaultValue = 0]) {
  if (value == null) return defaultValue;
  if (value is int) return value;
  if (value is String) return int.tryParse(value) ?? defaultValue;
  if (value is double) return value.toInt();
  return defaultValue;
}

String? _safeParseString(dynamic value) {
  if (value == null) return null;
  return value.toString();
}

String _safeParseStringWithDefault(dynamic value, [String defaultValue = '']) {
  if (value == null) return defaultValue;
  return value.toString();
}

bool _safeParseBoolWithDefault(dynamic value, [bool defaultValue = false]) {
  if (value == null) return defaultValue;
  if (value is bool) return value;
  if (value is int) return value != 0;
  if (value is String) {
    return value.toLowerCase() == 'true' || value == '1';
  }
  return defaultValue;
}

List<TrendingMake> _safeParseTrendingMakeList(dynamic value) {
  if (value == null) return [];
  if (value is! List) return [];
  
  return value.map((item) {
    try {
      return TrendingMake.fromJson(item as Map<String, dynamic>);
    } catch (e) {
      return TrendingMake(
        id: 0,
        name: 'Error Item',
        slug: 'error',
        image: '',
        createdAt: '',
        updatedAt: '',
      );
    }
  }).toList();
}

PaginationLinks _safeParsePaginationLinks(dynamic value) {
  try {
    return PaginationLinks.fromJson(value as Map<String, dynamic>);
  } catch (e) {
    return PaginationLinks(
      first: '',
      last: '',
    );
  }
}

PaginationMeta _safeParsePaginationMeta(dynamic value) {
  try {
    return PaginationMeta.fromJson(value as Map<String, dynamic>);
  } catch (e) {
    return PaginationMeta(
      currentPage: 1,
      from: 0,
      lastPage: 1,
      links: [],
      path: '',
      perPage: 10,
      to: 0,
      total: 0,
    );
  }
}

List<PaginationMetaLink> _safeParsePaginationMetaLinkList(dynamic value) {
  if (value == null) return [];
  if (value is! List) return [];
  
  return value.map((item) {
    try {
      return PaginationMetaLink.fromJson(item as Map<String, dynamic>);
    } catch (e) {
      return PaginationMetaLink(
        label: 'Error',
        active: false,
      );
    }
  }).toList();
}