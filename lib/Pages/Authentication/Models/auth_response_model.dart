// auth_response_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'user_model.dart';  // Import the UserModel

part 'auth_response_model.freezed.dart';
part 'auth_response_model.g.dart';

@freezed
class AuthResponseModel with _$AuthResponseModel {
  const factory AuthResponseModel({
    String? token,
    required UserModel user,  // Now using your actual UserModel
    // @JsonKey(name: 'device_name') String? deviceName,
  }) = _AuthResponseModel;

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseModelFromJson(json);
}
