import 'package:json_annotation/json_annotation.dart';

part 'aca_tag.g.dart';

@JsonSerializable()
class AcaTag {
  int? id;
  String? title;

  AcaTag({
    this.id,
    this.title,
  });

  factory AcaTag.fromJson(Map<String, dynamic> json) => _$AcaTagFromJson(json);

  Map<String, dynamic> toJson() => _$AcaTagToJson(this);

  @override
  String toString() => 'AcaTag(id: $id, title: $title)';
}
