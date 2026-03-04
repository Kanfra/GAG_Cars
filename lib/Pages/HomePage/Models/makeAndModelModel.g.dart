// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'makeAndModelModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MakeAndModelResponse _$MakeAndModelResponseFromJson(
  Map<String, dynamic> json,
) => _MakeAndModelResponse(
  data: (json['data'] as List<dynamic>)
      .map((e) => VehicleMake.fromJson(e as Map<String, dynamic>))
      .toList(),
  links: PaginationLinks.fromJson(json['links'] as Map<String, dynamic>),
  meta: PaginationMeta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MakeAndModelResponseToJson(
  _MakeAndModelResponse instance,
) => <String, dynamic>{
  'data': instance.data,
  'links': instance.links,
  'meta': instance.meta,
};

_VehicleMake _$VehicleMakeFromJson(Map<String, dynamic> json) => _VehicleMake(
  id: _parseInt(json['id']),
  userId: _parseInt(json['user_id']),
  name: json['name'] as String,
  slug: json['slug'] as String,
  image: json['image'] as String?,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  models: (json['brand_models'] as List<dynamic>)
      .map((e) => VehicleModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$VehicleMakeToJson(_VehicleMake instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'name': instance.name,
      'slug': instance.slug,
      'image': instance.image,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'brand_models': instance.models,
    };

_VehicleModel _$VehicleModelFromJson(Map<String, dynamic> json) =>
    _VehicleModel(
      id: _parseInt(json['id']),
      makeId: _parseInt(json['brand_id']),
      name: json['name'] as String,
      slug: json['slug'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$VehicleModelToJson(_VehicleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'brand_id': instance.makeId,
      'name': instance.name,
      'slug': instance.slug,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

_PaginationLinks _$PaginationLinksFromJson(Map<String, dynamic> json) =>
    _PaginationLinks(
      first: json['first'] as String,
      last: json['last'] as String,
      prev: json['prev'] as String?,
      next: json['next'] as String?,
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
      currentPage: _parseInt(json['current_page']),
      from: _parseInt(json['from']),
      lastPage: _parseInt(json['last_page']),
      links: (json['links'] as List<dynamic>)
          .map((e) => PaginationLink.fromJson(e as Map<String, dynamic>))
          .toList(),
      path: json['path'] as String,
      perPage: _parseInt(json['per_page']),
      to: _parseInt(json['to']),
      total: _parseInt(json['total']),
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

_PaginationLink _$PaginationLinkFromJson(Map<String, dynamic> json) =>
    _PaginationLink(
      url: json['url'] as String?,
      label: json['label'] as String,
      active: json['active'] as bool,
    );

Map<String, dynamic> _$PaginationLinkToJson(_PaginationLink instance) =>
    <String, dynamic>{
      'url': instance.url,
      'label': instance.label,
      'active': instance.active,
    };
