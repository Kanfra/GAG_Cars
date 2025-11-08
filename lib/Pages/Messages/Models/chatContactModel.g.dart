// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chatContactModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatContactResponseImpl _$$ChatContactResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatContactResponseImpl(
      contacts: (json['contacts'] as List<dynamic>?)
              ?.map((e) => ChatContact.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      total: (json['total'] as num?)?.toInt() ?? 0,
      lastPage: (json['last_page'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$ChatContactResponseImplToJson(
        _$ChatContactResponseImpl instance) =>
    <String, dynamic>{
      'contacts': instance.contacts,
      'total': instance.total,
      'last_page': instance.lastPage,
    };

_$ChatContactImpl _$$ChatContactImplFromJson(Map<String, dynamic> json) =>
    _$ChatContactImpl(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? 'Unknown',
      email: json['email'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      emailVerifiedAt: json['email_verified_at'] as String?,
      password: json['password'] as String?,
      paidSeller: (json['paid_seller'] as num?)?.toInt() ?? 0,
      deletedAt: json['deleted_at'] as String?,
      rememberToken: json['remember_token'] as String?,
      createdAt: json['created_at'] as String? ?? '',
      updatedAt: json['updated_at'] as String? ?? '',
      countryId: (json['country_id'] as num?)?.toInt() ?? 0,
      stateId: (json['state_id'] as num?)?.toInt(),
      profilePhoto: json['profile_photo'] as String?,
      uploadsLeft: (json['uploads_left'] as num?)?.toInt(),
      activeStatus: (json['active_status'] as num?)?.toInt() ?? 0,
      avatar: json['avatar'] as String? ?? '',
      darkMode: (json['dark_mode'] as num?)?.toInt() ?? 0,
      messengerColor: json['messenger_color'] as String?,
      maxCreatedAt: json['max_created_at'] as String? ?? '',
    );

Map<String, dynamic> _$$ChatContactImplToJson(_$ChatContactImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'email_verified_at': instance.emailVerifiedAt,
      'password': instance.password,
      'paid_seller': instance.paidSeller,
      'deleted_at': instance.deletedAt,
      'remember_token': instance.rememberToken,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'country_id': instance.countryId,
      'state_id': instance.stateId,
      'profile_photo': instance.profilePhoto,
      'uploads_left': instance.uploadsLeft,
      'active_status': instance.activeStatus,
      'avatar': instance.avatar,
      'dark_mode': instance.darkMode,
      'messenger_color': instance.messengerColor,
      'max_created_at': instance.maxCreatedAt,
    };
