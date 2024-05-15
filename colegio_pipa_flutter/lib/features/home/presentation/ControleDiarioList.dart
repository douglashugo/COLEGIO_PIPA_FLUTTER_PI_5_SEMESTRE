import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:colegio_pipa_flutter/features/home/presentation/home_page.dart'; // Importe a classe HomePage

class Alunos {
  final String nome;

  Alunos({required this.nome});

  factory Alunos.fromJson(Map<String, dynamic> json) {
    return Alunos(
      nome: json['nome'],
    );
  }
}

class ControleDiarioList extends StatefulWidget {
  const ControleDiarioList({Key? key}) : super(key: key);

  @override
  _ControleDiarioListState createState() => _ControleDiarioListState();
}

class _ControleDiarioListState extends State<ControleDiarioList> {
  int _selectedIndex = 0;
  List<Alunos> Alunoss = [];

  Future<List<Alunos>> _fetchAlunoss() async {
    final response = await http.get(Uri.parse(
        'https://my-json-server.typicode.com/VitorVilla/teste/posts'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Alunos.fromJson(json)).toList();
    } else {
      throw Exception('Falha ao carregar');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchAlunoss().then((Alunoss) {
      setState(() {
        this.Alunoss = Alunoss;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Controle diario'),
      ),
      body: ListView.builder(
        itemCount: Alunoss.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text(
                Alunoss[index].nome[0],
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: Colors.blue,
            ),
            title: Text(Alunoss[index].nome),
            onTap: () {
              // TODO: Adicionar página do aluno
            },
          );
        },
      ),
      drawer: const Drawer(),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            selectedIcon: Icon(Icons.home),
          ),
          NavigationDestination(
            icon: Icon(Icons.warning_outlined),
            label: 'Avisos',
            selectedIcon: Icon(Icons.warning),
          ),
          NavigationDestination(
            icon: Icon(Icons.check_outlined),
            label: 'Controle Diario',
            selectedIcon: Icon(Icons.check),
          ),
        ],
      ),
      // bottomNavigationBar: Bo,
    );
  }
}
