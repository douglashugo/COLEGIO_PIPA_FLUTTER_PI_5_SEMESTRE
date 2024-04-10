import 'package:colegio_pipa_flutter/features/categories/categories_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  var pages = [
    const CategoriesPage(),
    Container(color: Colors.orange),
    Container(color: Colors.red),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home'),
      ),
      drawer: const Drawer(),
      body: Expanded(child: pages[_selectedIndex]),
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
