class AcaPost with _$AcaPost {
  factory AcaPost({
    required int id,
    required String title,
    required String createdAt,
    required String description,
    required AcaCategory AcaCategory,
    required AcaTag AcaTag,
    required AcaImage AcaCategory,
    required String body,
  }) = _AcaPost;
}
