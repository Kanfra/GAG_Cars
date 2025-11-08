// models/chat_contact_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chatContactModel.freezed.dart';
part 'chatContactModel.g.dart';

@freezed
class ChatContactResponse with _$ChatContactResponse {
  const factory ChatContactResponse({
    @Default([]) List<ChatContact> contacts,
    @Default(0) int total,
    @JsonKey(name: 'last_page') @Default(0) int lastPage,
  }) = _ChatContactResponse;

  factory ChatContactResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatContactResponseFromJson(json);
}

@freezed
class ChatContact with _$ChatContact {
  const factory ChatContact({
    @Default('') String id,
    @Default('Unknown') String name,
    @Default('') String email,
    @Default('') String phone,
    @JsonKey(name: 'email_verified_at') String? emailVerifiedAt,
    String? password,
    @JsonKey(name: 'paid_seller') @Default(0) int paidSeller,
    @JsonKey(name: 'deleted_at') String? deletedAt,
    @JsonKey(name: 'remember_token') String? rememberToken,
    @JsonKey(name: 'created_at') @Default('') String createdAt,
    @JsonKey(name: 'updated_at') @Default('') String updatedAt,
    @JsonKey(name: 'country_id') @Default(0) int countryId,
    @JsonKey(name: 'state_id') int? stateId,
    @JsonKey(name: 'profile_photo') String? profilePhoto,
    @JsonKey(name: 'uploads_left') int? uploadsLeft,
    @JsonKey(name: 'active_status') @Default(0) int activeStatus,
    @Default('') String avatar,
    @JsonKey(name: 'dark_mode') @Default(0) int darkMode,
    @JsonKey(name: 'messenger_color') String? messengerColor,
    @JsonKey(name: 'max_created_at') @Default('') String maxCreatedAt,
  }) = _ChatContact;

  factory ChatContact.fromJson(Map<String, dynamic> json) =>
      _$ChatContactFromJson(json);
}