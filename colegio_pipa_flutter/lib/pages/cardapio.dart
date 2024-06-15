import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_playground/pages/widgets/buttonNavigation.dart';
import 'package:riverpod_playground/pages/widgets/drawer.dart';
import 'package:intl/intl.dart';


class Cardapio {
  final String cardapio;
  final DateTime data;

  Cardapio({required this.cardapio, required this.data});

  factory Cardapio.fromJson(Map<String, dynamic> json) {
    return Cardapio(
      cardapio: json['cardapio'],
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
  List<Cardapio> _cardapio = [];

  Future<List<Cardapio>> _buscarCardapio() async {
    final response = await http.get(Uri.parse(
        'https://my-json-server.typicode.com/VitorVilla/teste/posts'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Cardapio.fromJson(json)).toList();
    } else {
      throw Exception('Falha ao carregar os cardápios');
    }
  }

  @override
  void initState() {
    super.initState();
    _buscarCardapio().then((cardapio) {
      setState(() {
        _cardapio = cardapio;
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
        title: const Text('Cardápios'),
      ),
      body: _cardapio.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _cardapio.length,
              itemBuilder: (context, index) {
                final cardapio = _cardapio[index];
                return InkWell(
                  child: Card(
                    child: ListTile(
                      leading: Icon(
                        Icons.restaurant,
                        color: Theme.of(context).colorScheme.primaryContainer,
                        ),
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text(
                          cardapio.cardapio,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      subtitle: Text(_formatarData(cardapio.data)),
                    ),
                  ),
                  //onTap: , colocar para abrir o cardapio
                );
              },
            ),
      endDrawer: const DrawerNavigation(),
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