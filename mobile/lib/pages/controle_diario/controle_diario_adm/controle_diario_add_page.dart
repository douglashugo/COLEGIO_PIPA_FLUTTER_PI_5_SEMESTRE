import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_playground/pages/controle_diario/controle_diario_adm/controle_diario_registro.dart';
import 'package:riverpod_playground/pages/controle_diario/controle_diario_pais/controle_diario_view.dart';
import 'package:riverpod_playground/providers/ocorrencias_por_aluno_provider.dart';

class ControleDiarioAdd extends ConsumerStatefulWidget {
  final int? idAluno;
  const ControleDiarioAdd({
    super.key,
    this.idAluno,
  });

  @override
  ConsumerState<ControleDiarioAdd> createState() =>
      _ControleDiarioCreateState();
}

class _ControleDiarioCreateState extends ConsumerState<ControleDiarioAdd> {
  String _formatarData(DateTime data) {
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(data);
  }

  @override
  Widget build(BuildContext context) {
    final ocorrencias = ref.watch(ocorrenciasPorAlunoProvider(widget.idAluno!));
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
                        builder: (context) => DetalheControleDiarioPage(
                          postControleDiario: ocorrencia,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
        error: (error, stackTrace) => Center(child: Text('Erro: $error')),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 243, 149, 33),
        onPressed: () async {
          bool result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FormPage(
                idAluno: widget.idAluno!,
              ), // Página de cadastro
            ),
          );

          if (result) {
            ref.invalidate(ocorrenciasPorAlunoProvider(widget.idAluno!));
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
