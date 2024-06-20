import 'package:flutter/material.dart';
import 'package:riverpod_playground/pages/widgets/buttonNavigation.dart';
import 'package:riverpod_playground/pages/widgets/drawer.dart';
import 'package:intl/intl.dart';

class Cardapio {
  final String cardapio;
  final DateTime data;

  Cardapio({required this.cardapio, required this.data});
}

class ControleDiarioCreate extends StatefulWidget {
  const ControleDiarioCreate({super.key});

  @override
  State<ControleDiarioCreate> createState() => _ControleDiarioCreateState();
}

class _ControleDiarioCreateState extends State<ControleDiarioCreate> {
  int selectedIndex = 2;
  final List<Cardapio> _cardapio = [
    Cardapio(cardapio: "Cardápio da semana", data: DateTime.now()),
    Cardapio(cardapio: "Cardápio da semana", data: DateTime.now().add(const Duration(days: 1))),
    // Adicione mais cardápios aqui para teste
  ];

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
      body: ListView.builder(
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
