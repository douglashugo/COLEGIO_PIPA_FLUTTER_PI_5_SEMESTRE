import 'package:json_annotation/json_annotation.dart';

part 'aca_category.g.dart';

@JsonSerializable()
class AcaCategory {
  int? id;
  String? title;
  String? image;

  AcaCategory({
    this.id,
    this.title,
    this.image
  });

  factory AcaCategory.fromJson(Map<String, dynamic> json) =>
      _$AcaCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$AcaCategoryToJson(this);

  @override
  String toString() => 'AcaCategory(id: $id, title: $title)';
}
