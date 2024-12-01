import 'package:flutter/material.dart';
import 'package:riverpod_playground/pages/controle_diario/controle_diario_adm/controle_diario_add_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Aluno {
  final int id;
  final String nome;

  Aluno({required this.nome, required this.id});

  factory Aluno.fromJson(Map<String, dynamic> json) {
    return Aluno(
      id: json['id'],
      nome: json['nome']
      );
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

  Future<void> _buscarAlunos() async {
    final response = await Supabase.instance.client
        .from('alunos')
        .select('nome, id');
       

    if (response.isNotEmpty) {
      final List<dynamic> data = response as List<dynamic>;
      setState(() {
        _alunos = data.map((json) => Aluno.fromJson(json)).toList();
      });
    } else {
      throw Exception('Falha ao carregar alunos: ${response.isEmpty}');
    }
  }

  @override
  void initState() {
    super.initState();
    _buscarAlunos().catchError((error) {
      // Exibe uma mensagem de erro ou trata o erro de acordo com sua necessidade
      print('Erro ao carregar alunos: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _alunos.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _alunos.length,
              itemBuilder: (context, index) {
                final aluno = _alunos[index];
                return ListTile(
                  contentPadding: const EdgeInsets.fromLTRB(18,8,18,8),
                  leading: CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 243, 149, 33),
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ControleDiarioAdd(idAluno: aluno.id),));
                  },
                );
              },
            ),
    );
  }
}
