// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'countryModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CountriesResponseImpl _$$CountriesResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CountriesResponseImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => Country.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: PaginationLinks.fromJson(json['links'] as Map<String, dynamic>),
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CountriesResponseImplToJson(
        _$CountriesResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'links': instance.links,
      'meta': instance.meta,
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
      slug: json['slug'] as String?,
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
      'slug': instance.slug,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
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

_$MetaImpl _$$MetaImplFromJson(Map<String, dynamic> json) => _$MetaImpl(
      currentPage: (json['current_page'] as num).toInt(),
      from: (json['from'] as num).toInt(),
      lastPage: (json['last_page'] as num).toInt(),
      links: (json['links'] as List<dynamic>)
          .map((e) => MetaLink.fromJson(e as Map<String, dynamic>))
          .toList(),
      path: json['path'] as String,
      perPage: (json['per_page'] as num).toInt(),
      to: (json['to'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$$MetaImplToJson(_$MetaImpl instance) =>
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

_$MetaLinkImpl _$$MetaLinkImplFromJson(Map<String, dynamic> json) =>
    _$MetaLinkImpl(
      url: json['url'] as String?,
      label: json['label'] as String,
      page: (json['page'] as num?)?.toInt(),
      active: json['active'] as bool,
    );

Map<String, dynamic> _$$MetaLinkImplToJson(_$MetaLinkImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'label': instance.label,
      'page': instance.page,
      'active': instance.active,
    };
