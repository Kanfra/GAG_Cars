import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicleModel.freezed.dart';
part 'vehicleModel.g.dart';

@freezed
class VehicleModel with _$VehicleModel {
  @JsonSerializable(explicitToJson: true)
  const factory VehicleModel({
    required String user_id,
    required String vehicle_id,
    required String vehicleName,
    required String vehicleType,
    required String condition,
    required int year,
    required String make,
    required String model,
    required VehicleLocation location,
    required String price,
    required String steerPosition,
    required String engineCapacity,
    required String transmission,
    required VehicleColor color,
    required String buildType,
    required String mileage,
    required int numberOfPassengers,
    @Default([]) List<String> features,
    required String description,
    @Default([]) List<String> images,
  }) = _VehicleModel;

  factory VehicleModel.fromJson(Map<String, dynamic> json) =>
      _$VehicleModelFromJson(json);
}

@freezed
class VehicleLocation with _$VehicleLocation {
  const factory VehicleLocation({
    required double latitude,
    required double longitude,
    String? address,
  }) = _VehicleLocation;

  factory VehicleLocation.fromJson(Map<String, dynamic> json) =>
      _$VehicleLocationFromJson(json);
}

@freezed
class VehicleColor with _$VehicleColor {
  const factory VehicleColor({
    required String hex,
    required String name,
  }) = _VehicleColor;

  factory VehicleColor.fromJson(Map<String, dynamic> json) =>
      _$VehicleColorFromJson(json);
}
