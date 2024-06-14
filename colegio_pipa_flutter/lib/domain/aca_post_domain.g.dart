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
      category: json['aca_category'] == null
          ? null
          : AcaCategory.fromJson(json['aca_category'] as Map<String, dynamic>),
      tag: json['aca_tag'] == null
          ? null
          : AcaTag.fromJson(json['aca_tag'] as Map<String, dynamic>),
      image: json['aca_images'] == null
          ? null
          : AcaImage.fromJson(json['aca_images'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AcaPostDomainToJson(AcaPostDomain instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'title': instance.title,
      'description': instance.description,
      'aca_category': instance.category,
      'aca_tag': instance.tag,
      'aca_images': instance.image,
    };
