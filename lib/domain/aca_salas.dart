class Sala {
  final int id;
  final String nome;

  Sala({
    required this.id,
    required this.nome,
  });

  // Converte um Map (do Supabase) em um objeto Sala
  factory Sala.fromMap(Map<String, dynamic> map) {
    return Sala(
      id: map['id'] as int,
      nome: map['nome'] as String,
    );
  }

  // Converte um objeto Sala em um Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome
    };
  }
}
