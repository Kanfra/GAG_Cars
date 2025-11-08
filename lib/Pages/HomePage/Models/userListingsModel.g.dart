// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userListingsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryImpl _$$CategoryImplFromJson(Map<String, dynamic> json) =>
    _$CategoryImpl(
      id: (json['id'] as num).toInt(),
      userId: json['user_id'],
      parentId: json['parent_id'],
      name: json['name'] as String,
      slug: json['slug'] as String,
      description: json['description'] as String,
      features:
          (json['features'] as List<dynamic>).map((e) => e as String).toList(),
      image: json['image'] as String,
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
      id: json['id'] as String?,
      userId: json['user_id'] as String?,
      countryId: json['country_id'],
      brandModelId: (json['brand_model_id'] as num?)?.toInt(),
      brandId: (json['brand_id'] as num?)?.toInt(),
      categoryId: (json['category_id'] as num?)?.toInt(),
      name: json['name'] as String?,
      year: json['year'] as String?,
      slug: json['slug'] as String?,
      description: json['description'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      location: json['location'] as String?,
      serialNumber: json['serial_number'],
      condition: json['condition'],
      steerPosition: json['steer_position'] as String?,
      engineCapacity: json['engine_capacity'],
      transmission: json['transmission'],
      color: json['color'],
      buildType: json['build_type'],
      numberOfPassengers: json['number_of_passengers'],
      features: json['features'] as List<dynamic>?,
      status: json['status'],
      price: json['price'] as String?,
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
      message: json['message'] as String?,
      error: json['error'] as String?,
      errorDescription: json['error_description'] as String?,
    );

Map<String, dynamic> _$$ErrorResponseImplToJson(_$ErrorResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'error': instance.error,
      'error_description': instance.errorDescription,
    };
