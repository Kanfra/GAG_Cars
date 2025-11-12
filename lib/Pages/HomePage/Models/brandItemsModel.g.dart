// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brandItemsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BrandImpl _$$BrandImplFromJson(Map<String, dynamic> json) => _$BrandImpl(
      id: (json['id'] as num).toInt(),
      userId: json['user_id'] as String?,
      name: json['name'] as String,
      slug: json['slug'] as String,
      image: json['image'] as String?,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
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
      id: (json['id'] as num).toInt(),
      userId: json['user_id'] as String?,
      parentId: (json['parent_id'] as num?)?.toInt(),
      name: json['name'] as String,
      slug: json['slug'] as String,
      description: json['description'] as String?,
      features:
          (json['features'] as List<dynamic>).map((e) => e as String).toList(),
      image: json['image'] as String?,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
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
      id: (json['id'] as num).toInt(),
      brandId: (json['brand_id'] as num).toInt(),
      name: json['name'] as String,
      slug: json['slug'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
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

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      emailVerifiedAt: json['email_verified_at'] as String?,
      paidSeller: (json['paid_seller'] as num).toInt(),
      deletedAt: json['deleted_at'] as String?,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      countryId: (json['country_id'] as num?)?.toInt(),
      stateId: (json['state_id'] as num?)?.toInt(),
      profilePhoto: json['profile_photo'] as String?,
      uploadsLeft: (json['uploads_left'] as num?)?.toInt(),
      activeStatus: (json['active_status'] as num).toInt(),
      avatar: json['avatar'] as String,
      darkMode: (json['dark_mode'] as num).toInt(),
      messengerColor: json['messenger_color'] as String?,
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

_$BrandItemImpl _$$BrandItemImplFromJson(Map<String, dynamic> json) =>
    _$BrandItemImpl(
      id: json['id'] as String,
      userId: json['user_id'] as String?,
      countryId: (json['country_id'] as num?)?.toInt(),
      brandModelId: (json['brand_model_id'] as num).toInt(),
      brandId: (json['brand_id'] as num).toInt(),
      categoryId: (json['category_id'] as num).toInt(),
      name: json['name'] as String,
      year: json['year'] as String,
      slug: json['slug'] as String,
      description: json['description'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      location: json['location'] as String,
      serialNumber: json['serial_number'] as String?,
      condition: json['condition'] as String?,
      steerPosition: json['steer_position'] as String?,
      engineCapacity: json['engine_capacity'] as String?,
      transmission: json['transmission'] as String?,
      color: json['color'] as String?,
      buildType: json['build_type'] as String?,
      numberOfPassengers: (json['number_of_passengers'] as num?)?.toInt(),
      features:
          (json['features'] as List<dynamic>).map((e) => e as String).toList(),
      status: json['status'] as String?,
      price: json['price'] as String,
      mileage: json['mileage'] as String?,
      warranty: (json['warranty'] as num?)?.toInt(),
      warrantyExpiration: json['warranty_expiration'] as String?,
      deletedAt: json['deleted_at'] as String?,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      height: json['Height'] as String?,
      vin: json['VIN'] as String?,
      brand: json['brand'] == null
          ? null
          : Brand.fromJson(json['brand'] as Map<String, dynamic>),
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      brandModel: json['brandModel'] == null
          ? null
          : BrandModel.fromJson(json['brandModel'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$BrandItemImplToJson(_$BrandItemImpl instance) =>
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
      'brand': instance.brand,
      'category': instance.category,
      'brandModel': instance.brandModel,
      'user': instance.user,
    };
