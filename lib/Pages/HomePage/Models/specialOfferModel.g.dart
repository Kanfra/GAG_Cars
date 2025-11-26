// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specialOfferModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SpecialOfferResponseImpl _$$SpecialOfferResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SpecialOfferResponseImpl(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => SpecialOffer.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      links: json['links'] == null
          ? null
          : PaginationLinks.fromJson(json['links'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : PaginationMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SpecialOfferResponseImplToJson(
        _$SpecialOfferResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'links': instance.links,
      'meta': instance.meta,
    };

_$SpecialOfferImpl _$$SpecialOfferImplFromJson(Map<String, dynamic> json) =>
    _$SpecialOfferImpl(
      id: _parseInt(json['id']),
      userId: _parseInt(json['user_id']),
      itemId: _parseString(json['item_id']),
      startAt: _parseString(json['start_at']),
      endAt: _parseString(json['end_at']),
      status: _parseString(json['status']),
      discount: _parseInt(json['discount']),
      discountType: _parseString(json['discount_type']),
      description: json['description'] as String?,
      createdAt: _parseString(json['created_at']),
      updatedAt: _parseString(json['updated_at']),
      item: json['item'] == null
          ? null
          : Item.fromJson(json['item'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SpecialOfferImplToJson(_$SpecialOfferImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'item_id': instance.itemId,
      'start_at': instance.startAt,
      'end_at': instance.endAt,
      'status': instance.status,
      'discount': instance.discount,
      'discount_type': instance.discountType,
      'description': instance.description,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'item': instance.item,
    };

_$ItemImpl _$$ItemImplFromJson(Map<String, dynamic> json) => _$ItemImpl(
      id: _parseString(json['id']),
      userId: _parseInt(json['user_id']),
      countryId: _parseInt(json['country_id']),
      brandModelId: _parseInt(json['brand_model_id']),
      brandId: _parseInt(json['brand_id']),
      categoryId: _parseInt(json['category_id']),
      name: _parseString(json['name']),
      year: _parseString(json['year']),
      slug: _parseString(json['slug']),
      description: _parseString(json['description']),
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      location: _parseString(json['location']),
      serialNumber: _parseString(json['serial_number']),
      condition: _parseString(json['condition']),
      steerPosition: _parseString(json['steer_position']),
      engineCapacity: _parseString(json['engine_capacity']),
      transmission: _parseString(json['transmission']),
      color: _parseString(json['color']),
      buildType: _parseString(json['build_type']),
      numberOfPassengers: _parseInt(json['number_of_passengers']),
      features: (json['features'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      status: _parseString(json['status']),
      price: _parseString(json['price']),
      mileage: _parseString(json['mileage']),
      warranty: _parseInt(json['warranty']),
      warrantyExpiration: _parseString(json['warranty_expiration']),
      deletedAt: _parseString(json['deleted_at']),
      createdAt: _parseString(json['created_at']),
      updatedAt: _parseString(json['updated_at']),
      Height: _parseString(json['Height']),
      VIN: _parseString(json['VIN']),
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

Map<String, dynamic> _$$ItemImplToJson(_$ItemImpl instance) =>
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
      'warranty_expiration': instance.warrantyExpiration,
      'deleted_at': instance.deletedAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'Height': instance.Height,
      'VIN': instance.VIN,
      'brand': instance.brand,
      'category': instance.category,
      'brand_model': instance.brandModel,
      'user': instance.user,
    };

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: _parseString(json['id']),
      name: _parseString(json['name']),
      email: _parseString(json['email']),
      phone: _parseString(json['phone']),
      emailVerifiedAt: _parseString(json['email_verified_at']),
      paidSeller: _parseInt(json['paid_seller']),
      deletedAt: _parseString(json['deleted_at']),
      createdAt: _parseString(json['created_at']),
      updatedAt: _parseString(json['updated_at']),
      countryId: _parseInt(json['country_id']),
      stateId: _parseInt(json['state_id']),
      profilePhoto: _parseString(json['profile_photo']),
      uploadsLeft: _parseInt(json['uploads_left']),
      activeStatus: _parseInt(json['active_status']),
      avatar: _parseString(json['avatar']),
      darkMode: _parseInt(json['dark_mode']),
      messengerColor: _parseString(json['messenger_color']),
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

_$BrandImpl _$$BrandImplFromJson(Map<String, dynamic> json) => _$BrandImpl(
      id: _parseInt(json['id']),
      userId: _parseInt(json['user_id']),
      name: _parseString(json['name']),
      slug: _parseString(json['slug']),
      image: _parseString(json['image']),
      createdAt: _parseString(json['created_at']),
      updatedAt: _parseString(json['updated_at']),
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
      userId: _parseInt(json['user_id']),
      parentId: _parseInt(json['parent_id']),
      name: _parseString(json['name']),
      slug: _parseString(json['slug']),
      description: _parseString(json['description']),
      features: (json['features'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      image: _parseString(json['image']),
      createdAt: _parseString(json['created_at']),
      updatedAt: _parseString(json['updated_at']),
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
      brandId: _parseInt(json['brand_id']),
      name: _parseString(json['name']),
      slug: _parseString(json['slug']),
      createdAt: _parseString(json['created_at']),
      updatedAt: _parseString(json['updated_at']),
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
      currentPage: _parseInt(json['current_page']),
      from: _parseInt(json['from']),
      lastPage: _parseInt(json['last_page']),
      links: (json['links'] as List<dynamic>?)
          ?.map((e) => PaginationMetaLink.fromJson(e as Map<String, dynamic>))
          .toList(),
      path: json['path'] as String?,
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

_$PaginationMetaLinkImpl _$$PaginationMetaLinkImplFromJson(
        Map<String, dynamic> json) =>
    _$PaginationMetaLinkImpl(
      url: json['url'] as String?,
      label: json['label'] as String?,
      active: json['active'] as bool?,
    );

Map<String, dynamic> _$$PaginationMetaLinkImplToJson(
        _$PaginationMetaLinkImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'label': instance.label,
      'active': instance.active,
    };
