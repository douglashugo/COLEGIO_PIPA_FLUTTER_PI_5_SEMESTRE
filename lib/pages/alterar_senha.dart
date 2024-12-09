import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_playground/providers/alterar_senha_provider.dart';

class UpdatePasswordPage extends ConsumerStatefulWidget {
  final String userId;

  const UpdatePasswordPage({Key? key, required this.userId}) : super(key: key);

  @override
  ConsumerState<UpdatePasswordPage> createState() => _UpdatePasswordPageState();
}

class _UpdatePasswordPageState extends ConsumerState<UpdatePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _currentPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      print('Carregando dados do usuário...'); // Log do início do carregamento
      ref.read(userProvider.notifier).fetchUserById(widget.userId);
    });
  }

  Future<void> _updatePassword() async {
    final user = ref.watch(userProvider);

    if (user == null) {
      print('Usuário não encontrado'); // Log para usuário não encontrado
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Usuário não encontrado')),
      );
      return;
    }

    print('Usuário carregado: ${user.toMap()}'); // Log dos dados carregados

    if (_formKey.currentState!.validate()) {
      print('Senha atual fornecida: ${_currentPasswordController.text}');
      print('Senha atual no sistema: ${user.senha}');

      if (_currentPasswordController.text != user.senha) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Senha atual incorreta')),
        );
        return;
      }

      try {
        await ref.read(userProvider.notifier).updatePassword(_newPasswordController.text);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Senha alterada com sucesso!')),
        );
        Navigator.of(context).pop();
      } catch (e) {
        print('Erro ao atualizar senha: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao alterar a senha: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Alterar Senha'),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: user == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: _currentPasswordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Senha Atual',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira sua senha atual';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: _newPasswordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Nova Senha',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira uma nova senha';
                        }
                        if (value.length < 6) {
                          return 'A senha deve ter pelo menos 6 caracteres';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Confirmar Nova Senha',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, confirme a nova senha';
                        }
                        if (value != _newPasswordController.text) {
                          return 'As senhas não coincidem';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24.0),
                    Center(
                      child: ElevatedButton(
                        onPressed: _updatePassword,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange
                        ),
                        child: const Text('Alterar Senha')
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
