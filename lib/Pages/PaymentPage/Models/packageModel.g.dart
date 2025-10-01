// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'packageModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PackageResponseImpl _$$PackageResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PackageResponseImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => Package.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: PaginationLinks.fromJson(json['links'] as Map<String, dynamic>),
      meta: PaginationMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PackageResponseImplToJson(
        _$PackageResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'links': instance.links,
      'meta': instance.meta,
    };

_$PackageImpl _$$PackageImplFromJson(Map<String, dynamic> json) =>
    _$PackageImpl(
      id: json['id'] as String,
      countryId: (json['country_id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String?,
      price: json['price'] as String,
      numberOfListings: (json['number_of_listings'] as num).toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      categoryId: (json['category_id'] as num?)?.toInt(),
      packageType: json['package_type'] as String,
      promotionDays: (json['promotion_days'] as num?)?.toInt(),
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      country: Country.fromJson(json['country'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PackageImplToJson(_$PackageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'country_id': instance.countryId,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'number_of_listings': instance.numberOfListings,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'category_id': instance.categoryId,
      'package_type': instance.packageType,
      'promotion_days': instance.promotionDays,
      'category': instance.category,
      'country': instance.country,
    };

_$CategoryImpl _$$CategoryImplFromJson(Map<String, dynamic> json) =>
    _$CategoryImpl(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      parentId: (json['parent_id'] as num?)?.toInt(),
      name: json['name'] as String,
      slug: json['slug'] as String,
      description: json['description'] as String?,
      features:
          (json['features'] as List<dynamic>).map((e) => e as String).toList(),
      image: json['image'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$CategoryImplToJson(_$CategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'parent_id': instance.parentId,
      'name': instance.name,
      'slug': instance.slug,
      'description': instance.description,
      'features': instance.features,
      'image': instance.image,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
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
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
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
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

_$PaginationLinksImpl _$$PaginationLinksImplFromJson(
        Map<String, dynamic> json) =>
    _$PaginationLinksImpl(
      first: json['first'] as String,
      last: json['last'] as String,
      prev: json['prev'] as String?,
      next: json['next'] as String?,
    );

Map<String, dynamic> _$$PaginationLinksImplToJson(
        _$PaginationLinksImpl instance) =>
    <String, dynamic>{
      'first': instance.first,
      'last': instance.last,
      'prev': instance.prev,
      'next': instance.next,
    };

_$PaginationMetaImpl _$$PaginationMetaImplFromJson(Map<String, dynamic> json) =>
    _$PaginationMetaImpl(
      currentPage: (json['current_page'] as num).toInt(),
      from: (json['from'] as num).toInt(),
      lastPage: (json['last_page'] as num).toInt(),
      links: (json['links'] as List<dynamic>)
          .map((e) => PaginationLink.fromJson(e as Map<String, dynamic>))
          .toList(),
      path: json['path'] as String,
      perPage: (json['per_page'] as num).toInt(),
      to: (json['to'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$$PaginationMetaImplToJson(
        _$PaginationMetaImpl instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'from': instance.from,
      'last_page': instance.lastPage,
      'links': instance.links,
      'path': instance.path,
      'per_page': instance.perPage,
      'to': instance.to,
      'total': instance.total,
    };

_$PaginationLinkImpl _$$PaginationLinkImplFromJson(Map<String, dynamic> json) =>
    _$PaginationLinkImpl(
      url: json['url'] as String?,
      label: json['label'] as String,
      page: (json['page'] as num?)?.toInt(),
      active: json['active'] as bool,
    );

Map<String, dynamic> _$$PaginationLinkImplToJson(
        _$PaginationLinkImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'label': instance.label,
      'page': instance.page,
      'active': instance.active,
    };
