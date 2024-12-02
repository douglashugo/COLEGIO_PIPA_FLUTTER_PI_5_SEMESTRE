import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
class AcaCategory with _$AcaCategory {
  factory Category({
    required String id,
    required String name,
    required String image,
  }) = _AcaCategory;

  factory AcaCategory.fromJson(Map<String, dynamic> json) =>
      _$AcaCategoryFromJson(json);
}
