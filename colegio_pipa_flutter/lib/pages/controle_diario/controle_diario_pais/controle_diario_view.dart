import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_playground/domain/ocorrencia_domain.dart';

class DetalheControleDiarioPage extends StatelessWidget {
  const DetalheControleDiarioPage({super.key, required this.postControleDiario});

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
                _formatarData(
                  DateTime.parse(postControleDiario.data!)
                ), //pegar a data que foi feita no registro
                style: TextStyle(fontSize: 12),
              ),
            ),
            const SizedBox(height: 20),
            _buildDataRow('Lanche', postControleDiario.lanche!), //colocar 
            _buildDataRow('Almoço', postControleDiario.almoco!),
            _buildDataRow('Jantar', postControleDiario.jantar!),
            _buildDataRow('Primeira mamadeira', postControleDiario.mamadeira!),
            _buildDataRow('Segunda mamadeira', postControleDiario.mamadeira2!),
            _buildDataRow('Terceira mamadeira', postControleDiario.mamadeira3!),
          ],
        ),
      ),
    );
  }
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
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(8.0),
              color: Colors.grey[200], // Fundo cinza claro
              child: Text(
                value,
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }