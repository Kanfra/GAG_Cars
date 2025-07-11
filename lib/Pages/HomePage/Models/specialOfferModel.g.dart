// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specialOfferModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SpecialOfferImpl _$$SpecialOfferImplFromJson(Map<String, dynamic> json) =>
    _$SpecialOfferImpl(
      id: (json['id'] as num).toInt(),
      userId: json['user_id'] as String,
      itemId: json['item_id'] as String,
      startAt: json['start_at'] as String,
      endAt: json['end_at'] as String,
      status: json['status'] as String,
      discount: (json['discount'] as num).toInt(),
      discountType: json['discount_type'] as String,
      description: json['description'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
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
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

_$SpecialOfferResponseImpl _$$SpecialOfferResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SpecialOfferResponseImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => SpecialOffer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SpecialOfferResponseImplToJson(
        _$SpecialOfferResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
