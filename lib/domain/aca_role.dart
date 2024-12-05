class RoleModel {
  final String name;

  RoleModel({required this.name});

  factory RoleModel.fromMap(Map<String, dynamic> map) {
    return RoleModel(name: map['roles']['name'] as String);
  }
}
