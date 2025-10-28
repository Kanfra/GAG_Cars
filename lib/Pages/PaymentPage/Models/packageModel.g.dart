// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'packageModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PackageImpl _$$PackageImplFromJson(Map<String, dynamic> json) =>
    _$PackageImpl(
      id: json['id'] as String,
      countryId: (json['country_id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String?,
      price: json['price'] as String,
      numberOfListings: (json['number_of_listings'] as num?)?.toInt(),
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      categoryId: (json['category_id'] as num?)?.toInt(),
      packageType: json['package_type'] as String,
      promotionDays: (json['promotion_days'] as num?)?.toInt(),
      country: json['country'] == null
          ? null
          : Country.fromJson(json['country'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PackageImplToJson(_$PackageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'country_id': instance.countryId,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'number_of_listings': instance.numberOfListings,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'category_id': instance.categoryId,
      'package_type': instance.packageType,
      'promotion_days': instance.promotionDays,
      'country': instance.country,
    };

_$CountryImpl _$$CountryImplFromJson(Map<String, dynamic> json) =>
    _$CountryImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      iso3: json['iso3'] as String,
      iso2: json['iso2'] as String,
      numericCode: json['numeric_code'] as String,
      phoneCode: json['phone_code'] as String,
      capital: json['capital'] as String,
      currency: json['currency'] as String,
      currencyName: json['currency_name'] as String,
      currencySymbol: json['currency_symbol'] as String,
      tld: json['tld'] as String,
      native: json['native'] as String,
      region: json['region'] as String,
      subregion: json['subregion'] as String,
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
      emoji: json['emoji'] as String,
      emojiU: json['emojiU'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$$CountryImplToJson(_$CountryImpl instance) =>
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
      'emojiU': instance.emojiU,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
