import 'package:freezed_annotation/freezed_annotation.dart';

part 'similarItemsModel.freezed.dart';
part 'similarItemsModel.g.dart';

@freezed
class SimilarItemsResponse with _$SimilarItemsResponse {
  const factory SimilarItemsResponse({
    @JsonKey(name: 'data') required List<SimilarItem> data,
    @JsonKey(name: 'links') PaginationLinks? links,
    @JsonKey(name: 'meta') PaginationMeta? meta,
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
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'country_id', fromJson: _parseNullableInt) int? countryId,
    @JsonKey(name: 'brand_model_id', fromJson: _parseNullableInt) int? brandModelId,
    @JsonKey(name: 'brand_id', fromJson: _parseNullableInt) int? brandId,
    @JsonKey(name: 'category_id', fromJson: _parseNullableInt) int? categoryId,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'year') String? year,
    @JsonKey(name: 'slug') String? slug,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'images', fromJson: _parseStringList) List<String>? images,
    @JsonKey(name: 'location') String? location,
    @JsonKey(name: 'serial_number') String? serialNumber,
    @JsonKey(name: 'condition') String? condition,
    @JsonKey(name: 'steer_position') String? steerPosition,
    @JsonKey(name: 'engine_capacity') String? engineCapacity,
    @JsonKey(name: 'transmission') String? transmission,
    @JsonKey(name: 'color') String? color,
    @JsonKey(name: 'build_type') String? buildType,
    @JsonKey(name: 'number_of_passengers', fromJson: _parseNullableInt)
        int? numberOfPassengers,
    @JsonKey(name: 'features', fromJson: _parseStringList) List<String>? features,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'price') String? price,
    @JsonKey(name: 'mileage') String? mileage,
    @JsonKey(name: 'warranty', fromJson: _parseNullableInt) int? warranty,
    @JsonKey(name: 'warranty_expiration') String? warrantyExpiration,
    @JsonKey(name: 'deleted_at') String? deletedAt,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    @JsonKey(name: 'Height') String? height,
    @JsonKey(name: 'VIN') String? vin,
    // Added nested objects
    @JsonKey(name: 'brand') Brand? brand,
    @JsonKey(name: 'category') Category? category,
    @JsonKey(name: 'brand_model') BrandModel? brandModel,
    @JsonKey(name: 'user') User? user,
  }) = _SimilarItem;

  factory SimilarItem.fromJson(Map<String, dynamic> json) =>
      _$SimilarItemFromJson(json);
}

@freezed
class Brand with _$Brand {
  const factory Brand({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'user_id', fromJson: _parseNullableInt) int? userId,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'slug') String? slug,
    @JsonKey(name: 'image') String? image,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _Brand;

  factory Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);
}

@freezed
class Category with _$Category {
  const factory Category({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'user_id', fromJson: _parseNullableInt) int? userId,
    @JsonKey(name: 'parent_id', fromJson: _parseNullableInt) int? parentId,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'slug') String? slug,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'features', fromJson: _parseStringList) List<String>? features,
    @JsonKey(name: 'image') String? image,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
}

@freezed
class BrandModel with _$BrandModel {
  const factory BrandModel({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'brand_id', fromJson: _parseNullableInt) int? brandId,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'slug') String? slug,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _BrandModel;

  factory BrandModel.fromJson(Map<String, dynamic> json) => _$BrandModelFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'phone') String? phone,
    @JsonKey(name: 'email_verified_at') String? emailVerifiedAt,
    @JsonKey(name: 'paid_seller', fromJson: _parseNullableInt) int? paidSeller,
    @JsonKey(name: 'deleted_at') String? deletedAt,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    @JsonKey(name: 'country_id', fromJson: _parseNullableInt) int? countryId,
    @JsonKey(name: 'state_id', fromJson: _parseNullableInt) int? stateId,
    @JsonKey(name: 'profile_photo') String? profilePhoto,
    @JsonKey(name: 'uploads_left', fromJson: _parseNullableInt) int? uploadsLeft,
    @JsonKey(name: 'active_status', fromJson: _parseNullableInt) int? activeStatus,
    @JsonKey(name: 'avatar') String? avatar,
    @JsonKey(name: 'dark_mode', fromJson: _parseNullableInt) int? darkMode,
    @JsonKey(name: 'messenger_color') String? messengerColor,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class PaginationLinks with _$PaginationLinks {
  const factory PaginationLinks({
    @JsonKey(name: 'first') String? first,
    @JsonKey(name: 'last') String? last,
    @JsonKey(name: 'prev') String? prev,
    @JsonKey(name: 'next') String? next,
  }) = _PaginationLinks;

  factory PaginationLinks.fromJson(Map<String, dynamic> json) =>
      _$PaginationLinksFromJson(json);
}

@freezed
class PaginationMeta with _$PaginationMeta {
  const factory PaginationMeta({
    @JsonKey(name: 'current_page', fromJson: _parseNullableInt) int? currentPage,
    @JsonKey(name: 'from', fromJson: _parseNullableInt) int? from,
    @JsonKey(name: 'last_page', fromJson: _parseNullableInt) int? lastPage,
    @JsonKey(name: 'links') List<PaginationLink>? links,
    @JsonKey(name: 'path') String? path,
    @JsonKey(name: 'per_page', fromJson: _parseNullableInt) int? perPage,
    @JsonKey(name: 'to', fromJson: _parseNullableInt) int? to,
    @JsonKey(name: 'total', fromJson: _parseNullableInt) int? total,
  }) = _PaginationMeta;

  factory PaginationMeta.fromJson(Map<String, dynamic> json) =>
      _$PaginationMetaFromJson(json);
}

@freezed
class PaginationLink with _$PaginationLink {
  const factory PaginationLink({
    @JsonKey(name: 'url') String? url,
    @JsonKey(name: 'label') String? label,
    @JsonKey(name: 'active') bool? active,
  }) = _PaginationLink;

  factory PaginationLink.fromJson(Map<String, dynamic> json) =>
      _$PaginationLinkFromJson(json);
}

// ---------------------
// Helper parse functions
// ---------------------

int _parseInt(dynamic value) {
  if (value == null) return 0;
  if (value is int) return value;
  if (value is String && value.isNotEmpty) return int.tryParse(value) ?? 0;
  if (value is num) return value.toInt();
  return 0;
}

int? _parseNullableInt(dynamic value) {
  if (value == null) return null;
  if (value is int) return value;
  if (value is String && value.isNotEmpty) return int.tryParse(value);
  if (value is num) return value.toInt();
  return null;
}

double? _parseNullableDouble(dynamic value) {
  if (value == null) return null;
  if (value is double) return value;
  if (value is String && value.isNotEmpty) return double.tryParse(value);
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
  if (value is String && value.isNotEmpty) {
    try {
      return DateTime.parse(value);
    } catch (_) {
      return null;
    }
  }
  return null;
}