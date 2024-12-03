import 'package:flutter/material.dart';
import 'package:riverpod_playground/pages/category_home_page.dart';
import 'package:riverpod_playground/pages/controle_diario/controle_diario_pais/controleListPais.dart';
import 'package:riverpod_playground/pages/salas.dart';
import 'package:riverpod_playground/pages/widgets/drawerAdm.dart';
import '../cardapio.dart';

class AcademicoHomePage extends StatefulWidget {
  final Map<String, dynamic> userData; // Dados do usuário e roles

  const AcademicoHomePage({Key? key, required this.userData}) : super(key: key);

  @override
  _AcademicoHomePageState createState() => _AcademicoHomePageState();
}

class _AcademicoHomePageState extends State<AcademicoHomePage> {
  int selectedIndex = 0;

  late List<Widget> pages;

  // Títulos correspondentes aos itens do bottom navigation bar
  final List<String> appBarTitles = [
    'Home',
    'Cardápio',
    'Controle Diário',
  ];

  @override
  void initState() {
    super.initState();

    // Determina qual página usar com base na role
    final role = widget.userData['roles'].first; // Assume que roles é uma lista
    Widget controlePage;

    if (role == 'admin' || role == 'professor') {
      controlePage = ListaSalasPage(
        userData: widget.userData,
      );
    } else if (role == 'responsavel') {
      controlePage = const ControleDiarioList(
      );
    } else {
      controlePage = const Center(
        child: Text('Permissão desconhecida'),
      );
    }

    // Inicializa a lista de páginas dinamicamente
    pages = [
      CategoryHomePage(userData: widget.userData), // Passando os dados do usuário e roles
      Cardapio(), // Página estática
      controlePage, // Página dinâmica baseada na role
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(appBarTitles[selectedIndex]), // Título dinâmico da AppBar
      ),
      drawer: DrawerNavigationAdm(userData: widget.userData), // Drawer com dados do usuário e roles
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
            label: 'Controle Diário',
            selectedIcon: Icon(Icons.bookmark),
          ),
        ],
      ),
    );
  }
}
