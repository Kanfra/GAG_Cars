import 'package:freezed_annotation/freezed_annotation.dart';

part 'brandModelModel.freezed.dart';
part 'brandModelModel.g.dart';

/// Main response wrapper for brand models API
@freezed
class BrandModelResponse with _$BrandModelResponse {
  const factory BrandModelResponse({
    /// List of brand models
    required List<BrandModel> data,

    /// Pagination links
    required PaginationLinks links,

    /// Pagination metadata
    required PaginationMeta meta,
  }) = _BrandModelResponse;

  /// Converts JSON to BrandModelResponse
  factory BrandModelResponse.fromJson(Map<String, dynamic> json) =>
      _$BrandModelResponseFromJson(json);
}

/// Represents a single vehicle model under a brand
@freezed
class BrandModel with _$BrandModel {
  const factory BrandModel({
    /// Unique identifier for the model
    required int id,

    /// ID of the parent brand
    @JsonKey(name: 'brand_id') required int brandId,

    /// Name of the model (e.g. "Camry")
    required String name,

    /// URL slug for the model
    required String slug,

    /// Creation timestamp
    @JsonKey(name: 'created_at') required String createdAt,

    /// Last update timestamp
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _BrandModel;

  /// Converts JSON to BrandModel
  factory BrandModel.fromJson(Map<String, dynamic> json) =>
      _$BrandModelFromJson(json);
}

/// Pagination links structure
@freezed
class PaginationLinks with _$PaginationLinks {
  const factory PaginationLinks({
    /// URL to the first page
    required String first,

    /// URL to the last page
    required String last,

    /// URL to the previous page (null if on first page)
    required String? prev,

    /// URL to the next page (null if on last page)
    required String? next,
  }) = _PaginationLinks;

  /// Converts JSON to PaginationLinks
  factory PaginationLinks.fromJson(Map<String, dynamic> json) =>
      _$PaginationLinksFromJson(json);
}

/// Pagination metadata structure
@freezed
class PaginationMeta with _$PaginationMeta {
  const factory PaginationMeta({
    /// Current page number
    @JsonKey(name: 'current_page') required int currentPage,

    /// Index of first item on current page
    required int from,

    /// Last page number
    @JsonKey(name: 'last_page') required int lastPage,

    /// List of pagination links
    required List<PaginationLink> links,

    /// Base path for pagination URLs
    required String path,

    /// Number of items per page
    @JsonKey(name: 'per_page') required int perPage,

    /// Index of last item on current page
    required int to,

    /// Total number of items across all pages
    required int total,
  }) = _PaginationMeta;

  /// Converts JSON to PaginationMeta
  factory PaginationMeta.fromJson(Map<String, dynamic> json) =>
      _$PaginationMetaFromJson(json);
}

/// Individual pagination link item
@freezed
class PaginationLink with _$PaginationLink {
  const factory PaginationLink({
    /// URL for this link (null for inactive links)
    required String? url,

    /// Display label for the link
    required String label,

    /// Whether this link is active
    required bool active,
  }) = _PaginationLink;

  /// Converts JSON to PaginationLink
  factory PaginationLink.fromJson(Map<String, dynamic> json) =>
      _$PaginationLinkFromJson(json);
}