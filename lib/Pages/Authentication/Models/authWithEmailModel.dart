import 'package:freezed_annotation/freezed_annotation.dart';

part 'authWithEmailModel.freezed.dart';
part 'authWithEmailModel.g.dart';


@freezed
class AuthWithEmailModel with _$AuthWithEmailModel {
  const factory AuthWithEmailModel({
    required String name,
    required String email,
    required String password,
    String? phoneNumber,
    String? id,
    String? profileImage,
    DateTime? createdAt,
  }) = _AuthWithEmailModel;

  factory AuthWithEmailModel.fromJson(Map<String, dynamic> json) =>
      _$AuthWithEmailModelFromJson(json);
}
