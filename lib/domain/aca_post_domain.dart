import 'package:json_annotation/json_annotation.dart';

import 'package:riverpod_playground/domain/aca_category.dart';
import 'package:riverpod_playground/domain/aca_image.dart';

import 'aca_tag.dart';

part 'aca_post_domain.g.dart';

@JsonSerializable()
class AcaPostDomain {
  int? id;
  @JsonKey(name: 'created_at')
  String? createdAt;
  String? title;
  String? description;
  @JsonKey(name: 'categories')
  AcaCategory? category;
  @JsonKey(name: 'tags')
  AcaTag? tag;
  @JsonKey(name: 'images')
  AcaImage? image;

  AcaPostDomain({
    this.id,
    this.createdAt,
    this.title,
    this.description,
    this.category,
    this.tag,
    this.image,
  });

  factory AcaPostDomain.fromJson(Map<String, dynamic> json) =>
      _$AcaPostDomainFromJson(json);

  Map<String, dynamic> toJson() => _$AcaPostDomainToJson(this);

  @override
  String toString() {
    return 'AcaPostDomain(id: $id, createdAt: $createdAt, category: $category, tag: $tag, image: $image)';
  }
}
