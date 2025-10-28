import 'package:freezed_annotation/freezed_annotation.dart';

part 'myListingsModel.freezed.dart';
part 'myListingsModel.g.dart';

typedef MyListings = List<MyListing>;

@freezed
class MyListing with _$MyListing {
  const factory MyListing({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'country_id') dynamic countryId,
    @JsonKey(name: 'brand_model_id') int? brandModelId,
    @JsonKey(name: 'brand_id') required int brandId,
    @JsonKey(name: 'category_id') required int categoryId,
    required String name,
    required String year,
    required String slug,
    required String description,
    required List<String> images,
    required String location,
    @JsonKey(name: 'serial_number') dynamic serialNumber,
    dynamic condition,
    @JsonKey(name: 'steer_position') String? steerPosition,
    @JsonKey(name: 'engine_capacity') String? engineCapacity,
    String? transmission,
    String? color,
    @JsonKey(name: 'build_type') String? buildType,
    @JsonKey(name: 'number_of_passengers') int? numberOfPassengers,
    required List<dynamic> features,
    dynamic status,
    required String price,
    String? mileage,
    dynamic warranty,
    @JsonKey(name: 'warranty_expiration') dynamic warrantyExpiration,
    @JsonKey(name: 'deleted_at') dynamic deletedAt,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    dynamic Height,
    dynamic VIN,
    Category? category,
    @JsonKey(name: 'is_promoted') bool? isPromoted,
  }) = _MyListing;

  factory MyListing.fromJson(Map<String, dynamic> json) =>
      _$MyListingFromJson(json);
}

@freezed
class Category with _$Category {
  const factory Category({
    required int id,
    @JsonKey(name: 'user_id') dynamic userId,
    @JsonKey(name: 'parent_id') dynamic parentId,
    required String name,
    required String slug,
    required String description,
    required List<dynamic> features,
    required String image,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}