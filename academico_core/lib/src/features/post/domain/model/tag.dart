import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag.freezed.dart';
part 'tag.g.dart';

@freezed
class AcaTag with _$AcaTag {
  factory AcaTag({int? id, String? title}) = _AcaTag;
  factory AcaTag.fromJson(Map<String, dynamic> json) => _$AcaTagFromJson(json);
}
