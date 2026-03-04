// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthResponseModel _$AuthResponseModelFromJson(Map<String, dynamic> json) =>
    _AuthResponseModel(
      message: json['message'] as String?,
      token: json['token'] as String?,
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      verified: json['verified'] as bool?,
      verifiedDealer: json['verified_dealer'] as bool?,
    );

Map<String, dynamic> _$AuthResponseModelToJson(_AuthResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'token': instance.token,
      'user': instance.user,
      'verified': instance.verified,
      'verified_dealer': instance.verifiedDealer,
    };
