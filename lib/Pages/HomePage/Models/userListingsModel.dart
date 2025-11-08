import 'package:freezed_annotation/freezed_annotation.dart';

part 'userListingsModel.freezed.dart';
part 'userListingsModel.g.dart';

// Category Model
@freezed
class Category with _$Category {
  const factory Category({
    required int id,
    @JsonKey(name: 'user_id') dynamic userId,
    @JsonKey(name: 'parent_id') dynamic parentId,
    required String name,
    required String slug,
    required String description,
    required List<String> features,
    required String image,
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
    String? id,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'country_id') dynamic countryId,
    @JsonKey(name: 'brand_model_id') int? brandModelId,
    @JsonKey(name: 'brand_id') int? brandId,
    @JsonKey(name: 'category_id') int? categoryId,
    String? name,
    String? year,
    String? slug,
    String? description,
    List<String>? images,
    String? location,
    @JsonKey(name: 'serial_number') dynamic serialNumber,
    dynamic condition,
    @JsonKey(name: 'steer_position') String? steerPosition,
    @JsonKey(name: 'engine_capacity') dynamic engineCapacity,
    dynamic transmission,
    dynamic color,
    @JsonKey(name: 'build_type') dynamic buildType,
    @JsonKey(name: 'number_of_passengers') dynamic numberOfPassengers,
    List<dynamic>? features,
    dynamic status,
    String? price,
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
    String? message,
    String? error,
    @JsonKey(name: 'error_description') String? errorDescription,
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