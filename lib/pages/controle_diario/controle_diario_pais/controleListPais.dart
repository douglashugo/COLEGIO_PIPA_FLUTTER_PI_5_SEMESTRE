import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_playground/pages/controle_diario/controle_diario_adm/controle_diario_registro.dart';
import 'package:riverpod_playground/pages/controle_diario/controle_diario_pais/controleDiarioVisualizacao.dart';
import 'package:riverpod_playground/pages/controle_diario/controle_diario_pais/controle_diario_view.dart';
import 'package:riverpod_playground/providers/ocorrencias_por_aluno_provider.dart';

class ControleDiarioList extends ConsumerStatefulWidget {
  final int? idAluno;
  const ControleDiarioList({
    super.key,
    this.idAluno,
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
   // final ocorrencias = ref.watch(ocorrenciasPorAlunoProvider(widget.idAluno!));
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: const Text('Controle Diário'),
      // ),
      body: 
      // ocorrencias.when(
      //   data: (data) {
      //     return 
          ListView.builder(
            itemCount: 10, //data.length,
            itemBuilder: (context, index) {
              //final ocorrencia = data[index];
              return Card(
                child: ListTile(
                  leading: const Icon(Icons.description_outlined),
                  title: const Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: Text(
                     'Rotina do dia',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  subtitle: const Text(
                    '10/06/2024',
                    ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetalheControleDiarioViz(),
                      ),
                    );
                  },
                ),
              );
            },
          ),
      //   },
      //   error: (error, stackTrace) => Center(child: Text('Erro: $error')),
      //   loading: () => const Center(child: CircularProgressIndicator()),
      // ),
      
    );
  }
}
