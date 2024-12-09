import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:riverpod_playground/domain/aca_users.dart';

class UserService {
  static final supabase = Supabase.instance.client;

  // Busca um usuário pelo ID
  static Future<UserModel> getUserById(String userId) async {
    try {
      print('Buscando usuário no Supabase para ID: $userId');

      final response = await supabase
          .from('users') // Nome da tabela no Supabase
          .select()
          .eq('id', userId)
          .maybeSingle();

      if (response == null) {
        throw Exception('Usuário não encontrado');
      }

      final user = UserModel.fromMap(response as Map<String, dynamic>);
      print('Usuário encontrado: ${user.toMap()}');
      return user;
    } on PostgrestException catch (e) {
      print('Erro ao buscar usuário no Supabase: ${e.message}');
      throw Exception('Erro ao buscar usuário: ${e.message}');
    } catch (e) {
      print('Erro inesperado: $e');
      throw Exception('Erro inesperado ao buscar usuário: $e');
    }
  }

  // Atualiza os dados de um usuário
  static Future<void> updateUser(UserModel user) async {
    try {
      print('Atualizando usuário no Supabase: ${user.toMap()}');

      final response = await supabase
          .from('users') // Nome da tabela no Supabase
          .update(user.toMap())
          .eq('id', user.id);

      if (response == null) {
        print('Senha atualizada com sucesso');
      }

      print('Usuário atualizado com sucesso');
    } on PostgrestException catch (e) {
      print('Erro ao atualizar usuário no Supabase: ${e.message}');
      throw Exception('Erro ao atualizar usuário: ${e.message}');
    } catch (e) {
      print('Erro inesperado: $e');
      throw Exception('Erro inesperado ao atualizar usuário: $e');
    }
  }
}
