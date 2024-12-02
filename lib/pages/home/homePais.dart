import 'package:flutter/material.dart';
import 'package:riverpod_playground/pages/category_home_page.dart';
import 'package:riverpod_playground/pages/controle_diario/controle_diario_pais/controleListPais.dart';
import 'package:riverpod_playground/pages/widgets/categoryHomePagePais.dart';
import 'package:riverpod_playground/pages/widgets/drawerAdm.dart';
import 'package:riverpod_playground/pages/widgets/drawerUser.dart';
import '../cardapio.dart';
import '../controle_diario_list_page.dart';

class AcademicoPage2 extends StatefulWidget {
  final Map<String, dynamic> user;

  const AcademicoPage2({Key? key, required this.user}) : super(key: key);

  @override
  _AcademicoHomePageState createState() => _AcademicoHomePageState();
}

class _AcademicoHomePageState extends State<AcademicoPage2> {
  int selectedIndex = 0;

  // Lista de páginas para o bottom navigation bar
  List<Widget> pages = [
    const CategoryHomePagePais(),
    Cardapio(),
    const ControleDiarioList() //ENVIAR PARA LISTA DE OCORRENCIAS
    
  ];

  // Títulos correspondentes aos itens do bottom navigation bar
  List<String> appBarTitles = [
    'Home',
    'Cardápio',
    'Controle Diário'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(appBarTitles[selectedIndex]), // Título dinâmico da AppBar
      ),
      drawer: const DrawerNavigation(),
      body: pages[selectedIndex], // Conteúdo da página baseado no índice selecionado
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index; // Atualiza o índice selecionado
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
            selectedIcon: Icon(Icons.home),
          ),
          NavigationDestination(
            icon: Icon(Icons.restaurant_menu),
            label: 'Cardápio',
            selectedIcon: Icon(Icons.restaurant_menu),
          ),
          NavigationDestination(
            icon: Icon(Icons.bookmark),
            label: 'Controle Diario',
            selectedIcon: Icon(Icons.bookmark),
          ),
        ],
      ),
    );
  }
}
