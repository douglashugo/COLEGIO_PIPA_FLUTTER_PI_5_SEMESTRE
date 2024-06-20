// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aca_post_domain.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AcaPostDomain _$AcaPostDomainFromJson(Map<String, dynamic> json) =>
    AcaPostDomain(
      id: (json['id'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      category: json['categories'] == null
          ? null
          : AcaCategory.fromJson(json['categories'] as Map<String, dynamic>),
      tag: json['tags'] == null
          ? null
          : AcaTag.fromJson(json['tags'] as Map<String, dynamic>),
      image: json['images'] == null
          ? null
          : AcaImage.fromJson(json['images'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AcaPostDomainToJson(AcaPostDomain instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'title': instance.title,
      'description': instance.description,
      'categories': instance.category,
      'tags': instance.tag,
      'images': instance.image,
    };
