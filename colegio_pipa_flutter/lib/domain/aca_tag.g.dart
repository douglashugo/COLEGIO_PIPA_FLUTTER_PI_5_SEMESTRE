// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aca_tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AcaTag _$AcaTagFromJson(Map<String, dynamic> json) => AcaTag(
      id: (json['id'] as num?)?.toInt(),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$AcaTagToJson(AcaTag instance) => <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
    };
