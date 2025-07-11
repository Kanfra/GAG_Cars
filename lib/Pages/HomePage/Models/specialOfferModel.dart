// special_offer_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'specialOfferModel.freezed.dart';
part 'specialOfferModel.g.dart';

@freezed
class SpecialOffer with _$SpecialOffer {
  const factory SpecialOffer({
    required int id,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'item_id') required String itemId,
    @JsonKey(name: 'start_at') required String startAt,
    @JsonKey(name: 'end_at') required String endAt,
    required String status,
    required int discount,
    @JsonKey(name: 'discount_type') required String discountType,
    required String description,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _SpecialOffer;

  factory SpecialOffer.fromJson(Map<String, dynamic> json) =>
      _$SpecialOfferFromJson(json);
}

@freezed
class SpecialOfferResponse with _$SpecialOfferResponse {
  const factory SpecialOfferResponse({
    required List<SpecialOffer> data,
  }) = _SpecialOfferResponse;

  factory SpecialOfferResponse.fromJson(Map<String, dynamic> json) =>
      _$SpecialOfferResponseFromJson(json);
}