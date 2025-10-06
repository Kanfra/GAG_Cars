import 'package:freezed_annotation/freezed_annotation.dart';

part 'brandItemsModel.freezed.dart';  // Changed to snake_case
part 'brandItemsModel.g.dart';        // Changed to snake_case

@freezed
class BrandItem with _$BrandItem {
  const factory BrandItem({
    required String id,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'country_id') int? countryId,
    @JsonKey(name: 'brand_model_id') required int brandModelId,
    @JsonKey(name: 'brand_id') required int brandId,
    @JsonKey(name: 'category_id') required int categoryId,
    required String name,
    required String year,
    required String slug,
    required String description,
    required List<String> images,
    required String location,
    @JsonKey(name: 'serial_number') String? serialNumber,
    String? condition,
    @JsonKey(name: 'steer_position') String? steerPosition,
    @JsonKey(name: 'engine_capacity') String? engineCapacity,
    String? transmission,
    String? color,
    @JsonKey(name: 'build_type') String? buildType,
    @JsonKey(name: 'number_of_passengers') int? numberOfPassengers,
    required List<String> features,
    String? status,
    required String price,
    String? mileage,
    int? warranty,
    @JsonKey(name: 'warranty_expiration') String? warrantyExpiration,
    @JsonKey(name: 'deleted_at') String? deletedAt,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    @JsonKey(name: 'Height') String? height,
    @JsonKey(name: 'VIN') String? vin,
  }) = _BrandItem;

  factory BrandItem.fromJson(Map<String, dynamic> json) =>
      _$BrandItemFromJson(json);
}

// ... rest of your model