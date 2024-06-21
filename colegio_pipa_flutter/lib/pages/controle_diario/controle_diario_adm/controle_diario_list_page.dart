import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_playground/pages/widgets/buttonNavigation.dart';
import 'package:riverpod_playground/pages/widgets/drawerUser.dart';

class Aluno {
  final String nome;

  Aluno({required this.nome});

  factory Aluno.fromJson(Map<String, dynamic> json) {
    return Aluno(nome: json['nome']);
  }
}

class ListaAlunos extends StatefulWidget {
  const ListaAlunos({super.key});

  @override
  State<ListaAlunos> createState() => _ListaAlunosState();
}

class _ListaAlunosState extends State<ListaAlunos> {
  int selectedIndex = 2;
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
      drawer: DrawerNavigation(),
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