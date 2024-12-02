import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_playground/domain/aca_students.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final alunosProvider = FutureProvider.family<List<Aluno>, int>((ref, salaId) async {
  final supabase = Supabase.instance.client;

  try {
    // Consulta os alunos relacionados à sala
    final response = await supabase
        .from('alunos')
        .select()
        .eq('sala_id', salaId); // Filtra pelo sala_id

    // Verifica se a resposta é válida
    final List<dynamic> alunosData = response;

    // Converte os dados da tabela "alunos" em uma lista de objetos Aluno
    return alunosData
        .map((e) => Aluno.fromMap(e as Map<String, dynamic>))
        .toList();
  } catch (e) {
    throw Exception('Erro ao buscar alunos: $e');
  }
});
