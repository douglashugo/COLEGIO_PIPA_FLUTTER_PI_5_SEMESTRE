import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_playground/domain/aca_students.dart'; // Importa o modelo Aluno
import 'package:riverpod_playground/providers/alunos_responsavel_provider.dart'; // Importa o provider
import 'package:riverpod_playground/pages/controle_diario/controle_diario_pais/controleDiarioVisualizacao.dart';

class ControleDiarioList extends ConsumerStatefulWidget {
  final String userId; // Agora o userId é uma String
  final Map<String, dynamic> userData; // Dados do usuário

  const ControleDiarioList({
    super.key,
    required this.userId,
    required this.userData,
  });

  @override
  ConsumerState<ControleDiarioList> createState() => _ControleDiarioCreateState();
}

class _ControleDiarioCreateState extends ConsumerState<ControleDiarioList> {
  String _formatarData(DateTime data) {
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(data);
  }

  @override
  Widget build(BuildContext context) {
    // Consumindo os dados do provider
    final alunosAsyncValue = ref.watch(alunosResponsavelProvider(widget.userId));

    return Scaffold(
      appBar: AppBar(
        title: Text('Alunos de ${widget.userData['user']['nome']}'),
        centerTitle: true,
      ),
      body: alunosAsyncValue.when(
        data: (alunos) {
          if (alunos.isEmpty) {
            return const Center(
              child: Text('Nenhum aluno associado encontrado.'),
            );
          }

          return ListView.builder(
            itemCount: alunos.length,
            itemBuilder: (context, index) {
              final aluno = alunos[index];

              return Card(
                child: ListTile(
                  leading: const Icon(Icons.person),
                  title: Text(
                    aluno.nome,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'Data de nascimento: ${_formatarData(aluno.dataNascimento)}',
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetalheControleDiarioViz(
                          // Passe os dados do aluno, se necessário
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Erro: $error')),
      ),
    );
  }
}
