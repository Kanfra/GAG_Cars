import 'package:freezed_annotation/freezed_annotation.dart';
import 'user_model.dart';

part 'auth_response_model.freezed.dart';
part 'auth_response_model.g.dart';

@freezed
class AuthResponseModel with _$AuthResponseModel {
  const factory AuthResponseModel({
    String? token,
    required UserModel user,
    bool? verified,  // ← Changed to nullable
    @JsonKey(name: 'verified_dealer') bool? verifiedDealer, // ← Changed to nullable
  }) = _AuthResponseModel;

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseModelFromJson(json);
}