import 'package:flutter/material.dart';
import 'package:riverpod_playground/pages/category_home_page.dart';
import 'package:riverpod_playground/pages/widgets/drawer.dart';
import 'controle_diario_create_page.dart';
import 'controle_diario_list_page.dart';

class AcademicoHomePage extends StatefulWidget {
  const AcademicoHomePage({Key? key}) : super(key: key);

  @override
  _AcademicoHomePageState createState() => _AcademicoHomePageState();
}

class _AcademicoHomePageState extends State<AcademicoHomePage> {
  int selectedIndex = 0;

  // Lista de páginas para o bottom navigation bar
  List<Widget> pages = [
    const CategoryHomePage(),
    const ListaAlunos(),
    const ControleDiarioCreate()
  ];

  // Títulos correspondentes aos itens do bottom navigation bar
  List<String> appBarTitles = [
    'Home',
    'Avisos',
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
    );
  }
}
