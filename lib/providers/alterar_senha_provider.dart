import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_playground/domain/aca_users.dart';
import 'package:riverpod_playground/services/user_service.dart';

final userProvider = StateNotifierProvider<UserNotifier, UserModel?>((ref) {
  return UserNotifier();
});

class UserNotifier extends StateNotifier<UserModel?> {
  UserNotifier() : super(null);

  Future<void> fetchUserById(String userId) async {
    try {
      print('Procurando usuário com ID: $userId'); // Log do ID recebido
      final user = await UserService.getUserById(userId);
      print('Usuário carregado: ${user.toMap()}'); // Log dos dados carregados
      state = user;
    } catch (e) {
      print('Erro ao buscar usuário: $e');
      state = null;
    }
  }

  Future<void> updatePassword(String newPassword) async {
    if (state == null) return;

    print('Atualizando senha para: $newPassword'); // Log da nova senha
    final updatedUser = state!.copyWith(senha: newPassword);
    await UserService.updateUser(updatedUser);
    state = updatedUser;
  }
}
