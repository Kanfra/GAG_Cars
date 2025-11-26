// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itemModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: _parseDynamicToString(json['id']),
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String?,
      emailVerifiedAt: json['email_verified_at'] == null
          ? null
          : DateTime.parse(json['email_verified_at'] as String),
      paidSeller: _parseDynamicToInt(json['paid_seller']),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      countryId: _parseDynamicToInt(json['country_id']),
      stateId: _parseDynamicToInt(json['state_id']),
      profilePhoto: _parseDynamicToString(json['profile_photo']),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
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

_$BrandImpl _$$BrandImplFromJson(Map<String, dynamic> json) => _$BrandImpl(
      id: _parseDynamicToInt(json['id']),
      userId: _parseDynamicToString(json['user_id']),
      name: json['name'] as String,
      slug: json['slug'] as String,
      image: _parseDynamicToString(json['image']),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$BrandImplToJson(_$BrandImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'name': instance.name,
      'slug': instance.slug,
      'image': instance.image,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

_$BrandModelImpl _$$BrandModelImplFromJson(Map<String, dynamic> json) =>
    _$BrandModelImpl(
      id: _parseDynamicToInt(json['id']),
      brandId: _parseDynamicToInt(json['brand_id']),
      name: json['name'] as String,
      slug: json['slug'] as String,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$BrandModelImplToJson(_$BrandModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'brand_id': instance.brandId,
      'name': instance.name,
      'slug': instance.slug,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

_$CategoryImpl _$$CategoryImplFromJson(Map<String, dynamic> json) =>
    _$CategoryImpl(
      id: _parseDynamicToInt(json['id']),
      userId: _parseDynamicToString(json['user_id']),
      parentId: _parseDynamicToInt(json['parent_id']),
      name: json['name'] as String,
      slug: json['slug'] as String,
      description: _parseDynamicToString(json['description']),
      features: (json['features'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      image: _parseDynamicToString(json['image']),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$CategoryImplToJson(_$CategoryImpl instance) =>
    <String, dynamic>{
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

_$SingleItemImpl _$$SingleItemImplFromJson(Map<String, dynamic> json) =>
    _$SingleItemImpl(
      id: _parseDynamicToString(json['id']),
      userId: _parseDynamicToString(json['user_id']),
      countryId: _parseDynamicToInt(json['country_id']),
      brandModelId: _parseDynamicToInt(json['brand_model_id']),
      brandId: _parseDynamicToInt(json['brand_id']),
      categoryId: _parseDynamicToInt(json['category_id']),
      name: _parseDynamicToString(json['name']),
      year: _parseDynamicToString(json['year']),
      slug: _parseDynamicToString(json['slug']),
      description: _parseDynamicToString(json['description']),
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      location: _parseDynamicToString(json['location']),
      serialNumber: _parseDynamicToString(json['serial_number']),
      condition: _parseDynamicToString(json['condition']),
      steerPosition: _parseDynamicToString(json['steer_position']),
      engineCapacity: _parseDynamicToString(json['engine_capacity']),
      transmission: _parseDynamicToString(json['transmission']),
      color: _parseDynamicToString(json['color']),
      buildType: _parseDynamicToString(json['build_type']),
      numberOfPassengers: _parseDynamicToInt(json['number_of_passengers']),
      features: (json['features'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      status: _parseDynamicToString(json['status']),
      price: _parseDynamicToString(json['price']),
      mileage: _parseDynamicToString(json['mileage']),
      warranty: _parseDynamicToInt(json['warranty']),
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
      height: _parseDynamicToString(json['Height']),
      vin: _parseDynamicToString(json['VIN']),
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
      isPromoted: _parseDynamicToBool(json['is_promoted']),
    );

Map<String, dynamic> _$$SingleItemImplToJson(_$SingleItemImpl instance) =>
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

_$SingleItemResponseImpl _$$SingleItemResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SingleItemResponseImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => SingleItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: SingleItemLinks.fromJson(json['links'] as Map<String, dynamic>),
      meta: SingleItemMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SingleItemResponseImplToJson(
        _$SingleItemResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'links': instance.links,
      'meta': instance.meta,
    };

_$SingleItemLinksImpl _$$SingleItemLinksImplFromJson(
        Map<String, dynamic> json) =>
    _$SingleItemLinksImpl(
      first: json['first'] as String,
      last: json['last'] as String,
      prev: json['prev'] as String?,
      next: json['next'] as String?,
    );

Map<String, dynamic> _$$SingleItemLinksImplToJson(
        _$SingleItemLinksImpl instance) =>
    <String, dynamic>{
      'first': instance.first,
      'last': instance.last,
      'prev': instance.prev,
      'next': instance.next,
    };

_$SingleItemMetaImpl _$$SingleItemMetaImplFromJson(Map<String, dynamic> json) =>
    _$SingleItemMetaImpl(
      currentPage: _parseDynamicToInt(json['current_page']),
      from: _parseDynamicToInt(json['from']),
      lastPage: _parseDynamicToInt(json['last_page']),
      links: (json['links'] as List<dynamic>)
          .map((e) => SingleItemMetaLink.fromJson(e as Map<String, dynamic>))
          .toList(),
      path: json['path'] as String,
      perPage: _parseDynamicToInt(json['per_page']),
      to: _parseDynamicToInt(json['to']),
      total: _parseDynamicToInt(json['total']),
    );

Map<String, dynamic> _$$SingleItemMetaImplToJson(
        _$SingleItemMetaImpl instance) =>
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

_$SingleItemMetaLinkImpl _$$SingleItemMetaLinkImplFromJson(
        Map<String, dynamic> json) =>
    _$SingleItemMetaLinkImpl(
      url: _parseDynamicToString(json['url']),
      label: _parseDynamicToString(json['label']),
      page: _parseDynamicToInt(json['page']),
      active: _parseDynamicToBool(json['active']),
    );

Map<String, dynamic> _$$SingleItemMetaLinkImplToJson(
        _$SingleItemMetaLinkImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'label': instance.label,
      'page': instance.page,
      'active': instance.active,
    };
