// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authWithEmailModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthWithEmailModelImpl _$$AuthWithEmailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AuthWithEmailModelImpl(
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      phoneNumber: json['phoneNumber'] as String?,
      id: json['id'] as String?,
      profileImage: json['profileImage'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$AuthWithEmailModelImplToJson(
        _$AuthWithEmailModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'phoneNumber': instance.phoneNumber,
      'id': instance.id,
      'profileImage': instance.profileImage,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
