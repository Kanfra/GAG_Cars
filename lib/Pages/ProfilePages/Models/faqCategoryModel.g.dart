// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faqCategoryModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FaqCategoryResponse _$FaqCategoryResponseFromJson(Map<String, dynamic> json) =>
    _FaqCategoryResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => FaqCategoryWithFaqs.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: FaqCategoryLinks.fromJson(json['links'] as Map<String, dynamic>),
      meta: FaqCategoryMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FaqCategoryResponseToJson(
  _FaqCategoryResponse instance,
) => <String, dynamic>{
  'data': instance.data,
  'links': instance.links,
  'meta': instance.meta,
};

_FaqCategoryWithFaqs _$FaqCategoryWithFaqsFromJson(Map<String, dynamic> json) =>
    _FaqCategoryWithFaqs(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      slug: json['slug'] as String,
      description: json['description'] as String?,
      status: json['status'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      faqsCount: (json['faqs_count'] as num).toInt(),
      faqs: (json['faqs'] as List<dynamic>)
          .map((e) => FaqItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FaqCategoryWithFaqsToJson(
  _FaqCategoryWithFaqs instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'slug': instance.slug,
  'description': instance.description,
  'status': instance.status,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'faqs_count': instance.faqsCount,
  'faqs': instance.faqs,
};

_FaqItem _$FaqItemFromJson(Map<String, dynamic> json) => _FaqItem(
  id: json['id'] as String,
  userId: json['user_id'] as String,
  question: json['question'] as String,
  answer: json['answer'] as String,
  status: json['status'] as String,
  tags: json['tags'] as List<dynamic>,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  image: json['image'] as String?,
  categoryId: (json['category_id'] as num).toInt(),
);

Map<String, dynamic> _$FaqItemToJson(_FaqItem instance) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'question': instance.question,
  'answer': instance.answer,
  'status': instance.status,
  'tags': instance.tags,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'image': instance.image,
  'category_id': instance.categoryId,
};

_FaqCategoryLinks _$FaqCategoryLinksFromJson(Map<String, dynamic> json) =>
    _FaqCategoryLinks(
      first: json['first'] as String,
      last: json['last'] as String,
      prev: json['prev'] as String?,
      next: json['next'] as String?,
    );

Map<String, dynamic> _$FaqCategoryLinksToJson(_FaqCategoryLinks instance) =>
    <String, dynamic>{
      'first': instance.first,
      'last': instance.last,
      'prev': instance.prev,
      'next': instance.next,
    };

_FaqCategoryMeta _$FaqCategoryMetaFromJson(Map<String, dynamic> json) =>
    _FaqCategoryMeta(
      currentPage: (json['current_page'] as num).toInt(),
      from: (json['from'] as num).toInt(),
      lastPage: (json['last_page'] as num).toInt(),
      links: (json['links'] as List<dynamic>)
          .map((e) => FaqCategoryMetaLink.fromJson(e as Map<String, dynamic>))
          .toList(),
      path: json['path'] as String,
      perPage: (json['per_page'] as num).toInt(),
      to: (json['to'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$FaqCategoryMetaToJson(_FaqCategoryMeta instance) =>
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

_FaqCategoryMetaLink _$FaqCategoryMetaLinkFromJson(Map<String, dynamic> json) =>
    _FaqCategoryMetaLink(
      url: json['url'] as String?,
      label: json['label'] as String,
      page: (json['page'] as num?)?.toInt(),
      active: json['active'] as bool,
    );

Map<String, dynamic> _$FaqCategoryMetaLinkToJson(
  _FaqCategoryMetaLink instance,
) => <String, dynamic>{
  'url': instance.url,
  'label': instance.label,
  'page': instance.page,
  'active': instance.active,
};
