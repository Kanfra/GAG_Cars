import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const UserModel._();  // 1. Add private constructor

  @JsonSerializable(explicitToJson: true)  // 2. Enable explicit JSON conversion
  const factory UserModel({
    required String name,
    required String email,
    String? password,
    @JsonKey(name: 'phone') String? phoneNumber,
    @JsonKey(name: 'paid_seller') required int paidSeller,
    @JsonKey(name: 'email_verified_at') DateTime? emailVerifiedAt,
    @JsonKey(name: 'country_id') String? countryId,
    @JsonKey(name: 'state_id') String? stateId,
    @JsonKey(name: 'profile_photo') String? profileImage,  // Changed JSON key to 'profile_photo'
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(includeFromJson: true, includeToJson: false) String? id,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  // Custom getter (now valid with private constructor)
  bool get isPaidSeller => paidSeller == 1;
}
