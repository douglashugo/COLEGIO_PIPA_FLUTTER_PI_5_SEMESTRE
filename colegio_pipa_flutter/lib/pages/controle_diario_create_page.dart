// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_playground/pages/controle_diario/controle_diario_pais/controle_diario_view.dart';
import 'package:riverpod_playground/pages/widgets/buttonNavigation.dart';
import 'package:riverpod_playground/providers/ocorrencias_por_aluno_provider.dart';

class ControleDiarioCreate extends ConsumerWidget {
  final int? idAluno;
  const ControleDiarioCreate({
    super.key,
    this.idAluno,
  });

  String _formatarData(DateTime data) {
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(data);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ocorrencias = ref.watch(ocorrenciasPorAlunoProvider(idAluno!));
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Controle Diário'),
        ),
        body: ocorrencias.when(
          data: (data) {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final ocorrencia = data[index];
                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.description_outlined),
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text(
                        ocorrencia.titulo != null
                            ? ocorrencia.titulo!
                            : 'Título não disponível',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    subtitle: Text(
                      _formatarData(
                        DateTime.parse(ocorrencia.data!),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetalheControleDiarioPage(),
                          ));
                    },
                  ),
                );
              },
            );
          },
          error: (error, stackTrace) {},
          loading: () => const Center(child: CircularProgressIndicator()),
        ));
  }
}
