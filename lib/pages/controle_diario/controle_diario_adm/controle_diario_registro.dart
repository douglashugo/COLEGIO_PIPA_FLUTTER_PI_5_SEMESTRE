import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_playground/domain/create_ocorrencia_domain.dart';
import 'package:riverpod_playground/providers/create_ocorrencia.dart';

class FormPage extends ConsumerStatefulWidget {
  final int idAluno;

  const FormPage({Key? key, required this.idAluno}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends ConsumerState<FormPage> {
  final _formKey = GlobalKey<FormState>();
  String _cafe = 'Regular';
  String _lanche = 'Regular';
  String _almoco = 'Regular';
  String _jantar = 'Regular';
  String _mamadeira1 = 'Regular';
  String _mamadeira2 = 'Regular';
  String _mamadeira3 = 'Regular';
  String _evacuacao = 'Regular';
  bool _xixi = false;
  bool _dormiu = false;
  bool _banho = false;
  String _horario = '';
  String _dose = '';
  double _febre = 0.0;
  String _nome_responsavel = '';

  Future<void> _submit() async {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();

      // Create OcorrenciaDomain object with form data
      final ocorrencia = CreateOcorrenciaDomain(
        data: DateTime.now().toIso8601String(),
        titulo: 'Ocorrência', // Replace with actual title if needed
        alunoId: widget.idAluno, // Use idAluno from widget
        lanche: _lanche,
        almoco: _almoco,
        lanchetarde: _cafe,
        jantar: _jantar,
        mamadeira: _mamadeira1,
        mamadeira2: _mamadeira2,
        mamadeira3: _mamadeira3,
        evacuacao: _evacuacao,
        xixi: _xixi,
        dormiu: _dormiu,
        banho: _banho,
        horario: _horario,
        dose: _dose,
        febre: _febre,
        nome_responsavel: _nome_responsavel,
      );

      try {
        await ref.read(inserirOcorrenciaProvider(ocorrencia).future);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Dados enviados com sucesso!')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Falha ao enviar os dados: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Controle Diário'),
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
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                  _buildSegmentedControl('Primeira mamadeira', _mamadeira1,
                      (newValue) {
                    setState(() {
                      _mamadeira1 = newValue;
                    });
                  }),
                  _buildSegmentedControl('Segunda mamadeira', _mamadeira2,
                      (newValue) {
                    setState(() {
                      _mamadeira2 = newValue;
                    });
                  }),
                  _buildSegmentedControl('Terceira mamadeira', _mamadeira3,
                      (newValue) {
                    setState(() {
                      _mamadeira3 = newValue;
                    });
                  }),
                  _buildSegmentedControl('Evacuação', _evacuacao, (newValue) {
                    setState(() {
                      _evacuacao = newValue;
                    });
                  }),
                  const SizedBox(height: 20),
                  _buildCheckbox('Fez xixi', _xixi, (newValue) {
                    setState(() {
                      _xixi = newValue;
                    });
                  }),
                  _buildCheckbox('Dormiu', _dormiu, (newValue) {
                    setState(() {
                      _dormiu = newValue;
                    });
                  }),
                  _buildCheckbox('Tomou banho', _banho, (newValue) {
                    setState(() {
                      _banho = newValue;
                    });
                  }),
                  _buildTextInput('Horário', (newValue) {
                    setState(() {
                      _horario = newValue;
                    });
                  }),
                  _buildTextInput('Dose', (newValue) {
                    setState(() {
                      _dose = newValue;
                    });
                  }),
                  _buildTextInput('Febre (em °C)', (newValue) {
                    setState(() {
                      _febre = double.tryParse(newValue) ?? 0.0;
                    });
                  }),
                  _buildTextInput('Nome do responsável', (newValue) {
                    setState(() {
                      _nome_responsavel = newValue;
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

  Widget _buildSegmentedControl(
      String title, String currentValue, ValueChanged<String> onValueChanged) {
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
              value: 'recusei',
              label: Text('Recusei'),
            ),
            ButtonSegment(
              value: 'regular',
              label: Text('Regular'),
            ),
            ButtonSegment(
              value: 'otimo',
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

  Widget _buildTextInput(String label, ValueChanged<String> onSaved) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      onSaved: (value) => onSaved(value ?? ''),
    );
  }

  Widget _buildCheckbox(
      String label, bool currentValue, ValueChanged<bool> onChanged) {
    return CheckboxListTile(
      title: Text(label),
      value: currentValue,
      onChanged: (value) => onChanged(value ?? false),
    );
  }
}
