// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'myListingsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyListingImpl _$$MyListingImplFromJson(Map<String, dynamic> json) =>
    _$MyListingImpl(
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
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      location: _parseString(json['location']),
      serialNumber: _parseString(json['serial_number']),
      condition: _parseString(json['condition']),
      steerPosition: _parseString(json['steer_position']),
      engineCapacity: _parseString(json['engine_capacity']),
      transmission: _parseString(json['transmission']),
      color: _parseString(json['color']),
      buildType: _parseString(json['build_type']),
      numberOfPassengers: _parseInt(json['number_of_passengers']),
      features: json['features'] as List<dynamic>,
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
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      isPromoted: json['is_promoted'] as bool?,
    );

Map<String, dynamic> _$$MyListingImplToJson(_$MyListingImpl instance) =>
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
      'category': instance.category,
      'is_promoted': instance.isPromoted,
    };

_$CategoryImpl _$$CategoryImplFromJson(Map<String, dynamic> json) =>
    _$CategoryImpl(
      id: _parseInt(json['id']),
      userId: _parseInt(json['user_id']),
      parentId: _parseInt(json['parent_id']),
      name: _parseString(json['name']),
      slug: _parseString(json['slug']),
      description: _parseString(json['description']),
      features: json['features'] as List<dynamic>,
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
