import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'userDetailsModel.freezed.dart';
part 'userDetailsModel.g.dart';

@freezed
class UserDetails with _$UserDetails {
  const factory UserDetails({
    required String id,
    required String name,
    required String email,
    String? phone,
    @JsonKey(name: 'email_verified_at') DateTime? emailVerifiedAt,
    @JsonKey(name: 'paid_seller') int? paidSeller,
    @JsonKey(name: 'deleted_at') DateTime? deletedAt,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'country_id') int? countryId,
    @JsonKey(name: 'state_id') int? stateId,
    @JsonKey(name: 'profile_photo') String? profilePhoto,
    @JsonKey(name: 'uploads_left') int? uploadsLeft,
    @JsonKey(name: 'active_status') int? activeStatus,
    String? avatar,
    @JsonKey(name: 'dark_mode') int? darkMode,
    @JsonKey(name: 'messenger_color') String? messengerColor,
    // ADD THIS FIELD:
    @JsonKey(name: 'items_count') int? itemsCount,
  }) = _UserDetails;

  factory UserDetails.fromJson(Map<String, dynamic> json) => 
      _$UserDetailsFromJson(json);
}