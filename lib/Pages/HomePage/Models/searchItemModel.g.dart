// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'searchItemModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchItemImpl _$$SearchItemImplFromJson(Map<String, dynamic> json) =>
    _$SearchItemImpl(
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
      numberOfPassengers: (json['number_of_passengers'] as num?)?.toInt(),
      features: (json['features'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      status: json['status'] as String?,
      price: json['price'] as String?,
      mileage: json['mileage'] as String?,
      warranty: (json['warranty'] as num?)?.toInt(),
      warrantyExpiration: json['warranty_expiration'] as String?,
      deletedAt: json['deleted_at'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      Height: json['Height'] as String?,
      VIN: json['VIN'] as String?,
    );

Map<String, dynamic> _$$SearchItemImplToJson(_$SearchItemImpl instance) =>
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
    };
