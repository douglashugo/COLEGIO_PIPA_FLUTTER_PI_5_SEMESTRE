import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_playground/domain/aca_salas.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final salasProvider = FutureProvider.family<List<Sala>, Map<String, dynamic>>((ref, userData) async {
  final supabase = Supabase.instance.client;
  final String userId = userData['user']['id'] as String;
  final String role = userData['roles'].first as String; // Assume que roles é uma lista

  try {
    if (role == 'admin') {
      // Consulta todas as salas
      final response = await supabase.from('salas').select('*');
      
      // Verifica se a resposta é válida
      final List<dynamic> salasData = response;

      // Converte os dados da tabela "salas" em uma lista de objetos Sala
      return salasData
          .map((e) => Sala.fromMap(e as Map<String, dynamic>))
          .toList();
    } else if (role == 'professor') {
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
    } else {
      // Retorna uma lista vazia para roles desconhecidas
      return [];
    }
  } catch (e) {
    throw Exception('Erro ao buscar salas: $e');
  }
});