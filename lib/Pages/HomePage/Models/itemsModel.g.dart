// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itemsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: json['id'] as String,
  name: json['name'] as String,
  email: json['email'] as String,
  phone: json['phone'] as String?,
  emailVerifiedAt: json['email_verified_at'] == null
      ? null
      : DateTime.parse(json['email_verified_at'] as String),
  paidSeller: (json['paid_seller'] as num?)?.toInt(),
  deletedAt: json['deleted_at'] == null
      ? null
      : DateTime.parse(json['deleted_at'] as String),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  countryId: (json['country_id'] as num?)?.toInt(),
  stateId: (json['state_id'] as num?)?.toInt(),
  profilePhoto: json['profile_photo'] as String?,
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'phone': instance.phone,
  'email_verified_at': instance.emailVerifiedAt?.toIso8601String(),
  'paid_seller': instance.paidSeller,
  'deleted_at': instance.deletedAt?.toIso8601String(),
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
  'country_id': instance.countryId,
  'state_id': instance.stateId,
  'profile_photo': instance.profilePhoto,
};

_Brand _$BrandFromJson(Map<String, dynamic> json) => _Brand(
  id: (json['id'] as num).toInt(),
  userId: json['user_id'] as String?,
  name: json['name'] as String,
  slug: json['slug'] as String,
  image: json['image'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$BrandToJson(_Brand instance) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'name': instance.name,
  'slug': instance.slug,
  'image': instance.image,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
};

_BrandModel _$BrandModelFromJson(Map<String, dynamic> json) => _BrandModel(
  id: (json['id'] as num).toInt(),
  brandId: (json['brand_id'] as num).toInt(),
  name: json['name'] as String,
  slug: json['slug'] as String,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$BrandModelToJson(_BrandModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'brand_id': instance.brandId,
      'name': instance.name,
      'slug': instance.slug,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

_Category _$CategoryFromJson(Map<String, dynamic> json) => _Category(
  id: (json['id'] as num).toInt(),
  userId: json['user_id'] as String?,
  parentId: (json['parent_id'] as num?)?.toInt(),
  name: json['name'] as String,
  slug: json['slug'] as String,
  description: json['description'] as String?,
  features: (json['features'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  image: json['image'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$CategoryToJson(_Category instance) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'parent_id': instance.parentId,
  'name': instance.name,
  'slug': instance.slug,
  'description': instance.description,
  'features': instance.features,
  'image': instance.image,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
};

_RecommendedItem _$RecommendedItemFromJson(Map<String, dynamic> json) =>
    _RecommendedItem(
      id: json['id'] as String,
      userId: json['user_id'] as String?,
      countryId: (json['country_id'] as num?)?.toInt(),
      brandModelId: (json['brand_model_id'] as num?)?.toInt(),
      brandId: (json['brand_id'] as num?)?.toInt(),
      categoryId: (json['category_id'] as num?)?.toInt(),
      name: json['name'] as String?,
      year: json['year'] as String?,
      slug: json['slug'] as String?,
      description: json['description'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      location: json['location'] as String?,
      serialNumber: json['serial_number'] as String?,
      condition: json['condition'] as String?,
      steerPosition: json['steer_position'] as String?,
      engineCapacity: json['engine_capacity'] as String?,
      transmission: json['transmission'] as String?,
      color: json['color'] as String?,
      buildType: json['build_type'] as String?,
      numberOfPassengers: (json['number_of_passengers'] as num?)?.toInt(),
      features: (json['features'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      status: json['status'] as String?,
      price: json['price'] as String?,
      mileage: json['mileage'] as String?,
      warranty: (json['warranty'] as num?)?.toInt(),
      warrantyExpiration: json['warranty_expiration'] == null
          ? null
          : DateTime.parse(json['warranty_expiration'] as String),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      height: json['Height'] as String?,
      vin: json['VIN'] as String?,
      brand: json['brand'] == null
          ? null
          : Brand.fromJson(json['brand'] as Map<String, dynamic>),
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      brandModel: json['brand_model'] == null
          ? null
          : BrandModel.fromJson(json['brand_model'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      isPromoted: json['is_promoted'] as bool?,
    );

Map<String, dynamic> _$RecommendedItemToJson(_RecommendedItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'country_id': instance.countryId,
      'brand_model_id': instance.brandModelId,
      'brand_id': instance.brandId,
      'category_id': instance.categoryId,
      'name': instance.name,
      'year': instance.year,
      'slug': instance.slug,
      'description': instance.description,
      'images': instance.images,
      'location': instance.location,
      'serial_number': instance.serialNumber,
      'condition': instance.condition,
      'steer_position': instance.steerPosition,
      'engine_capacity': instance.engineCapacity,
      'transmission': instance.transmission,
      'color': instance.color,
      'build_type': instance.buildType,
      'number_of_passengers': instance.numberOfPassengers,
      'features': instance.features,
      'status': instance.status,
      'price': instance.price,
      'mileage': instance.mileage,
      'warranty': instance.warranty,
      'warranty_expiration': instance.warrantyExpiration?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'Height': instance.height,
      'VIN': instance.vin,
      'brand': instance.brand,
      'category': instance.category,
      'brand_model': instance.brandModel,
      'user': instance.user,
      'is_promoted': instance.isPromoted,
    };

_RecommendedResponse _$RecommendedResponseFromJson(Map<String, dynamic> json) =>
    _RecommendedResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => RecommendedItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: RecommendedLinks.fromJson(json['links'] as Map<String, dynamic>),
      meta: RecommendedMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RecommendedResponseToJson(
  _RecommendedResponse instance,
) => <String, dynamic>{
  'data': instance.data,
  'links': instance.links,
  'meta': instance.meta,
};

_RecommendedLinks _$RecommendedLinksFromJson(Map<String, dynamic> json) =>
    _RecommendedLinks(
      first: json['first'] as String,
      last: json['last'] as String,
      prev: json['prev'] as String?,
      next: json['next'] as String?,
    );

Map<String, dynamic> _$RecommendedLinksToJson(_RecommendedLinks instance) =>
    <String, dynamic>{
      'first': instance.first,
      'last': instance.last,
      'prev': instance.prev,
      'next': instance.next,
    };

_RecommendedMeta _$RecommendedMetaFromJson(Map<String, dynamic> json) =>
    _RecommendedMeta(
      currentPage: (json['current_page'] as num).toInt(),
      from: (json['from'] as num?)?.toInt(),
      lastPage: (json['last_page'] as num).toInt(),
      links: (json['links'] as List<dynamic>)
          .map((e) => RecommendedMetaLink.fromJson(e as Map<String, dynamic>))
          .toList(),
      path: json['path'] as String,
      perPage: (json['per_page'] as num).toInt(),
      to: (json['to'] as num?)?.toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$RecommendedMetaToJson(_RecommendedMeta instance) =>
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

_RecommendedMetaLink _$RecommendedMetaLinkFromJson(Map<String, dynamic> json) =>
    _RecommendedMetaLink(
      url: json['url'] as String?,
      label: json['label'] as String,
      page: (json['page'] as num?)?.toInt(),
      active: json['active'] as bool,
    );

Map<String, dynamic> _$RecommendedMetaLinkToJson(
  _RecommendedMetaLink instance,
) => <String, dynamic>{
  'url': instance.url,
  'label': instance.label,
  'page': instance.page,
  'active': instance.active,
};
