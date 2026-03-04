// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faqModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FaqResponse _$FaqResponseFromJson(Map<String, dynamic> json) => _FaqResponse(
  data: (json['data'] as List<dynamic>)
      .map((e) => Faq.fromJson(e as Map<String, dynamic>))
      .toList(),
  links: FaqLinks.fromJson(json['links'] as Map<String, dynamic>),
  meta: FaqMeta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$FaqResponseToJson(_FaqResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'links': instance.links,
      'meta': instance.meta,
    };

_Faq _$FaqFromJson(Map<String, dynamic> json) => _Faq(
  id: json['id'] as String,
  userId: json['user_id'] as String,
  question: json['question'] as String,
  answer: json['answer'] as String,
  status: json['status'] as String,
  tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  image: json['image'] as String?,
  categoryId: (json['category_id'] as num).toInt(),
  user: FaqUser.fromJson(json['user'] as Map<String, dynamic>),
  category: FaqCategory.fromJson(json['category'] as Map<String, dynamic>),
);

Map<String, dynamic> _$FaqToJson(_Faq instance) => <String, dynamic>{
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
  'user': instance.user,
  'category': instance.category,
};

_FaqUser _$FaqUserFromJson(Map<String, dynamic> json) => _FaqUser(
  id: json['id'] as String,
  name: json['name'] as String,
  email: json['email'] as String,
  phone: json['phone'] as String?,
  emailVerifiedAt: json['email_verified_at'] == null
      ? null
      : DateTime.parse(json['email_verified_at'] as String),
  paidSeller: (json['paid_seller'] as num).toInt(),
  deletedAt: json['deleted_at'] == null
      ? null
      : DateTime.parse(json['deleted_at'] as String),
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  countryId: (json['country_id'] as num?)?.toInt(),
  stateId: (json['state_id'] as num?)?.toInt(),
  profilePhoto: json['profile_photo'] as String?,
  uploadsLeft: (json['uploads_left'] as num?)?.toInt(),
  activeStatus: (json['active_status'] as num).toInt(),
  avatar: json['avatar'] as String,
  darkMode: (json['dark_mode'] as num).toInt(),
  messengerColor: json['messenger_color'] as String,
);

Map<String, dynamic> _$FaqUserToJson(_FaqUser instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'phone': instance.phone,
  'email_verified_at': instance.emailVerifiedAt?.toIso8601String(),
  'paid_seller': instance.paidSeller,
  'deleted_at': instance.deletedAt?.toIso8601String(),
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'country_id': instance.countryId,
  'state_id': instance.stateId,
  'profile_photo': instance.profilePhoto,
  'uploads_left': instance.uploadsLeft,
  'active_status': instance.activeStatus,
  'avatar': instance.avatar,
  'dark_mode': instance.darkMode,
  'messenger_color': instance.messengerColor,
};

_FaqCategory _$FaqCategoryFromJson(Map<String, dynamic> json) => _FaqCategory(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  slug: json['slug'] as String,
  description: json['description'] as String?,
  status: json['status'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$FaqCategoryToJson(_FaqCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'description': instance.description,
      'status': instance.status,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

_FaqLinks _$FaqLinksFromJson(Map<String, dynamic> json) => _FaqLinks(
  first: json['first'] as String,
  last: json['last'] as String,
  prev: json['prev'] as String?,
  next: json['next'] as String?,
);

Map<String, dynamic> _$FaqLinksToJson(_FaqLinks instance) => <String, dynamic>{
  'first': instance.first,
  'last': instance.last,
  'prev': instance.prev,
  'next': instance.next,
};

_FaqMeta _$FaqMetaFromJson(Map<String, dynamic> json) => _FaqMeta(
  currentPage: (json['current_page'] as num).toInt(),
  from: (json['from'] as num).toInt(),
  lastPage: (json['last_page'] as num).toInt(),
  links: (json['links'] as List<dynamic>)
      .map((e) => FaqMetaLink.fromJson(e as Map<String, dynamic>))
      .toList(),
  path: json['path'] as String,
  perPage: (json['per_page'] as num).toInt(),
  to: (json['to'] as num).toInt(),
  total: (json['total'] as num).toInt(),
);

Map<String, dynamic> _$FaqMetaToJson(_FaqMeta instance) => <String, dynamic>{
  'current_page': instance.currentPage,
  'from': instance.from,
  'last_page': instance.lastPage,
  'links': instance.links,
  'path': instance.path,
  'per_page': instance.perPage,
  'to': instance.to,
  'total': instance.total,
};

_FaqMetaLink _$FaqMetaLinkFromJson(Map<String, dynamic> json) => _FaqMetaLink(
  url: json['url'] as String?,
  label: json['label'] as String,
  page: (json['page'] as num?)?.toInt(),
  active: json['active'] as bool,
);

Map<String, dynamic> _$FaqMetaLinkToJson(_FaqMetaLink instance) =>
    <String, dynamic>{
      'url': instance.url,
      'label': instance.label,
      'page': instance.page,
      'active': instance.active,
    };
