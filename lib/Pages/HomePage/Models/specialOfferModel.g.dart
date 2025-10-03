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
      userId: json['user_id'] as String?,
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
      userId: json['user_id'] as String?,
      countryId: _parseInt(json['country_id']),
      brandModelId: _parseInt(json['brand_model_id']),
      brandId: _parseInt(json['brand_id']),
      categoryId: _parseInt(json['category_id']),
      name: _parseString(json['name']),
      year: json['year'] as String?,
      slug: json['slug'] as String?,
      description: json['description'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      location: json['location'] as String?,
      serialNumber: json['serial_number'] as String?,
      condition: json['condition'] as String?,
      steerPosition: json['steer_position'] as String?,
      engineCapacity: json['engine_capacity'] as String?,
      transmission: json['transmission'] as String?,
      color: json['color'] as String?,
      buildType: json['build_type'] as String?,
      numberOfPassengers: _parseInt(json['number_of_passengers']),
      features: (json['features'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      status: json['status'] as String?,
      price: json['price'] as String?,
      mileage: json['mileage'] as String?,
      warranty: _parseInt(json['warranty']),
      warrantyExpiration: json['warranty_expiration'] as String?,
      deletedAt: json['deleted_at'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      brand: json['brand'] == null
          ? null
          : Brand.fromJson(json['brand'] as Map<String, dynamic>),
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      brandModel: json['brand_model'] == null
          ? null
          : BrandModel.fromJson(json['brand_model'] as Map<String, dynamic>),
      user: json['user'] as Map<String, dynamic>? ?? null,
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
      'brand': instance.brand,
      'category': instance.category,
      'brand_model': instance.brandModel,
      'user': instance.user,
    };

_$BrandImpl _$$BrandImplFromJson(Map<String, dynamic> json) => _$BrandImpl(
      id: _parseInt(json['id']),
      userId: json['user_id'] as String?,
      name: _parseString(json['name']),
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
      userId: json['user_id'] as String?,
      parentId: json['parent_id'] as String?,
      name: _parseString(json['name']),
      slug: json['slug'] as String?,
      description: json['description'] as String?,
      features: (json['features'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
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
      brandId: _parseInt(json['brand_id']),
      name: _parseString(json['name']),
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
