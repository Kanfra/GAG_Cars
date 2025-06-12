// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicleModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VehicleModelImpl _$$VehicleModelImplFromJson(Map<String, dynamic> json) =>
    _$VehicleModelImpl(
      user_id: json['user_id'] as String,
      vehicle_id: json['vehicle_id'] as String,
      vehicleName: json['vehicleName'] as String,
      vehicleType: json['vehicleType'] as String,
      condition: json['condition'] as String,
      year: (json['year'] as num).toInt(),
      make: json['make'] as String,
      model: json['model'] as String,
      location:
          VehicleLocation.fromJson(json['location'] as Map<String, dynamic>),
      price: json['price'] as String,
      steerPosition: json['steerPosition'] as String,
      engineCapacity: json['engineCapacity'] as String,
      transmission: json['transmission'] as String,
      color: VehicleColor.fromJson(json['color'] as Map<String, dynamic>),
      buildType: json['buildType'] as String,
      mileage: json['mileage'] as String,
      numberOfPassengers: (json['numberOfPassengers'] as num).toInt(),
      features: (json['features'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      description: json['description'] as String,
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$VehicleModelImplToJson(_$VehicleModelImpl instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'vehicle_id': instance.vehicle_id,
      'vehicleName': instance.vehicleName,
      'vehicleType': instance.vehicleType,
      'condition': instance.condition,
      'year': instance.year,
      'make': instance.make,
      'model': instance.model,
      'location': instance.location.toJson(),
      'price': instance.price,
      'steerPosition': instance.steerPosition,
      'engineCapacity': instance.engineCapacity,
      'transmission': instance.transmission,
      'color': instance.color.toJson(),
      'buildType': instance.buildType,
      'mileage': instance.mileage,
      'numberOfPassengers': instance.numberOfPassengers,
      'features': instance.features,
      'description': instance.description,
      'images': instance.images,
    };

_$VehicleLocationImpl _$$VehicleLocationImplFromJson(
        Map<String, dynamic> json) =>
    _$VehicleLocationImpl(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      address: json['address'] as String?,
    );

Map<String, dynamic> _$$VehicleLocationImplToJson(
        _$VehicleLocationImpl instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'address': instance.address,
    };

_$VehicleColorImpl _$$VehicleColorImplFromJson(Map<String, dynamic> json) =>
    _$VehicleColorImpl(
      hex: json['hex'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$VehicleColorImplToJson(_$VehicleColorImpl instance) =>
    <String, dynamic>{
      'hex': instance.hex,
      'name': instance.name,
    };
