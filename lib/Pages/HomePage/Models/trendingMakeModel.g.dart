// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trendingMakeModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrendingMake _$TrendingMakeFromJson(Map<String, dynamic> json) =>
    _TrendingMake(
      id: _safeParseInt(json['id']),
      userId: _safeParseString(json['user_id']),
      name: _safeParseStringWithDefault(json['name']),
      slug: _safeParseStringWithDefault(json['slug']),
      image: _safeParseString(json['image']),
      createdAt: _safeParseStringWithDefault(json['created_at']),
      updatedAt: _safeParseStringWithDefault(json['updated_at']),
      itemsCount: _safeParseIntWithDefault(json['items_count']),
      brandModels: _safeParseBrandModelList(json['brand_models']),
    );

Map<String, dynamic> _$TrendingMakeToJson(_TrendingMake instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'name': instance.name,
      'slug': instance.slug,
      'image': instance.image,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'items_count': instance.itemsCount,
      'brand_models': instance.brandModels,
    };

_BrandModel _$BrandModelFromJson(Map<String, dynamic> json) => _BrandModel(
  id: _safeParseInt(json['id']),
  brandId: _safeParseInt(json['brand_id']),
  name: _safeParseStringWithDefault(json['name']),
  slug: _safeParseStringWithDefault(json['slug']),
  createdAt: _safeParseStringWithDefault(json['created_at']),
  updatedAt: _safeParseStringWithDefault(json['updated_at']),
);

Map<String, dynamic> _$BrandModelToJson(_BrandModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'brand_id': instance.brandId,
      'name': instance.name,
      'slug': instance.slug,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

_TrendingMakeResponse _$TrendingMakeResponseFromJson(
  Map<String, dynamic> json,
) => _TrendingMakeResponse(
  data: _safeParseTrendingMakeList(json['data']),
  links: _safeParsePaginationLinks(json['links']),
  meta: _safeParsePaginationMeta(json['meta']),
);

Map<String, dynamic> _$TrendingMakeResponseToJson(
  _TrendingMakeResponse instance,
) => <String, dynamic>{
  'data': instance.data,
  'links': instance.links,
  'meta': instance.meta,
};

_PaginationLinks _$PaginationLinksFromJson(Map<String, dynamic> json) =>
    _PaginationLinks(
      first: _safeParseStringWithDefault(json['first']),
      last: _safeParseStringWithDefault(json['last']),
      prev: _safeParseString(json['prev']),
      next: _safeParseString(json['next']),
    );

Map<String, dynamic> _$PaginationLinksToJson(_PaginationLinks instance) =>
    <String, dynamic>{
      'first': instance.first,
      'last': instance.last,
      'prev': instance.prev,
      'next': instance.next,
    };

_PaginationMeta _$PaginationMetaFromJson(Map<String, dynamic> json) =>
    _PaginationMeta(
      currentPage: _safeParseIntWithDefault(json['current_page']),
      from: _safeParseIntWithDefault(json['from']),
      lastPage: _safeParseIntWithDefault(json['last_page']),
      links: _safeParsePaginationMetaLinkList(json['links']),
      path: _safeParseStringWithDefault(json['path']),
      perPage: _safeParseIntWithDefault(json['per_page']),
      to: _safeParseIntWithDefault(json['to']),
      total: _safeParseIntWithDefault(json['total']),
    );

Map<String, dynamic> _$PaginationMetaToJson(_PaginationMeta instance) =>
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

_PaginationMetaLink _$PaginationMetaLinkFromJson(Map<String, dynamic> json) =>
    _PaginationMetaLink(
      url: _safeParseString(json['url']),
      label: _safeParseStringWithDefault(json['label']),
      active: _safeParseBoolWithDefault(json['active']),
    );

Map<String, dynamic> _$PaginationMetaLinkToJson(_PaginationMetaLink instance) =>
    <String, dynamic>{
      'url': instance.url,
      'label': instance.label,
      'active': instance.active,
    };
