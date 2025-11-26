import 'package:freezed_annotation/freezed_annotation.dart';

part 'myListingsModel.freezed.dart';
part 'myListingsModel.g.dart';

typedef MyListings = List<MyListing>;

// Custom JSON converters to handle type issues
String _parseString(dynamic value) {
  if (value == null) return '';
  if (value is String) return value;
  return value.toString();
}

int _parseInt(dynamic value) {
  if (value == null) return 0;
  if (value is int) return value;
  if (value is String) return int.tryParse(value) ?? 0;
  return 0;
}

@freezed
class MyListing with _$MyListing {
  const factory MyListing({
    @JsonKey(fromJson: _parseString) required String id,
    @JsonKey(name: 'user_id', fromJson: _parseInt) required int userId,
    @JsonKey(name: 'country_id', fromJson: _parseInt) int? countryId,
    @JsonKey(name: 'brand_model_id', fromJson: _parseInt) int? brandModelId,
    @JsonKey(name: 'brand_id', fromJson: _parseInt) required int brandId,
    @JsonKey(name: 'category_id', fromJson: _parseInt) required int categoryId,
    @JsonKey(fromJson: _parseString) required String name,
    @JsonKey(fromJson: _parseString) required String year,
    @JsonKey(fromJson: _parseString) required String slug,
    @JsonKey(fromJson: _parseString) required String description,
    required List<String> images,
    @JsonKey(fromJson: _parseString) required String location,
    @JsonKey(name: 'serial_number', fromJson: _parseString) String? serialNumber,
    @JsonKey(fromJson: _parseString) String? condition,
    @JsonKey(name: 'steer_position', fromJson: _parseString) String? steerPosition,
    @JsonKey(name: 'engine_capacity', fromJson: _parseString) String? engineCapacity,
    @JsonKey(fromJson: _parseString) String? transmission,
    @JsonKey(fromJson: _parseString) String? color,
    @JsonKey(name: 'build_type', fromJson: _parseString) String? buildType,
    @JsonKey(name: 'number_of_passengers', fromJson: _parseInt) int? numberOfPassengers,
    required List<dynamic> features,
    @JsonKey(fromJson: _parseString) String? status,
    @JsonKey(fromJson: _parseString) required String price, // Use custom converter
    @JsonKey(fromJson: _parseString) String? mileage,
    @JsonKey(fromJson: _parseInt) int? warranty,
    @JsonKey(name: 'warranty_expiration', fromJson: _parseString) String? warrantyExpiration,
    @JsonKey(name: 'deleted_at', fromJson: _parseString) String? deletedAt,
    @JsonKey(name: 'created_at', fromJson: _parseString) required String createdAt,
    @JsonKey(name: 'updated_at', fromJson: _parseString) required String updatedAt,
    @JsonKey(fromJson: _parseString) String? Height,
    @JsonKey(fromJson: _parseString) String? VIN,
    Category? category,
    @JsonKey(name: 'is_promoted') bool? isPromoted,
  }) = _MyListing;

  factory MyListing.fromJson(Map<String, dynamic> json) =>
      _$MyListingFromJson(json);
}

@freezed
class Category with _$Category {
  const factory Category({
    @JsonKey(fromJson: _parseInt) required int id,
    @JsonKey(name: 'user_id', fromJson: _parseInt) int? userId,
    @JsonKey(name: 'parent_id', fromJson: _parseInt) int? parentId,
    @JsonKey(fromJson: _parseString) required String name,
    @JsonKey(fromJson: _parseString) required String slug,
    @JsonKey(fromJson: _parseString) required String description,
    required List<dynamic> features,
    @JsonKey(fromJson: _parseString) required String image,
    @JsonKey(name: 'created_at', fromJson: _parseString) required String createdAt,
    @JsonKey(name: 'updated_at', fromJson: _parseString) required String updatedAt,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}