// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as String?,
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String?,
      phoneNumber: json['phone'] as String?,
      paidSeller: (json['paid_seller'] as num?)?.toInt(),
      emailVerifiedAt: json['email_verified_at'] == null
          ? null
          : DateTime.parse(json['email_verified_at'] as String),
      countryId: (json['country_id'] as num?)?.toInt(),
      stateId: (json['state_id'] as num?)?.toInt(),
      profileImage: json['profile_photo'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
      uploadsLeft: (json['uploads_left'] as num?)?.toInt(),
      activeStatus: (json['active_status'] as num?)?.toInt(),
      avatar: json['avatar'] as String?,
      darkMode: (json['dark_mode'] as num?)?.toInt(),
      messengerColor: json['messenger_color'] as String?,
      country: json['country'] == null
          ? null
          : CountryModel.fromJson(json['country'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
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
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'uploads_left': instance.uploadsLeft,
      'active_status': instance.activeStatus,
      'avatar': instance.avatar,
      'dark_mode': instance.darkMode,
      'messenger_color': instance.messengerColor,
      'country': instance.country?.toJson(),
    };

_$CountryModelImpl _$$CountryModelImplFromJson(Map<String, dynamic> json) =>
    _$CountryModelImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      iso3: json['iso3'] as String?,
      iso2: json['iso2'] as String?,
      numericCode: json['numeric_code'] as String?,
      phoneCode: json['phone_code'] as String?,
      capital: json['capital'] as String?,
      currency: json['currency'] as String?,
      currencyName: json['currency_name'] as String?,
      currencySymbol: json['currency_symbol'] as String?,
      tld: json['tld'] as String?,
      native: json['native'] as String?,
      region: json['region'] as String?,
      subregion: json['subregion'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      emoji: json['emoji'] as String?,
    );

Map<String, dynamic> _$$CountryModelImplToJson(_$CountryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'iso3': instance.iso3,
      'iso2': instance.iso2,
      'numeric_code': instance.numericCode,
      'phone_code': instance.phoneCode,
      'capital': instance.capital,
      'currency': instance.currency,
      'currency_name': instance.currencyName,
      'currency_symbol': instance.currencySymbol,
      'tld': instance.tld,
      'native': instance.native,
      'region': instance.region,
      'subregion': instance.subregion,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'emoji': instance.emoji,
    };
