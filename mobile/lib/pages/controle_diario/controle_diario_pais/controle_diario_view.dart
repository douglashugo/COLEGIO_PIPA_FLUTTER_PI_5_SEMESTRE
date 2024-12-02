import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_playground/domain/ocorrencia_domain.dart';

class DetalheControleDiarioPage extends StatelessWidget {
  const DetalheControleDiarioPage({Key? key, required this.postControleDiario})
      : super(key: key);

  final OcorrenciaDomain postControleDiario;

  String _formatarData(DateTime data) {
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Controle diário'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Center(
                child: Text(
                  'Alimentação',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  _formatarData(DateTime.parse(postControleDiario.data!)),
                  style: const TextStyle(fontSize: 12),
                ),
              ),
              const SizedBox(height: 20),
              _buildDataRow('Responsável', postControleDiario.nome_responsavel!),
              _buildDataRow('Lanche', postControleDiario.lanche!),
              _buildDataRow('Almoço', postControleDiario.almoco!),
              _buildDataRow('Jantar', postControleDiario.jantar!),
              _buildDataRow('Primeira mamadeira', postControleDiario.mamadeira!),
              _buildDataRow('Segunda mamadeira', postControleDiario.mamadeira2!),
              _buildDataRow('Terceira mamadeira', postControleDiario.mamadeira3!),
              _buildDataRow('Evacuação', postControleDiario.evacuacao!),
              _buildDataRow('Xixi', postControleDiario.xixi! ? 'Sim' : 'Não'),
              _buildDataRow('Dormiu', postControleDiario.dormiu! ? 'Sim' : 'Não'),
              _buildDataRow('Banho', postControleDiario.banho! ? 'Sim' : 'Não'),
              _buildDataRow('Horário', postControleDiario.horario!),
              _buildDataRow('Dose', postControleDiario.dose!.toString()),
              _buildDataRow('Febre', postControleDiario.febre!.toString()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDataRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              color: Colors.grey[200], // Fundo cinza claro
              child: Text(
                value,
                style: const TextStyle(fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
