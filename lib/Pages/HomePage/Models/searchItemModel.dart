import 'package:freezed_annotation/freezed_annotation.dart';

part 'searchItemModel.freezed.dart';
part 'searchItemModel.g.dart';

@freezed
class SearchItem with _$SearchItem {
  const factory SearchItem({
    required String id,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'country_id') int? countryId,
    @JsonKey(name: 'brand_model_id') int? brandModelId,
    @JsonKey(name: 'brand_id') int? brandId,
    @JsonKey(name: 'category_id') int? categoryId,
    String? name,
    String? year,
    String? slug,
    String? description,
    List<String>? images,
    String? location,
    @JsonKey(name: 'serial_number') String? serialNumber,
    String? condition,
    @JsonKey(name: 'steer_position') String? steerPosition,
    @JsonKey(name: 'engine_capacity') String? engineCapacity,
    String? transmission,
    String? color,
    @JsonKey(name: 'build_type') String? buildType,
    @JsonKey(name: 'number_of_passengers') int? numberOfPassengers,
    List<String>? features,
    String? status,
    String? price,
    String? mileage,
    int? warranty,
    @JsonKey(name: 'warranty_expiration') String? warrantyExpiration,
    @JsonKey(name: 'deleted_at') String? deletedAt,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    String? Height,
    String? VIN,
  }) = _SearchItem;

  factory SearchItem.fromJson(Map<String, dynamic> json) =>
      _$SearchItemFromJson(json);
}