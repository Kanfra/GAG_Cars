// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommendedModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecommendedImpl _$$RecommendedImplFromJson(Map<String, dynamic> json) =>
    _$RecommendedImpl(
      id: (json['id'] as num).toInt(),
      userId: json['user_id'] as String,
      itemId: json['item_id'] as String,
      startAt: json['start_at'] as String,
      endAt: json['end_at'] as String,
      status: json['status'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$RecommendedImplToJson(_$RecommendedImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'item_id': instance.itemId,
      'start_at': instance.startAt,
      'end_at': instance.endAt,
      'status': instance.status,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

_$RecommendedResponseImpl _$$RecommendedResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$RecommendedResponseImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => Recommended.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RecommendedResponseImplToJson(
        _$RecommendedResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
