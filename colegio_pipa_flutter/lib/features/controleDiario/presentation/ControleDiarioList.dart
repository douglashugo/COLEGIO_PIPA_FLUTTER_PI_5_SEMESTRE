import 'dart:convert';
import 'package:colegio_pipa_flutter/features/home/presentation/bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:colegio_pipa_flutter/features/home/presentation/home_page.dart'; // Importe a classe HomePage

class Aluno {
  final String nome;

  Aluno({required this.nome});

  factory Aluno.fromJson(Map<String, dynamic> json) {
    return Aluno(nome: json['nome']);
  }
}

class ListaAlunos extends StatefulWidget {
  const ListaAlunos({Key? key}) : super(key: key);

  @override
  _ListaAlunosState createState() => _ListaAlunosState();
}

class _ListaAlunosState extends State<ListaAlunos> {
  int selectedIndex = 0;
  var page = [];
  List<Aluno> _alunos = [];

  Future<List<Aluno>> _buscarAlunos() async {
    final response = await http.get(Uri.parse(
        'https://my-json-server.typicode.com/VitorVilla/teste/posts'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Aluno.fromJson(json)).toList();
    } else {
      throw Exception('Falha ao carregar alunos');
    }
  }

  @override
  void initState() {
    super.initState();
    _buscarAlunos().then((alunos) {
      setState(() {
        _alunos = alunos;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Controle Diário'),
      ),
      body: ListView.builder(
        itemCount: _alunos.length,
        itemBuilder: (context, index) {
          final aluno = _alunos[index];
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(vertical: 3),
            leading: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text(
                aluno.nome[0].toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            title: Text(aluno.nome),
            onTap: () {
              // TODO: Implementar navegação para detalhes do aluno
            },
          );
        },
      ),
      bottomNavigationBar: MyWidget(
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
