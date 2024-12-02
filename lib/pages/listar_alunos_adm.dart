import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_playground/pages/controle_diario/controle_diario_adm/controle_diario_add_page.dart';
import 'package:riverpod_playground/providers/students_provider.dart';

class ListaAlunosAdm extends ConsumerWidget {
  final int salaId; // ID da sala para buscar os alunos

  const ListaAlunosAdm({super.key, required this.salaId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Busca os alunos relacionados à sala usando o provider
    final alunosAsync = ref.watch(alunosProvider(salaId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Alunos'),
        centerTitle: true,
      ),
      body: alunosAsync.when(
        data: (alunos) => ListView.builder(
          itemCount: alunos.length,
          itemBuilder: (context, index) {
            final aluno = alunos[index];
            return ListTile(
              contentPadding: const EdgeInsets.fromLTRB(18, 8, 18, 8),
              leading: CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 243, 149, 33),
                child: Text(
                  aluno.nome[0].toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: Text(aluno.nome),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ControleDiarioAdd(idAluno: aluno.id),
                  ),
                );
              },
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Text('Erro ao carregar alunos: $error'),
        ),
      ),
    );
  }
}
