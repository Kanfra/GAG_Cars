// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faqCategoryModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FaqCategoryResponseImpl _$$FaqCategoryResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$FaqCategoryResponseImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => FaqCategoryWithFaqs.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: FaqCategoryLinks.fromJson(json['links'] as Map<String, dynamic>),
      meta: FaqCategoryMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FaqCategoryResponseImplToJson(
        _$FaqCategoryResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'links': instance.links,
      'meta': instance.meta,
    };

_$FaqCategoryWithFaqsImpl _$$FaqCategoryWithFaqsImplFromJson(
        Map<String, dynamic> json) =>
    _$FaqCategoryWithFaqsImpl(
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

Map<String, dynamic> _$$FaqCategoryWithFaqsImplToJson(
        _$FaqCategoryWithFaqsImpl instance) =>
    <String, dynamic>{
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

_$FaqItemImpl _$$FaqItemImplFromJson(Map<String, dynamic> json) =>
    _$FaqItemImpl(
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

Map<String, dynamic> _$$FaqItemImplToJson(_$FaqItemImpl instance) =>
    <String, dynamic>{
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

_$FaqCategoryLinksImpl _$$FaqCategoryLinksImplFromJson(
        Map<String, dynamic> json) =>
    _$FaqCategoryLinksImpl(
      first: json['first'] as String,
      last: json['last'] as String,
      prev: json['prev'] as String?,
      next: json['next'] as String?,
    );

Map<String, dynamic> _$$FaqCategoryLinksImplToJson(
        _$FaqCategoryLinksImpl instance) =>
    <String, dynamic>{
      'first': instance.first,
      'last': instance.last,
      'prev': instance.prev,
      'next': instance.next,
    };

_$FaqCategoryMetaImpl _$$FaqCategoryMetaImplFromJson(
        Map<String, dynamic> json) =>
    _$FaqCategoryMetaImpl(
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

Map<String, dynamic> _$$FaqCategoryMetaImplToJson(
        _$FaqCategoryMetaImpl instance) =>
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

_$FaqCategoryMetaLinkImpl _$$FaqCategoryMetaLinkImplFromJson(
        Map<String, dynamic> json) =>
    _$FaqCategoryMetaLinkImpl(
      url: json['url'] as String?,
      label: json['label'] as String,
      page: (json['page'] as num?)?.toInt(),
      active: json['active'] as bool,
    );

Map<String, dynamic> _$$FaqCategoryMetaLinkImplToJson(
        _$FaqCategoryMetaLinkImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'label': instance.label,
      'page': instance.page,
      'active': instance.active,
    };
