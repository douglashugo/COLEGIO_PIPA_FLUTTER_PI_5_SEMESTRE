import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_playground/pages/widgets/buttonNavigation.dart';
import 'package:riverpod_playground/pages/widgets/drawer.dart';
import 'package:intl/intl.dart';


class Ocorrencia {
  final String ocorrencia;
  final DateTime data;

  Ocorrencia({required this.ocorrencia, required this.data});

  factory Ocorrencia.fromJson(Map<String, dynamic> json) {
    return Ocorrencia(
      ocorrencia: json['ocorrencia'],
      data: DateTime.parse(json['data']),
    );
  }
}

class ControleDiarioCreate extends StatefulWidget {
  const ControleDiarioCreate({super.key});

  @override
  State<ControleDiarioCreate> createState() => _ControleDiarioCreateState();
}

class _ControleDiarioCreateState extends State<ControleDiarioCreate> {
  int selectedIndex = 2;
  List<Ocorrencia> _ocorrencia = [];

  Future<List<Ocorrencia>> _buscarOcorrencia() async {
    final response = await http.get(Uri.parse(
        'https://my-json-server.typicode.com/VitorVilla/teste/posts'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Ocorrencia.fromJson(json)).toList();
    } else {
      throw Exception('Falha ao carregar ocorrências');
    }
  }

  @override
  void initState() {
    super.initState();
    _buscarOcorrencia().then((ocorrencia) {
      setState(() {
        _ocorrencia = ocorrencia;
      });
    });
  }

  String _formatarData(DateTime data) {
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Controle Diário'),
      ),
      body: _ocorrencia.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _ocorrencia.length,
              itemBuilder: (context, index) {
                final ocorrencia = _ocorrencia[index];
                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.description_outlined),
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text(
                        ocorrencia.ocorrencia,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    subtitle: Text(_formatarData(ocorrencia.data)),
                  ),
                );
              },
            ),
      endDrawer: DrawerNavigation(),
      bottomNavigationBar: ButtonNavigation(
        selectedIndex: selectedIndex,
        onItemSelected: (index) {
          setState(() {
            selectedIndex = index;
            // Handle navigation based on index
          });
        },
      ),
    );
  }
}