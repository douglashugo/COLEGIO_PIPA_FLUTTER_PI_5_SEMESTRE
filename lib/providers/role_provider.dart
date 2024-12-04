import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_playground/domain/aca_role.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


final roleProvider = FutureProvider.family<List<RoleModel>, String>((ref, userId) async {
  final supabase = Supabase.instance.client;

  try {
    final response = await supabase
        .from('user_roles')
        .select('roles(name)')
        .eq('user_id', userId);

    if (response == null) {
      throw Exception('Nenhuma permissão encontrada para o usuário.');
    }

    return (response as List<dynamic>)
        .map((role) => RoleModel.fromMap(role as Map<String, dynamic>))
        .toList();
  } catch (e) {
    throw Exception('Erro ao buscar permissões: $e');
  }
});
