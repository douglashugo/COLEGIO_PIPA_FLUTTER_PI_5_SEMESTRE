class UserModel {
  final String id;
  final String email;
  final String senha;
  final String? nome;
  final String? cpf;
  final String? telefone;
  final Map<String, dynamic>? endereco;

  UserModel({
    required this.id,
    required this.email,
    required this.senha,
    this.nome,
    this.cpf,
    this.telefone,
    this.endereco,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      email: map['email'] as String,
      senha: map['senha'] as String,
      nome: map['nome'] as String?, // Permite valores nulos
      cpf: map['cpf'] as String?, // Permite valores nulos
      telefone: map['telefone'] as String?, // Permite valores nulos
      endereco: map['endereco'] != null
          ? Map<String, dynamic>.from(map['endereco'] as Map)
          : null, // Trata o caso de `endereco` ser `null`
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
    };
  }
}
