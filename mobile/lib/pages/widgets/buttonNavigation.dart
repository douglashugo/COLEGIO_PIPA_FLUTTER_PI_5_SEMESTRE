import 'package:flutter/material.dart';
import 'package:riverpod_playground/pages/home/academico_home.dart';
import 'package:riverpod_playground/pages/controle_diario_create_page.dart';

class ButtonNavigation extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const ButtonNavigation({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  void _navigateToScreen(BuildContext context, int index) {
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AcademicoHomePage()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ControleDiarioCreate()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: (index) {
        onItemSelected(index);
        _navigateToScreen(context, index);
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
    );
  }
}