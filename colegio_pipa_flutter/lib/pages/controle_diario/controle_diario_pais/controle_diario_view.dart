import 'package:flutter/material.dart';

class DetalheControleDiarioPage extends StatelessWidget {

  // final String lanche;
  // final String almoco;
  // final String jantar;
  // final String mamadeira1;
  // final String mamadeira2;
  // final String mamadeira3;

  // ExibirDadosPage({
  //   required this.lanche,
  //   required this.almoco,
  //   required this.jantar,
  //   required this.mamadeira1,
  //   required this.mamadeira2,
  //   required this.mamadeira3,
  // });

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
            const Center(
              child: Text(
                '20/04/2024', //pegar a data que foi feita no registro
                style: TextStyle(fontSize: 12),
              ),
            ),
            const SizedBox(height: 20),
            _buildDataRow('Lanche', 'Ótimo'), //colocar 
            _buildDataRow('Almoço', 'Regular'),
            _buildDataRow('Jantar', 'Regular'),
            _buildDataRow('Primeira mamadeira', 'Ótimo'),
            _buildDataRow('Segunda mamadeira', 'Ótimo'),
            _buildDataRow('Terceira mamadeira', 'Regular'),
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