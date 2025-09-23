// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categoriesModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoriesImpl _$$CategoriesImplFromJson(Map<String, dynamic> json) =>
    _$CategoriesImpl(
      id: (json['id'] as num).toInt(),
      userId: json['user_id'] as String?,
      parentId: (json['parent_id'] as num?)?.toInt(),
      name: json['name'] as String,
      slug: json['slug'] as String? ?? '',
      description: json['description'] as String? ?? '',
      features: (json['features'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      image:
          json['image'] as String? ?? 'assets/images/category_placeholder.png',
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$CategoriesImplToJson(_$CategoriesImpl instance) =>
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

_$ItemFieldImpl _$$ItemFieldImplFromJson(Map<String, dynamic> json) =>
    _$ItemFieldImpl(
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

Map<String, dynamic> _$$ItemFieldImplToJson(_$ItemFieldImpl instance) =>
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

_$DetailedCategoryImpl _$$DetailedCategoryImplFromJson(
        Map<String, dynamic> json) =>
    _$DetailedCategoryImpl(
      id: (json['id'] as num).toInt(),
      userId: json['user_id'] as String?,
      parentId: (json['parent_id'] as num?)?.toInt(),
      name: json['name'] as String,
      slug: json['slug'] as String? ?? '',
      description: json['description'] as String? ?? '',
      features: (json['features'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      image:
          json['image'] as String? ?? 'assets/images/category_placeholder.png',
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      itemFields: (json['item_fields'] as List<dynamic>?)
              ?.map((e) => ItemField.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      highlightedFields: (json['highlighted_fields'] as List<dynamic>?)
              ?.map((e) => ItemField.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$DetailedCategoryImplToJson(
        _$DetailedCategoryImpl instance) =>
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

_$CategoriesResponseImpl _$$CategoriesResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CategoriesResponseImpl(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => Categories.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$CategoriesResponseImplToJson(
        _$CategoriesResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$DetailedCategoryResponseImpl _$$DetailedCategoryResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$DetailedCategoryResponseImpl(
      data: DetailedCategory.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DetailedCategoryResponseImplToJson(
        _$DetailedCategoryResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
