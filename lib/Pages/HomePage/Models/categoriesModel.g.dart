// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categoriesModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaginationLinks _$PaginationLinksFromJson(Map<String, dynamic> json) =>
    _PaginationLinks(
      first: json['first'] as String?,
      last: json['last'] as String?,
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
      current_page: (json['current_page'] as num).toInt(),
      from: (json['from'] as num).toInt(),
      last_page: (json['last_page'] as num).toInt(),
      path: json['path'] as String,
      per_page: (json['per_page'] as num).toInt(),
      to: (json['to'] as num).toInt(),
      total: (json['total'] as num).toInt(),
      links: json['links'] as List<dynamic>? ?? const [],
    );

Map<String, dynamic> _$PaginationMetaToJson(_PaginationMeta instance) =>
    <String, dynamic>{
      'current_page': instance.current_page,
      'from': instance.from,
      'last_page': instance.last_page,
      'path': instance.path,
      'per_page': instance.per_page,
      'to': instance.to,
      'total': instance.total,
      'links': instance.links,
    };

_MetaLink _$MetaLinkFromJson(Map<String, dynamic> json) => _MetaLink(
  url: json['url'] as String?,
  label: json['label'] as String,
  page: (json['page'] as num?)?.toInt(),
  active: json['active'] as bool,
);

Map<String, dynamic> _$MetaLinkToJson(_MetaLink instance) => <String, dynamic>{
  'url': instance.url,
  'label': instance.label,
  'page': instance.page,
  'active': instance.active,
};

_ItemField _$ItemFieldFromJson(Map<String, dynamic> json) => _ItemField(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  label: json['label'] as String,
  type: json['type'] as String,
  isRequired: (json['required'] as num).toInt(),
  unique: (json['unique'] as num).toInt(),
  nullable: (json['nullable'] as num).toInt(),
  options: json['options'],
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  pivot: json['pivot'] as Map<String, dynamic>?,
  optionsKeys: (json['options_keys'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$ItemFieldToJson(_ItemField instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'label': instance.label,
      'type': instance.type,
      'required': instance.isRequired,
      'unique': instance.unique,
      'nullable': instance.nullable,
      'options': instance.options,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'pivot': instance.pivot,
      'options_keys': instance.optionsKeys,
    };

_Categories _$CategoriesFromJson(Map<String, dynamic> json) => _Categories(
  id: (json['id'] as num).toInt(),
  userId: json['user_id'] as String?,
  parentId: (json['parent_id'] as num?)?.toInt(),
  name: json['name'] as String,
  slug: json['slug'] as String? ?? '',
  description: json['description'] as String? ?? '',
  features:
      (json['features'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  image: json['image'] as String? ?? 'assets/images/category_placeholder.png',
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  itemFields:
      (json['item_fields'] as List<dynamic>?)
          ?.map((e) => ItemField.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  highlightedFields:
      (json['highlighted_fields'] as List<dynamic>?)
          ?.map((e) => ItemField.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$CategoriesToJson(_Categories instance) =>
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
      'item_fields': instance.itemFields,
      'highlighted_fields': instance.highlightedFields,
    };

_CategoriesResponse _$CategoriesResponseFromJson(Map<String, dynamic> json) =>
    _CategoriesResponse(
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => Categories.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      links: PaginationLinks.fromJson(json['links'] as Map<String, dynamic>),
      meta: PaginationMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CategoriesResponseToJson(_CategoriesResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'links': instance.links,
      'meta': instance.meta,
    };

_DetailedCategory _$DetailedCategoryFromJson(
  Map<String, dynamic> json,
) => _DetailedCategory(
  id: (json['id'] as num).toInt(),
  userId: json['user_id'] as String?,
  parentId: (json['parent_id'] as num?)?.toInt(),
  name: json['name'] as String,
  slug: json['slug'] as String? ?? '',
  description: json['description'] as String? ?? '',
  features:
      (json['features'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  image: json['image'] as String? ?? 'assets/images/category_placeholder.png',
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  itemFields:
      (json['item_fields'] as List<dynamic>?)
          ?.map((e) => ItemField.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  highlightedFields:
      (json['highlighted_fields'] as List<dynamic>?)
          ?.map((e) => ItemField.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$DetailedCategoryToJson(_DetailedCategory instance) =>
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
      'item_fields': instance.itemFields,
      'highlighted_fields': instance.highlightedFields,
    };

_DetailedCategoryResponse _$DetailedCategoryResponseFromJson(
  Map<String, dynamic> json,
) => _DetailedCategoryResponse(
  data: DetailedCategory.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DetailedCategoryResponseToJson(
  _DetailedCategoryResponse instance,
) => <String, dynamic>{'data': instance.data};
