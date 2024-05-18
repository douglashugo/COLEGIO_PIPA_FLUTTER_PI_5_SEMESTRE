import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

   MyWidget({super.key, required this.selectedIndex, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
     return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: onItemSelected,
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
      );
  }
}