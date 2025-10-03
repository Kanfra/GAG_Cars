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
      links: PaginationLinks.fromJson(json['links'] as Map<String, dynamic>),
      meta: PaginationMeta.fromJson(json['meta'] as Map<String, dynamic>),
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
      countryId: _parseInt(json['country_id']),
      brandModelId: _parseInt(json['brand_model_id']),
      brandId: _parseInt(json['brand_id']),
      categoryId: _parseInt(json['category_id']),
      name: json['name'] as String,
      year: json['year'] as String,
      slug: json['slug'] as String,
      description: json['description'] as String?,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      location: json['location'] as String?,
      serialNumber: json['serial_number'] as String?,
      condition: json['condition'] as String?,
      steerPosition: json['steer_position'] as String?,
      engineCapacity: json['engine_capacity'] as String?,
      transmission: json['transmission'] as String?,
      color: json['color'] as String?,
      buildType: json['build_type'] as String?,
      numberOfPassengers: _parseInt(json['number_of_passengers']),
      features:
          (json['features'] as List<dynamic>).map((e) => e as String).toList(),
      status: json['status'] as String?,
      price: json['price'] as String,
      mileage: json['mileage'] as String?,
      warranty: _parseInt(json['warranty']),
      warrantyExpiration: json['warranty_expiration'] as String?,
      deletedAt: json['deleted_at'] as String?,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      height: json['Height'] as String?,
      vin: json['VIN'] as String?,
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
      'Height': instance.height,
      'VIN': instance.vin,
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
      links: (json['links'] as List<dynamic>)
          .map((e) => PaginationLink.fromJson(e as Map<String, dynamic>))
          .toList(),
      path: json['path'] as String,
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

_$PaginationLinkImpl _$$PaginationLinkImplFromJson(Map<String, dynamic> json) =>
    _$PaginationLinkImpl(
      url: json['url'] as String?,
      label: json['label'] as String,
      active: json['active'] as bool,
    );

Map<String, dynamic> _$$PaginationLinkImplToJson(
        _$PaginationLinkImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'label': instance.label,
      'active': instance.active,
    };
