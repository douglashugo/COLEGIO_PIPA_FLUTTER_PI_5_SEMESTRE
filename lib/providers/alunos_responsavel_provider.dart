import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_playground/domain/aca_students.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final alunosResponsavelProvider = FutureProvider.family<List<Aluno>, String>((ref, String userId) async {
  final supabase = Supabase.instance.client;

  try {
    final response = await supabase
        .from('responsavel_aluno')
        .select('alunos(*)')
        .eq('user_id', userId);

    if (response == null) {
      throw Exception('Nenhum aluno encontrado para o usuário.');
    }

    return (response as List<dynamic>)
        .map((alunoData) => Aluno.fromMap(alunoData['alunos'] as Map<String, dynamic>))
        .toList();
  } catch (e) {
    throw Exception('Erro ao buscar alunos: $e');
  }
});

