class Aluno {
  final int id;
  final String nome;
  final DateTime dataNascimento;
  final String cpf;
  final int salaId;

  Aluno({
    required this.id,
    required this.nome,
    required this.dataNascimento,
    required this.cpf,
    required this.salaId,
  });

  // Converte um Map (do Supabase) em um objeto Aluno
  factory Aluno.fromMap(Map<String, dynamic> map) {
    return Aluno(
      id: map['id'] as int,
      nome: map['nome'] as String,
      dataNascimento: DateTime.parse(map['data_nascimento'] as String),
      cpf: map['cpf'] as String,
      salaId: map['sala_id'] as int,
    );
  }

  // Converte um objeto Aluno em um Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'data_nascimento': dataNascimento.toIso8601String(),
      'cpf': cpf,
      'sala_id': salaId,
    };
  }
}
