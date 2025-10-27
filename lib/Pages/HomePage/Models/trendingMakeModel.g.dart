// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trendingMakeModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TrendingMakeImpl _$$TrendingMakeImplFromJson(Map<String, dynamic> json) =>
    _$TrendingMakeImpl(
      id: _safeParseInt(json['id']),
      userId: _safeParseString(json['user_id']),
      name: _safeParseStringWithDefault(json['name']),
      slug: _safeParseStringWithDefault(json['slug']),
      image: _safeParseStringWithDefault(json['image']),
      createdAt: _safeParseStringWithDefault(json['created_at']),
      updatedAt: _safeParseStringWithDefault(json['updated_at']),
    );

Map<String, dynamic> _$$TrendingMakeImplToJson(_$TrendingMakeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'name': instance.name,
      'slug': instance.slug,
      'image': instance.image,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

_$TrendingMakeResponseImpl _$$TrendingMakeResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$TrendingMakeResponseImpl(
      data: _safeParseTrendingMakeList(json['data']),
      links: _safeParsePaginationLinks(json['links']),
      meta: _safeParsePaginationMeta(json['meta']),
    );

Map<String, dynamic> _$$TrendingMakeResponseImplToJson(
        _$TrendingMakeResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'links': instance.links,
      'meta': instance.meta,
    };

_$PaginationLinksImpl _$$PaginationLinksImplFromJson(
        Map<String, dynamic> json) =>
    _$PaginationLinksImpl(
      first: _safeParseStringWithDefault(json['first']),
      last: _safeParseStringWithDefault(json['last']),
      prev: _safeParseString(json['prev']),
      next: _safeParseString(json['next']),
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
      currentPage: _safeParseIntWithDefault(json['current_page']),
      from: _safeParseIntWithDefault(json['from']),
      lastPage: _safeParseIntWithDefault(json['last_page']),
      links: _safeParsePaginationMetaLinkList(json['links']),
      path: _safeParseStringWithDefault(json['path']),
      perPage: _safeParseIntWithDefault(json['per_page']),
      to: _safeParseIntWithDefault(json['to']),
      total: _safeParseIntWithDefault(json['total']),
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

_$PaginationMetaLinkImpl _$$PaginationMetaLinkImplFromJson(
        Map<String, dynamic> json) =>
    _$PaginationMetaLinkImpl(
      url: _safeParseString(json['url']),
      label: _safeParseStringWithDefault(json['label']),
      active: _safeParseBoolWithDefault(json['active']),
    );

Map<String, dynamic> _$$PaginationMetaLinkImplToJson(
        _$PaginationMetaLinkImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'label': instance.label,
      'active': instance.active,
    };
