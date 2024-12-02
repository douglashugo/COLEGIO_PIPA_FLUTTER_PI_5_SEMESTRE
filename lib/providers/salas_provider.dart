import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_playground/domain/aca_salas.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final salasProvider = FutureProvider.family<List<Sala>, String>((ref, userId) async {
  final supabase = Supabase.instance.client;

  try {
    // Consulta as salas relacionadas ao professor
    final response = await supabase
        .from('professor_sala')
        .select('salas(*)') // Faz join com a tabela salas
        .eq('professor_id', userId); // Filtra pelo professor_id como String

    // Verifica se a resposta é válida
    final List<dynamic> salasData = response;

    // Converte os dados da tabela "salas" em uma lista de objetos Sala
    return salasData
        .map((e) => Sala.fromMap(e['salas'] as Map<String, dynamic>))
        .toList();
  } catch (e) {
    throw Exception('Erro ao buscar salas: $e');
  }
});

