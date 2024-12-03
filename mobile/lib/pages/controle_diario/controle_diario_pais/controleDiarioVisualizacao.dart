import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:riverpod_playground/domain/ocorrencia_domain.dart';
import 'package:academico_core/src/features/post/domain/model/ocorrencia_domain.dart';

class DetalheControleDiarioViz extends StatelessWidget {
  

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
              const Center(
                child: Text(
                 '10/06/2024',
                  style: TextStyle(fontSize: 12),
                ),
              ),
              const SizedBox(height: 20),
              _buildDataRow('Responsável', 'Flávia'),
              _buildDataRow('Lanche', 'Recusou'),
              _buildDataRow('Almoço', 'Ótimo'),
              _buildDataRow('Jantar', 'Ótimo'),
              _buildDataRow('Primeira mamadeira', 'Recusou'),
              _buildDataRow('Segunda mamadeira', 'Regular'),
              _buildDataRow('Terceira mamadeira', 'Ótimo'),
              _buildDataRow('Evacuação', 'Sim'),
              _buildDataRow('Xixi', 'Sim'),
              _buildDataRow('Dormiu', 'Não'),
              _buildDataRow('Banho', 'Não'),
              _buildDataRow('Horário', '10 horas'),
              _buildDataRow('Dose', '5ml'),
              _buildDataRow('Febre', 'Não'),
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
