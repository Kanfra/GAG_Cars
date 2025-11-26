// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userListingsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryImpl _$$CategoryImplFromJson(Map<String, dynamic> json) =>
    _$CategoryImpl(
      id: _parseInt(json['id']),
      userId: json['user_id'],
      parentId: json['parent_id'],
      name: _parseString(json['name']),
      slug: _parseString(json['slug']),
      description: _parseString(json['description']),
      features: _parseStringList(json['features']),
      image: _parseString(json['image']),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
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
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

_$ListingImpl _$$ListingImplFromJson(Map<String, dynamic> json) =>
    _$ListingImpl(
      id: _parseNullableString(json['id']),
      userId: _parseNullableString(json['user_id']),
      countryId: json['country_id'],
      brandModelId: _parseNullableInt(json['brand_model_id']),
      brandId: _parseNullableInt(json['brand_id']),
      categoryId: _parseNullableInt(json['category_id']),
      name: _parseNullableString(json['name']),
      year: _parseNullableString(json['year']),
      slug: _parseNullableString(json['slug']),
      description: _parseNullableString(json['description']),
      images: _parseStringList(json['images']),
      location: _parseNullableString(json['location']),
      serialNumber: json['serial_number'],
      condition: json['condition'],
      steerPosition: _parseNullableString(json['steer_position']),
      engineCapacity: json['engine_capacity'],
      transmission: json['transmission'],
      color: json['color'],
      buildType: json['build_type'],
      numberOfPassengers: json['number_of_passengers'],
      features: json['features'] as List<dynamic>?,
      status: json['status'],
      price: _parseNullableString(json['price']),
      mileage: json['mileage'],
      warranty: json['warranty'],
      warrantyExpiration: json['warranty_expiration'],
      deletedAt: json['deleted_at'],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      Height: json['Height'],
      VIN: json['VIN'],
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      isPromoted: json['is_promoted'] as bool?,
    );

Map<String, dynamic> _$$ListingImplToJson(_$ListingImpl instance) =>
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
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'Height': instance.Height,
      'VIN': instance.VIN,
      'category': instance.category,
      'is_promoted': instance.isPromoted,
    };

_$ListingResponseImpl _$$ListingResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ListingResponseImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => Listing.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ListingResponseImplToJson(
        _$ListingResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$ErrorResponseImpl _$$ErrorResponseImplFromJson(Map<String, dynamic> json) =>
    _$ErrorResponseImpl(
      message: _parseNullableString(json['message']),
      error: _parseNullableString(json['error']),
      errorDescription: _parseNullableString(json['error_description']),
    );

Map<String, dynamic> _$$ErrorResponseImplToJson(_$ErrorResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'error': instance.error,
      'error_description': instance.errorDescription,
    };
