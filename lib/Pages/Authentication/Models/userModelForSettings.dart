import 'package:freezed_annotation/freezed_annotation.dart';

part 'userModelForSettings.freezed.dart';
part 'userModelForSettings.g.dart';

@freezed
class UserModelForSettings with _$UserModelForSettings {
  const factory UserModelForSettings({
    required String id,
    required String name,
    required String email,
    required String phone,
    @JsonKey(name: 'email_verified_at') DateTime? emailVerifiedAt,
    @JsonKey(name: 'paid_seller') required int paidSeller,
    @JsonKey(name: 'deleted_at') DateTime? deletedAt,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'country_id') String? countryId,
    @JsonKey(name: 'state_id') String? stateId,
    @JsonKey(name: 'profile_photo') String? profilePhoto,
    @JsonKey(name: 'uploads_left') int? uploadsLeft,
    @JsonKey(name: 'active_status') required int activeStatus,
    required String avatar,
    @JsonKey(name: 'dark_mode') required int darkMode,
    @JsonKey(name: 'messenger_color') String? messengerColor,
  }) = _UserModelForSettings;

  factory UserModelForSettings.fromJson(Map<String, dynamic> json) =>
      _$UserModelForSettingsFromJson(json);
}