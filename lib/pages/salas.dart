import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_playground/pages/listar_alunos_adm.dart';
import 'package:riverpod_playground/providers/salas_provider.dart';

class ListaSalasPage extends ConsumerWidget {
  final String userId; // ID do professor como String

  const ListaSalasPage({super.key, required this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final salasAsync = ref.watch(salasProvider(userId));

    return Scaffold(
      body: salasAsync.when(
        data: (salas) => ListView.builder(
          itemCount: salas.length,
          itemBuilder: (context, index) {
            final sala = salas[index];
            return ListTile(
              leading: const Icon(Icons.meeting_room),
              title: Text(sala.nome),
              onTap: () {
                // Navega para a página ListaAlunos passando o ID da sala
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListaAlunosAdm(salaId: sala.id),
                  ),
                );
              },
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Text('Erro ao carregar salas: $error'),
        ),
      ),
    );
  }
}
