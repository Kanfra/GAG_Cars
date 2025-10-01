import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const UserModel._();

  @JsonSerializable(explicitToJson: true)
  const factory UserModel({
    required String name,
    required String email,
    String? password,
    @JsonKey(name: 'phone') String? phoneNumber,
    @JsonKey(name: 'paid_seller') int? paidSeller,
    @JsonKey(name: 'email_verified_at') DateTime? emailVerifiedAt,
    @JsonKey(name: 'country_id') int? countryId, // Changed from String? to int?
    @JsonKey(name: 'state_id') int? stateId, // Also changed this to int? since it's likely the same type
    @JsonKey(name: 'profile_photo') String? profileImage,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'deleted_at') DateTime? deletedAt,
    @JsonKey(name: 'uploads_left') int? uploadsLeft,
    @JsonKey(name: 'active_status') int? activeStatus,
    @JsonKey(name: 'avatar') String? avatar,
    @JsonKey(name: 'dark_mode') int? darkMode,
    @JsonKey(name: 'messenger_color') String? messengerColor,
    @JsonKey(includeFromJson: true, includeToJson: false) String? id,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  bool get isPaidSeller => (paidSeller ?? 0) == 1;
  bool get isActive => (activeStatus ?? 0) == 1;
  bool get hasDarkMode => (darkMode ?? 0) == 1;
}