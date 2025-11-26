// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itemCategoryModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemCategoryResponseImpl _$$ItemCategoryResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ItemCategoryResponseImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => ItemCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: PaginationLinks.fromJson(json['links'] as Map<String, dynamic>),
      meta: PaginationMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ItemCategoryResponseImplToJson(
        _$ItemCategoryResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'links': instance.links,
      'meta': instance.meta,
    };

_$ItemCategoryImpl _$$ItemCategoryImplFromJson(Map<String, dynamic> json) =>
    _$ItemCategoryImpl(
      id: _parseInt(json['id']),
      userId: _parseNullableInt(json['user_id']),
      parentId: _parseNullableInt(json['parent_id']),
      name: _parseString(json['name']),
      slug: _parseString(json['slug']),
      description: _parseString(json['description']),
      features: _parseStringList(json['features']),
      image: _parseString(json['image']),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      itemFields: (json['item_fields'] as List<dynamic>)
          .map((e) => ItemField.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ItemCategoryImplToJson(_$ItemCategoryImpl instance) =>
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
      'item_fields': instance.itemFields.map((e) => e.toJson()).toList(),
    };

_$ItemFieldImpl _$$ItemFieldImplFromJson(Map<String, dynamic> json) =>
    _$ItemFieldImpl(
      id: _parseInt(json['id']),
      name: _parseString(json['name']),
      label: _parseString(json['label']),
      type: _parseString(json['type']),
      required: _boolFromInt(json['required']),
      unique: _boolFromInt(json['unique']),
      nullable: _boolFromInt(json['nullable']),
      options: json['options'] as List<dynamic>?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      pivot: ItemFieldPivot.fromJson(json['pivot'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ItemFieldImplToJson(_$ItemFieldImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'label': instance.label,
      'type': instance.type,
      'required': instance.required,
      'unique': instance.unique,
      'nullable': instance.nullable,
      'options': instance.options,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'pivot': instance.pivot.toJson(),
    };

_$ItemFieldPivotImpl _$$ItemFieldPivotImplFromJson(Map<String, dynamic> json) =>
    _$ItemFieldPivotImpl(
      categoryId: _parseInt(json['category_id']),
      itemFieldId: _parseInt(json['item_field_id']),
    );

Map<String, dynamic> _$$ItemFieldPivotImplToJson(
        _$ItemFieldPivotImpl instance) =>
    <String, dynamic>{
      'category_id': instance.categoryId,
      'item_field_id': instance.itemFieldId,
    };

_$PaginationLinksImpl _$$PaginationLinksImplFromJson(
        Map<String, dynamic> json) =>
    _$PaginationLinksImpl(
      first: _parseString(json['first']),
      last: _parseString(json['last']),
      prev: _parseNullableString(json['prev']),
      next: _parseNullableString(json['next']),
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
      currentPage: _parseInt(json['current_page']),
      from: _parseInt(json['from']),
      lastPage: _parseInt(json['last_page']),
      links: (json['links'] as List<dynamic>)
          .map((e) => PaginationLink.fromJson(e as Map<String, dynamic>))
          .toList(),
      path: _parseString(json['path']),
      perPage: _parseInt(json['per_page']),
      to: _parseInt(json['to']),
      total: _parseInt(json['total']),
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
      url: _parseNullableString(json['url']),
      label: _parseString(json['label']),
      active: json['active'] as bool,
    );

Map<String, dynamic> _$$PaginationLinkImplToJson(
        _$PaginationLinkImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'label': instance.label,
      'active': instance.active,
    };
