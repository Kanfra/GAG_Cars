// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String?,
      phoneNumber: json['phone'] as String?,
      paidSeller: (json['paid_seller'] as num).toInt(),
      emailVerifiedAt: json['email_verified_at'] == null
          ? null
          : DateTime.parse(json['email_verified_at'] as String),
      countryId: json['country_id'] as String?,
      stateId: json['state_id'] as String?,
      profileImage: json['profile_photo'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'phone': instance.phoneNumber,
      'paid_seller': instance.paidSeller,
      'email_verified_at': instance.emailVerifiedAt?.toIso8601String(),
      'country_id': instance.countryId,
      'state_id': instance.stateId,
      'profile_photo': instance.profileImage,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
