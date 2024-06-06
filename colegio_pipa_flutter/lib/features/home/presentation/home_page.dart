
import 'package:colegio_pipa_flutter/features/categories/categories_page.dart';
import 'package:colegio_pipa_flutter/features/utils/buttonNavegation.dart';
import 'package:colegio_pipa_flutter/features/utils/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home'),
      ),
      body: const Expanded(child: CategoriesPage()),
      drawer: const DrawerNavegation(),
      bottomNavigationBar: ButtonNavegation(
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
