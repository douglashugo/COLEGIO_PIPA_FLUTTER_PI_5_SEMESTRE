class UserModel {
  final String id;
  final String email;
  final String senha;
  final String? nome;
  final String? cpf;
  final String? telefone;
  final Map<String, dynamic>? endereco;
  final String? imageProfile;

  UserModel({
    required this.id,
    required this.email,
    required this.senha,
    this.nome,
    this.cpf,
    this.telefone,
    this.endereco,
    this.imageProfile,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      email: map['email'] as String,
      senha: map['senha'] as String,
      nome: map['nome'] as String?,
      cpf: map['cpf'] as String?,
      telefone: map['telefone'] as String?,
      endereco: map['endereco'] != null
          ? Map<String, dynamic>.from(map['endereco'] as Map)
          : null,
      imageProfile: map['image_profile'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'senha': senha,
      'nome': nome,
      'cpf': cpf,
      'telefone': telefone,
      'endereco': endereco,
      'image_profile': imageProfile,
    };
  }

  // Método copyWith
  UserModel copyWith({
    String? id,
    String? email,
    String? senha,
    String? nome,
    String? cpf,
    String? telefone,
    Map<String, dynamic>? endereco,
    String? imageProfile,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      senha: senha ?? this.senha,
      nome: nome ?? this.nome,
      cpf: cpf ?? this.cpf,
      telefone: telefone ?? this.telefone,
      endereco: endereco ?? this.endereco,
      imageProfile: imageProfile ?? this.imageProfile,
    );
  }
}
