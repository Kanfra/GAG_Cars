import 'package:freezed_annotation/freezed_annotation.dart';

part 'userListingsModel.freezed.dart';
part 'userListingsModel.g.dart';

// Category Model
@freezed
class Category with _$Category {
  const factory Category({
    @JsonKey(fromJson: _parseInt) required int id,
    @JsonKey(name: 'user_id') dynamic userId,
    @JsonKey(name: 'parent_id') dynamic parentId,
    @JsonKey(fromJson: _parseString) required String name,
    @JsonKey(fromJson: _parseString) required String slug,
    @JsonKey(fromJson: _parseString) required String description,
    @JsonKey(fromJson: _parseStringList) required List<String> features,
    @JsonKey(fromJson: _parseString) required String image,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

// Listing Model - ALL FIELDS MADE OPTIONAL
@freezed
class Listing with _$Listing {
  const factory Listing({
    @JsonKey(fromJson: _parseNullableString) String? id,
    @JsonKey(name: 'user_id', fromJson: _parseNullableString) String? userId,
    @JsonKey(name: 'country_id') dynamic countryId,
    @JsonKey(name: 'brand_model_id', fromJson: _parseNullableInt) int? brandModelId,
    @JsonKey(name: 'brand_id', fromJson: _parseNullableInt) int? brandId,
    @JsonKey(name: 'category_id', fromJson: _parseNullableInt) int? categoryId,
    @JsonKey(fromJson: _parseNullableString) String? name,
    @JsonKey(fromJson: _parseNullableString) String? year,
    @JsonKey(fromJson: _parseNullableString) String? slug,
    @JsonKey(fromJson: _parseNullableString) String? description,
    @JsonKey(fromJson: _parseStringList) List<String>? images,
    @JsonKey(fromJson: _parseNullableString) String? location,
    @JsonKey(name: 'serial_number') dynamic serialNumber,
    dynamic condition,
    @JsonKey(name: 'steer_position', fromJson: _parseNullableString) String? steerPosition,
    @JsonKey(name: 'engine_capacity') dynamic engineCapacity,
    dynamic transmission,
    dynamic color,
    @JsonKey(name: 'build_type') dynamic buildType,
    @JsonKey(name: 'number_of_passengers') dynamic numberOfPassengers,
    List<dynamic>? features,
    dynamic status,
    @JsonKey(fromJson: _parseNullableString) String? price,
    dynamic mileage,
    dynamic warranty,
    @JsonKey(name: 'warranty_expiration') dynamic warrantyExpiration,
    @JsonKey(name: 'deleted_at') dynamic deletedAt,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    dynamic Height,
    dynamic VIN,
    Category? category,
    @JsonKey(name: 'is_promoted') bool? isPromoted,
  }) = _Listing;

  factory Listing.fromJson(Map<String, dynamic> json) =>
      _$ListingFromJson(json);
}

// Listing Response Model
@freezed
class ListingResponse with _$ListingResponse {
  const factory ListingResponse({
    required List<Listing> data,
  }) = _ListingResponse;

  factory ListingResponse.fromJson(Map<String, dynamic> json) =>
      _$ListingResponseFromJson(json);
}

// Error Response Model
@freezed
class ErrorResponse with _$ErrorResponse {
  const factory ErrorResponse({
    @JsonKey(fromJson: _parseNullableString) String? message,
    @JsonKey(fromJson: _parseNullableString) String? error,
    @JsonKey(name: 'error_description', fromJson: _parseNullableString) String? errorDescription,
  }) = _ErrorResponse;

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);
}

// Generic API Response for handling different states
@freezed
class ApiResponse<T> with _$ApiResponse<T> {
  const factory ApiResponse.success(T data) = Success<T>;
  const factory ApiResponse.unauthorized(String message) = Unauthorized<T>;
  const factory ApiResponse.notFound(String message) = NotFound<T>;
  const factory ApiResponse.error(String message) = Error<T>;
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

String _parseString(dynamic value) {
  if (value == null) return '';
  if (value is String) return value;
  return value.toString();
}

String? _parseNullableString(dynamic value) {
  if (value == null) return null;
  if (value is String) return value;
  return value.toString();
}

List<String> _parseStringList(dynamic value) {
  if (value == null) return [];
  if (value is List) {
    return value.map((e) => e?.toString() ?? '').toList();
  }
  return [];
}