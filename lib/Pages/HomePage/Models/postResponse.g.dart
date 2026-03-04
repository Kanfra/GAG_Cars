// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'postResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Category _$CategoryFromJson(Map<String, dynamic> json) => _Category(
  id: (json['id'] as num).toInt(),
  userId: json['user_id'] as String?,
  parentId: (json['parent_id'] as num?)?.toInt(),
  name: json['name'] as String,
  slug: json['slug'] as String,
  description: json['description'] as String?,
  image: json['image'] as String?,
  status: json['status'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$CategoryToJson(_Category instance) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'parent_id': instance.parentId,
  'name': instance.name,
  'slug': instance.slug,
  'description': instance.description,
  'image': instance.image,
  'status': instance.status,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};

_Post _$PostFromJson(Map<String, dynamic> json) => _Post(
  id: json['id'] as String,
  userId: json['user_id'] as String,
  countryId: (json['country_id'] as num).toInt(),
  title: json['title'] as String,
  slug: json['slug'] as String?,
  description: json['description'] as String?,
  image: json['image'] as String,
  status: json['status'] as String,
  content: json['content'] as String,
  tags: json['tags'] as List<dynamic>,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  categoryId: (json['category_id'] as num).toInt(),
  category: Category.fromJson(json['category'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PostToJson(_Post instance) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'country_id': instance.countryId,
  'title': instance.title,
  'slug': instance.slug,
  'description': instance.description,
  'image': instance.image,
  'status': instance.status,
  'content': instance.content,
  'tags': instance.tags,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'category_id': instance.categoryId,
  'category': instance.category,
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

_Links _$LinksFromJson(Map<String, dynamic> json) => _Links(
  first: json['first'] as String,
  last: json['last'] as String,
  prev: json['prev'] as String?,
  next: json['next'] as String?,
);

Map<String, dynamic> _$LinksToJson(_Links instance) => <String, dynamic>{
  'first': instance.first,
  'last': instance.last,
  'prev': instance.prev,
  'next': instance.next,
};

_Meta _$MetaFromJson(Map<String, dynamic> json) => _Meta(
  currentPage: (json['current_page'] as num).toInt(),
  from: (json['from'] as num?)?.toInt(),
  lastPage: (json['last_page'] as num).toInt(),
  links: (json['links'] as List<dynamic>)
      .map((e) => PaginationLink.fromJson(e as Map<String, dynamic>))
      .toList(),
  path: json['path'] as String,
  perPage: (json['per_page'] as num).toInt(),
  to: (json['to'] as num?)?.toInt(),
  total: (json['total'] as num).toInt(),
);

Map<String, dynamic> _$MetaToJson(_Meta instance) => <String, dynamic>{
  'current_page': instance.currentPage,
  'from': instance.from,
  'last_page': instance.lastPage,
  'links': instance.links,
  'path': instance.path,
  'per_page': instance.perPage,
  'to': instance.to,
  'total': instance.total,
};

_PostsResponse _$PostsResponseFromJson(Map<String, dynamic> json) =>
    _PostsResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => Post.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: Links.fromJson(json['links'] as Map<String, dynamic>),
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostsResponseToJson(_PostsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'links': instance.links,
      'meta': instance.meta,
    };
