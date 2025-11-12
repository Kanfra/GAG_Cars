import 'package:freezed_annotation/freezed_annotation.dart';

part 'brandItemsModel.freezed.dart';
part 'brandItemsModel.g.dart';

// Add these nested models at the top of your file
@freezed
class Brand with _$Brand {
  const factory Brand({
    required int id,
    @JsonKey(name: 'user_id') String? userId,
    required String name,
    required String slug,
    String? image,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _Brand;

  factory Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);
}

@freezed
class Category with _$Category {
  const factory Category({
    required int id,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'parent_id') int? parentId,
    required String name,
    required String slug,
    String? description,
    required List<String> features,
    String? image,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
}

@freezed
class BrandModel with _$BrandModel {
  const factory BrandModel({
    required int id,
    @JsonKey(name: 'brand_id') required int brandId,
    required String name,
    required String slug,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _BrandModel;

  factory BrandModel.fromJson(Map<String, dynamic> json) => _$BrandModelFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String name,
    required String email,
    required String phone,
    @JsonKey(name: 'email_verified_at') String? emailVerifiedAt,
    @JsonKey(name: 'paid_seller') required int paidSeller,
    @JsonKey(name: 'deleted_at') String? deletedAt,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    @JsonKey(name: 'country_id') int? countryId,
    @JsonKey(name: 'state_id') int? stateId,
    @JsonKey(name: 'profile_photo') String? profilePhoto,
    @JsonKey(name: 'uploads_left') int? uploadsLeft,
    @JsonKey(name: 'active_status') required int activeStatus,
    required String avatar,
    @JsonKey(name: 'dark_mode') required int darkMode,
    @JsonKey(name: 'messenger_color') String? messengerColor,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

// Your existing BrandItem model - ONLY ADD THE 4 MISSING FIELDS
@freezed
class BrandItem with _$BrandItem {
  const factory BrandItem({
    required String id,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'country_id') int? countryId,
    @JsonKey(name: 'brand_model_id') required int brandModelId,
    @JsonKey(name: 'brand_id') required int brandId,
    @JsonKey(name: 'category_id') required int categoryId,
    required String name,
    required String year,
    required String slug,
    required String description,
    required List<String> images,
    required String location,
    @JsonKey(name: 'serial_number') String? serialNumber,
    String? condition,
    @JsonKey(name: 'steer_position') String? steerPosition,
    @JsonKey(name: 'engine_capacity') String? engineCapacity,
    String? transmission,
    String? color,
    @JsonKey(name: 'build_type') String? buildType,
    @JsonKey(name: 'number_of_passengers') int? numberOfPassengers,
    required List<String> features,
    String? status,
    required String price,
    String? mileage,
    int? warranty,
    @JsonKey(name: 'warranty_expiration') String? warrantyExpiration,
    @JsonKey(name: 'deleted_at') String? deletedAt,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    @JsonKey(name: 'Height') String? height,
    @JsonKey(name: 'VIN') String? vin,
    
    // ONLY ADD THESE 4 FIELDS that are in the API response
    Brand? brand,
    Category? category,
    BrandModel? brandModel,
    User? user,
  }) = _BrandItem;

  factory BrandItem.fromJson(Map<String, dynamic> json) => _$BrandItemFromJson(json);
}

// KEEP ALL YOUR EXISTING EXTENSIONS AND CONVERTER EXACTLY AS THEY ARE
// Extension for image handling and utility methods
extension BrandItemExtensions on BrandItem {
  List<String> get processedImages {
    return images.map((image) {
      if (image.startsWith('http')) {
        return image; // Already a full URL
      } else {
        // Convert filename to full URL - replace with your actual base URL
        return 'https://your-base-url.com/storage/$image';
      }
    }).toList();
  }
  
  String? get firstImage {
    if (images.isEmpty) return null;
    return processedImages.first;
  }
  
  // Helper to get formatted price
  String get formattedPrice {
    try {
      final priceNum = int.tryParse(price) ?? 0;
      return 'GH₵ ${_formatNumber(priceNum)}';
    } catch (e) {
      return 'GH₵ $price';
    }
  }
  
  // Helper to format large numbers with commas
  String _formatNumber(int number) {
    return number.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }
  
  // Helper to check if item is active
  bool get isActive => status == 'active';
  
  // Helper to check if item is sold
  bool get isSold => status == 'sold';
  
  // Helper to get condition with fallback
  String get displayCondition {
    return condition?.toUpperCase() ?? 'N/A';
  }
  
  // Helper to get year with fallback
  String get displayYear {
    return year.isNotEmpty ? year : 'N/A';
  }
  
  // Helper to get location with fallback
  String get displayLocation {
    return location.isNotEmpty ? location : 'Location not specified';
  }
}

// Custom JSON converter for handling type conversions
class BrandItemConverter {
  static BrandItem fromJson(Map<String, dynamic> json) {
    // Handle potential string to int conversion for IDs
    final processedJson = Map<String, dynamic>.from(json);
    
    // Ensure brand_model_id is int
    if (processedJson['brand_model_id'] is String) {
      processedJson['brand_model_id'] = int.tryParse(processedJson['brand_model_id']) ?? 0;
    }
    
    // Ensure brand_id is int
    if (processedJson['brand_id'] is String) {
      processedJson['brand_id'] = int.tryParse(processedJson['brand_id']) ?? 0;
    }
    
    // Ensure category_id is int
    if (processedJson['category_id'] is String) {
      processedJson['category_id'] = int.tryParse(processedJson['category_id']) ?? 0;
    }
    
    // Ensure warranty is int
    if (processedJson['warranty'] is String) {
      processedJson['warranty'] = int.tryParse(processedJson['warranty']) ?? 0;
    }
    
    // Ensure number_of_passengers is int
    if (processedJson['number_of_passengers'] is String) {
      processedJson['number_of_passengers'] = int.tryParse(processedJson['number_of_passengers']);
    }
    
    return BrandItem.fromJson(processedJson);
  }
  
  static List<BrandItem> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((item) => fromJson(item as Map<String, dynamic>)).toList();
  }
}