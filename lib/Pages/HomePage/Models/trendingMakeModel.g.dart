// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trendingMakeModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TrendingMakeImpl _$$TrendingMakeImplFromJson(Map<String, dynamic> json) =>
    _$TrendingMakeImpl(
      id: (json['id'] as num).toInt(),
      userId: json['user_id'] as String,
      name: json['name'] as String,
      slug: json['slug'] as String,
      image: json['image'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$TrendingMakeImplToJson(_$TrendingMakeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'name': instance.name,
      'slug': instance.slug,
      'image': instance.image,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

_$TrendingMakeResponseImpl _$$TrendingMakeResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$TrendingMakeResponseImpl(
      json['json'] as Map<String, dynamic>,
      data: (json['data'] as List<dynamic>)
          .map((e) => TrendingMake.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TrendingMakeResponseImplToJson(
        _$TrendingMakeResponseImpl instance) =>
    <String, dynamic>{
      'json': instance.json,
      'data': instance.data,
    };
