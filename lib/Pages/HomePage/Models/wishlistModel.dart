import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'wishlistModel.freezed.dart';
part 'wishlistModel.g.dart';

/// Main response model
@freezed
class WishlistResponse with _$WishlistResponse {
  const factory WishlistResponse({
    required List<WishlistItem> data,
  }) = _WishlistResponse;

  factory WishlistResponse.fromJson(Map<String, dynamic> json) =>
      _$WishlistResponseFromJson(json);
}

/// Individual wishlist item model
@freezed
class WishlistItem with _$WishlistItem {
  const factory WishlistItem({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'item_id') required String itemId,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    required RecommendedItem item,
  }) = _WishlistItem;

  factory WishlistItem.fromJson(Map<String, dynamic> json) =>
      _$WishlistItemFromJson(json);
}

/// The actual item model (reusing your existing RecommendedItem)
@freezed
class RecommendedItem with _$RecommendedItem {
  const factory RecommendedItem({
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
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    String? Height,
    String? VIN,
  }) = _RecommendedItem;

  factory RecommendedItem.fromJson(Map<String, dynamic> json) =>
      _$RecommendedItemFromJson(json);
}
