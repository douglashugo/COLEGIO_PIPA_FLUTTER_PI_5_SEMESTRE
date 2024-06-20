import 'package:json_annotation/json_annotation.dart';

part 'aca_image.g.dart';

@JsonSerializable()
class AcaImage {
  int? id;
  String? image;
  AcaImage({
    this.id,
    this.image,
  });

  factory AcaImage.fromJson(Map<String, dynamic> json) =>
      _$AcaImageFromJson(json);

  Map<String, dynamic> toJson() => _$AcaImageToJson(this);
}
