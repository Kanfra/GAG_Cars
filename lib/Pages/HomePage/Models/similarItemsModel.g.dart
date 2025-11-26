// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'similarItemsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SimilarItemsResponseImpl _$$SimilarItemsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SimilarItemsResponseImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => SimilarItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: json['links'] == null
          ? null
          : PaginationLinks.fromJson(json['links'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : PaginationMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SimilarItemsResponseImplToJson(
        _$SimilarItemsResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'links': instance.links,
      'meta': instance.meta,
    };

_$SimilarItemImpl _$$SimilarItemImplFromJson(Map<String, dynamic> json) =>
    _$SimilarItemImpl(
      id: json['id'] as String,
      userId: json['user_id'] as String?,
      countryId: _parseNullableInt(json['country_id']),
      brandModelId: _parseNullableInt(json['brand_model_id']),
      brandId: _parseNullableInt(json['brand_id']),
      categoryId: _parseNullableInt(json['category_id']),
      name: json['name'] as String?,
      year: json['year'] as String?,
      slug: json['slug'] as String?,
      description: json['description'] as String?,
      images: _parseStringList(json['images']),
      location: json['location'] as String?,
      serialNumber: json['serial_number'] as String?,
      condition: json['Condition'] as String?,
      steerPosition: json['steer_position'] as String?,
      engineCapacity: _parseNullableString(json['engine_capacity']),
      transmission: json['transmission'] as String?,
      color: json['color'] as String?,
      buildType: json['build_type'] as String?,
      numberOfPassengers: _parseNullableInt(json['number_of_passengers']),
      features: _parseStringList(json['features']),
      status: json['status'] as String?,
      price: _parseNullableString(json['price']),
      mileage: _parseNullableString(json['mileage']),
      warranty: _parseNullableInt(json['warranty']),
      warrantyExpiration: json['warranty_expiration'] as String?,
      deletedAt: json['deleted_at'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      height: _parseNullableString(json['Height']),
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
    );

Map<String, dynamic> _$$SimilarItemImplToJson(_$SimilarItemImpl instance) =>
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
      'Condition': instance.condition,
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
      'warranty_expiration': instance.warrantyExpiration,
      'deleted_at': instance.deletedAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'Height': instance.height,
      'VIN': instance.vin,
      'brand': instance.brand?.toJson(),
      'category': instance.category?.toJson(),
      'brand_model': instance.brandModel?.toJson(),
      'user': instance.user?.toJson(),
    };

_$BrandImpl _$$BrandImplFromJson(Map<String, dynamic> json) => _$BrandImpl(
      id: _parseInt(json['id']),
      userId: _parseNullableInt(json['user_id']),
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      image: json['image'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$BrandImplToJson(_$BrandImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'name': instance.name,
      'slug': instance.slug,
      'image': instance.image,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

_$CategoryImpl _$$CategoryImplFromJson(Map<String, dynamic> json) =>
    _$CategoryImpl(
      id: _parseInt(json['id']),
      userId: _parseNullableInt(json['user_id']),
      parentId: _parseNullableInt(json['parent_id']),
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      description: json['description'] as String?,
      features: _parseStringList(json['features']),
      image: json['image'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
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
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

_$BrandModelImpl _$$BrandModelImplFromJson(Map<String, dynamic> json) =>
    _$BrandModelImpl(
      id: _parseInt(json['id']),
      brandId: _parseNullableInt(json['brand_id']),
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$BrandModelImplToJson(_$BrandModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'brand_id': instance.brandId,
      'name': instance.name,
      'slug': instance.slug,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      emailVerifiedAt: json['email_verified_at'] as String?,
      paidSeller: _parseNullableInt(json['paid_seller']),
      deletedAt: json['deleted_at'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      countryId: _parseNullableInt(json['country_id']),
      stateId: _parseNullableInt(json['state_id']),
      profilePhoto: json['profile_photo'] as String?,
      uploadsLeft: _parseNullableInt(json['uploads_left']),
      activeStatus: _parseNullableInt(json['active_status']),
      avatar: json['avatar'] as String?,
      darkMode: _parseNullableInt(json['dark_mode']),
      messengerColor: json['messenger_color'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'email_verified_at': instance.emailVerifiedAt,
      'paid_seller': instance.paidSeller,
      'deleted_at': instance.deletedAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'country_id': instance.countryId,
      'state_id': instance.stateId,
      'profile_photo': instance.profilePhoto,
      'uploads_left': instance.uploadsLeft,
      'active_status': instance.activeStatus,
      'avatar': instance.avatar,
      'dark_mode': instance.darkMode,
      'messenger_color': instance.messengerColor,
    };

_$PaginationLinksImpl _$$PaginationLinksImplFromJson(
        Map<String, dynamic> json) =>
    _$PaginationLinksImpl(
      first: json['first'] as String?,
      last: json['last'] as String?,
      prev: json['prev'] as String?,
      next: json['next'] as String?,
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
      currentPage: _parseNullableInt(json['current_page']),
      from: _parseNullableInt(json['from']),
      lastPage: _parseNullableInt(json['last_page']),
      links: (json['links'] as List<dynamic>?)
          ?.map((e) => PaginationLink.fromJson(e as Map<String, dynamic>))
          .toList(),
      path: json['path'] as String?,
      perPage: _parseNullableInt(json['per_page']),
      to: _parseNullableInt(json['to']),
      total: _parseNullableInt(json['total']),
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
      url: json['url'] as String?,
      label: json['label'] as String?,
      active: json['active'] as bool?,
    );

Map<String, dynamic> _$$PaginationLinkImplToJson(
        _$PaginationLinkImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'label': instance.label,
      'active': instance.active,
    };
