import 'package:freezed_annotation/freezed_annotation.dart';

part 'itemCategoryModel.freezed.dart';
part 'itemCategoryModel.g.dart';

@freezed
class ItemCategoryResponse with _$ItemCategoryResponse {
  const factory ItemCategoryResponse({
    required List<ItemCategory> data,
    required PaginationLinks links,
    required PaginationMeta meta,
  }) = _ItemCategoryResponse;

  factory ItemCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$ItemCategoryResponseFromJson(json);
}

@freezed
class ItemCategory with _$ItemCategory {
  const ItemCategory._(); // Added constructor for methods

  @JsonSerializable(explicitToJson: true)
  const factory ItemCategory({
    @JsonKey(fromJson: _parseInt) required int id,
    @JsonKey(name: 'user_id', fromJson: _parseNullableInt) int? userId,
    @JsonKey(name: 'parent_id', fromJson: _parseNullableInt) int? parentId,
    required String name,
    required String slug,
    required String description,
    required List<String> features,
    required String image,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'item_fields') required List<ItemField> itemFields,
  }) = _ItemCategory;

  // Simplified fromJson without manual processing
  factory ItemCategory.fromJson(Map<String, dynamic> json) =>
      _$ItemCategoryFromJson(json);
}

@freezed
class ItemField with _$ItemField {
  const ItemField._(); // Added constructor for methods

  @JsonSerializable(explicitToJson: true)
  const factory ItemField({
    @JsonKey(fromJson: _parseInt) required int id,
    required String name,
    required String label,
    required String type,
    @JsonKey(fromJson: _boolFromInt) required bool required,
    @JsonKey(fromJson: _boolFromInt) required bool unique,
    @JsonKey(fromJson: _boolFromInt) required bool nullable,
    List<dynamic>? options,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    required ItemFieldPivot pivot,
  }) = _ItemField;

  // Simplified fromJson without manual processing
  factory ItemField.fromJson(Map<String, dynamic> json) =>
      _$ItemFieldFromJson(json);
}

@freezed
class ItemFieldPivot with _$ItemFieldPivot {
  const ItemFieldPivot._(); // Added constructor for methods

  const factory ItemFieldPivot({
    @JsonKey(name: 'category_id', fromJson: _parseInt) required int categoryId,
    @JsonKey(name: 'item_field_id', fromJson: _parseInt) required int itemFieldId,
  }) = _ItemFieldPivot;

  factory ItemFieldPivot.fromJson(Map<String, dynamic> json) =>
      _$ItemFieldPivotFromJson(json);
}

@freezed
class PaginationLinks with _$PaginationLinks {
  const PaginationLinks._(); // Added constructor for methods

  const factory PaginationLinks({
    required String first,
    required String last,
    required String? prev,
    required String? next,
  }) = _PaginationLinks;

  factory PaginationLinks.fromJson(Map<String, dynamic> json) =>
      _$PaginationLinksFromJson(json);
}

@freezed
class PaginationMeta with _$PaginationMeta {
  const PaginationMeta._(); // Added constructor for methods

  const factory PaginationMeta({
    @JsonKey(name: 'current_page', fromJson: _parseInt) required int currentPage,
    @JsonKey(fromJson: _parseInt) required int from,
    @JsonKey(name: 'last_page', fromJson: _parseInt) required int lastPage,
    required List<PaginationLink> links,
    required String path,
    @JsonKey(name: 'per_page', fromJson: _parseInt) required int perPage,
    @JsonKey(fromJson: _parseInt) required int to,
    @JsonKey(fromJson: _parseInt) required int total,
  }) = _PaginationMeta;

  factory PaginationMeta.fromJson(Map<String, dynamic> json) =>
      _$PaginationMetaFromJson(json);
}

@freezed
class PaginationLink with _$PaginationLink {
  const PaginationLink._(); // Added constructor for methods

  const factory PaginationLink({
    required String? url,
    required String label,
    required bool active,
  }) = _PaginationLink;

  factory PaginationLink.fromJson(Map<String, dynamic> json) =>
      _$PaginationLinkFromJson(json);
}

// Helper functions (keep these outside any class)
int _parseInt(dynamic value) {
  if (value == null) return 0;
  if (value is int) return value;
  if (value is String) return int.tryParse(value) ?? 0;
  if (value is num) return value.toInt();
  return 0;
}

int? _parseNullableInt(dynamic value) {
  if (value == null) return null;
  if (value is int) return value;
  if (value is String) return int.tryParse(value);
  if (value is num) return value.toInt();
  return null;
}

bool _boolFromInt(dynamic value) {
  if (value is bool) return value;
  if (value is int) return value == 1;
  if (value is String) return value == '1';
  return false;
}
