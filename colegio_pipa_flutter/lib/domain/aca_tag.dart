import 'package:json_annotation/json_annotation.dart';

part 'aca_tag.g.dart';

@JsonSerializable()
class AcaTag {
  int? id;
  String? description;

  AcaTag({
    this.id,
    this.description,
  });

  factory AcaTag.fromJson(Map<String, dynamic> json) => _$AcaTagFromJson(json);

  Map<String, dynamic> toJson() => _$AcaTagToJson(this);

  @override
  String toString() => 'AcaTag(id: $id, description: $description)';
}
