import 'package:freezed_annotation/freezed_annotation.dart';

part 'similarItemsModel.freezed.dart';
part 'similarItemsModel.g.dart';

@freezed
class SimilarItemsResponse with _$SimilarItemsResponse {
  const factory SimilarItemsResponse({
    @JsonKey(name: 'data') required List<SimilarItem> data,
    @JsonKey(name: 'links') required PaginationLinks links,
    @JsonKey(name: 'meta') required PaginationMeta meta,
  }) = _SimilarItemsResponse;

  factory SimilarItemsResponse.fromJson(Map<String, dynamic> json) =>
      _$SimilarItemsResponseFromJson(json);
}

@freezed
class SimilarItem with _$SimilarItem {
  const SimilarItem._();

  @JsonSerializable(explicitToJson: true)
  const factory SimilarItem({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'user_id') required String? userId,
    @JsonKey(name: 'country_id', fromJson: _parseInt) required int? countryId,
    @JsonKey(name: 'brand_model_id', fromJson: _parseInt) required int? brandModelId,
    @JsonKey(name: 'brand_id', fromJson: _parseInt) required int? brandId,
    @JsonKey(name: 'category_id', fromJson: _parseInt) required int categoryId,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'year') required String year,
    @JsonKey(name: 'slug') required String slug,
    @JsonKey(name: 'description') required String? description,
    @JsonKey(name: 'images') required List<String> images,
    @JsonKey(name: 'location') required String? location,
    @JsonKey(name: 'serial_number') required String? serialNumber,
    @JsonKey(name: 'condition') required String? condition,
    @JsonKey(name: 'steer_position') required String? steerPosition,
    @JsonKey(name: 'engine_capacity') required String? engineCapacity,
    @JsonKey(name: 'transmission') required String? transmission,
    @JsonKey(name: 'color') required String? color,
    @JsonKey(name: 'build_type') required String? buildType,
    @JsonKey(name: 'number_of_passengers', fromJson: _parseInt) required int? numberOfPassengers,
    @JsonKey(name: 'features') required List<String> features,
    @JsonKey(name: 'status') required String? status,
    @JsonKey(name: 'price') required String price,
    @JsonKey(name: 'mileage') required String? mileage,
    @JsonKey(name: 'warranty', fromJson: _parseInt) required int? warranty,
    @JsonKey(name: 'warranty_expiration') required String? warrantyExpiration,
    @JsonKey(name: 'deleted_at') required String? deletedAt,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    @JsonKey(name: 'Height') required String? height,
    @JsonKey(name: 'VIN') required String? vin,
  }) = _SimilarItem;

  factory SimilarItem.fromJson(Map<String, dynamic> json) =>
      _$SimilarItemFromJson(json);
}

@freezed
class PaginationLinks with _$PaginationLinks {
  const factory PaginationLinks({
    @JsonKey(name: 'first') required String? first,
    @JsonKey(name: 'last') required String? last,
    @JsonKey(name: 'prev') required String? prev,
    @JsonKey(name: 'next') required String? next,
  }) = _PaginationLinks;

  factory PaginationLinks.fromJson(Map<String, dynamic> json) =>
      _$PaginationLinksFromJson(json);
}

@freezed
class PaginationMeta with _$PaginationMeta {
  const factory PaginationMeta({
    @JsonKey(name: 'current_page', fromJson: _parseInt) required int currentPage,
    @JsonKey(name: 'from', fromJson: _parseInt) required int? from,
    @JsonKey(name: 'last_page', fromJson: _parseInt) required int lastPage,
    @JsonKey(name: 'links') required List<PaginationLink> links,
    @JsonKey(name: 'path') required String path,
    @JsonKey(name: 'per_page', fromJson: _parseInt) required int perPage,
    @JsonKey(name: 'to', fromJson: _parseInt) required int? to,
    @JsonKey(name: 'total', fromJson: _parseInt) required int total,
  }) = _PaginationMeta;

  factory PaginationMeta.fromJson(Map<String, dynamic> json) =>
      _$PaginationMetaFromJson(json);
}

@freezed
class PaginationLink with _$PaginationLink {
  const factory PaginationLink({
    @JsonKey(name: 'url') required String? url,
    @JsonKey(name: 'label') required String label,
    @JsonKey(name: 'active') required bool active,
  }) = _PaginationLink;

  factory PaginationLink.fromJson(Map<String, dynamic> json) =>
      _$PaginationLinkFromJson(json);
}

// Helper functions for JSON parsing
int _parseInt(dynamic value) {
  if (value == null) return 0;
  if (value is int) return value;
  if (value is String) {
    if (value.isEmpty) return 0;
    return int.tryParse(value) ?? 0;
  }
  if (value is num) return value.toInt();
  return 0;
}

int? _parseNullableInt(dynamic value) {
  if (value == null) return null;
  if (value is int) return value;
  if (value is String) {
    if (value.isEmpty) return null;
    return int.tryParse(value);
  }
  if (value is num) return value.toInt();
  return null;
}

double _parseDouble(dynamic value) {
  if (value == null) return 0.0;
  if (value is double) return value;
  if (value is String) {
    if (value.isEmpty) return 0.0;
    return double.tryParse(value) ?? 0.0;
  }
  if (value is num) return value.toDouble();
  return 0.0;
}

double? _parseNullableDouble(dynamic value) {
  if (value == null) return null;
  if (value is double) return value;
  if (value is String) {
    if (value.isEmpty) return null;
    return double.tryParse(value);
  }
  if (value is num) return value.toDouble();
  return null;
}

bool _parseBool(dynamic value) {
  if (value == null) return false;
  if (value is bool) return value;
  if (value is int) return value == 1;
  if (value is String) {
    return value.toLowerCase() == 'true' || value == '1';
  }
  return false;
}

String _parseString(dynamic value) {
  if (value == null) return '';
  if (value is String) return value;
  return value.toString();
}

String? _parseNullableString(dynamic value) {
  if (value == null) return null;
  if (value is String) return value.isEmpty ? null : value;
  final stringValue = value.toString();
  return stringValue.isEmpty ? null : stringValue;
}

List<String> _parseStringList(dynamic value) {
  if (value == null) return [];
  if (value is List) {
    return value.whereType<String>().where((item) => item.isNotEmpty).toList();
  }
  return [];
}

DateTime? _parseDateTime(dynamic value) {
  if (value == null) return null;
  if (value is DateTime) return value;
  if (value is String) {
    try {
      return DateTime.parse(value);
    } catch (e) {
      return null;
    }
  }
  return null;
}