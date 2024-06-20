import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  String _cafe = 'Regular';
  String _lanche = 'Regular';
  String _almoco = 'Regular';
  String _jantar = 'Regular';
  String _mamadeira1 = 'Regular';
  String _mamadeira2 = 'Regular';
  String _mamadeira3 = 'Regular';

  Future<void> _submit() async {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();

      // Dados do formulário
      final Map<String, String> formData = {
        'cafe': _cafe,
        'lanche': _lanche,
        'almoco': _almoco,
        'jantar': _jantar,
        'mamadeira1': _mamadeira1,
        'mamadeira2': _mamadeira2,
        'mamadeira3': _mamadeira3,
      };

      // Enviar os dados via POST
      final response = await http.post(
        Uri.parse(''),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(formData),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Dados enviados com sucesso!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Falha ao enviar os dados!')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Controle Diário'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
           child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Center(
                      child: Text(
                        'Alimentação',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildSegmentedControl('Café da manhã', _cafe, (newValue) {
                      setState(() {
                        _cafe = newValue;
                      });
                    }),
                    _buildSegmentedControl('Lanche', _lanche, (newValue) {
                      setState(() {
                        _lanche = newValue;
                      });
                    }),
                    _buildSegmentedControl('Almoço', _almoco, (newValue) {
                      setState(() {
                        _almoco = newValue;
                      });
                    }),
                    _buildSegmentedControl('Jantar', _jantar, (newValue) {
                      setState(() {
                        _jantar = newValue;
                      });
                    }),
                    _buildSegmentedControl('Primeira mamadeira', _mamadeira1, (newValue) {
                      setState(() {
                        _mamadeira1 = newValue;
                      });
                    }),
                    _buildSegmentedControl('Segunda mamadeira', _mamadeira2, (newValue) {
                      setState(() {
                        _mamadeira2 = newValue;
                      });
                    }),
                    _buildSegmentedControl('Terceira mamadeira', _mamadeira3, (newValue) {
                      setState(() {
                        _mamadeira3 = newValue;
                      });
                    }),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _submit,
                      child: const Text('Enviar'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          
        ),
      ),
    );
  }

  Widget _buildSegmentedControl(String title, String currentValue, ValueChanged<String> onValueChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(fontSize: 15),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        SegmentedButton(
          style: SegmentedButton.styleFrom(
            backgroundColor: Colors.grey[200],
            foregroundColor: const Color.fromARGB(255, 0, 0, 0),
            selectedForegroundColor: Colors.white,
            selectedBackgroundColor: Color.fromARGB(255, 216, 122, 14),
          ),
          segments: const [
            ButtonSegment(
              value: 'Ruim',
              label: Text('Ruim'),
            ),
            ButtonSegment(
              value: 'Regular',
              label: Text('Regular'),
            ),
            ButtonSegment(
              value: 'Ótimo',
              label: Text('Ótimo'),
            ),
          ],
          selected: {currentValue},
          onSelectionChanged: (Set<String> newSelection) {
            onValueChanged(newSelection.first);
          },
          
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}