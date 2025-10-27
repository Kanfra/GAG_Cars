// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userDetailsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDetailsImpl _$$UserDetailsImplFromJson(Map<String, dynamic> json) =>
    _$UserDetailsImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String?,
      emailVerifiedAt: json['email_verified_at'] == null
          ? null
          : DateTime.parse(json['email_verified_at'] as String),
      paidSeller: (json['paid_seller'] as num?)?.toInt(),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      countryId: (json['country_id'] as num?)?.toInt(),
      stateId: (json['state_id'] as num?)?.toInt(),
      profilePhoto: json['profile_photo'] as String?,
      uploadsLeft: (json['uploads_left'] as num?)?.toInt(),
      activeStatus: (json['active_status'] as num?)?.toInt(),
      avatar: json['avatar'] as String?,
      darkMode: (json['dark_mode'] as num?)?.toInt(),
      messengerColor: json['messenger_color'] as String?,
      itemsCount: (json['items_count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$UserDetailsImplToJson(_$UserDetailsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'email_verified_at': instance.emailVerifiedAt?.toIso8601String(),
      'paid_seller': instance.paidSeller,
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'country_id': instance.countryId,
      'state_id': instance.stateId,
      'profile_photo': instance.profilePhoto,
      'uploads_left': instance.uploadsLeft,
      'active_status': instance.activeStatus,
      'avatar': instance.avatar,
      'dark_mode': instance.darkMode,
      'messenger_color': instance.messengerColor,
      'items_count': instance.itemsCount,
    };
