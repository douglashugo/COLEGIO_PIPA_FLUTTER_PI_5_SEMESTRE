
import 'package:colegio_pipa_flutter/features/controleDiario/presentation/controleDiarioCreate_page.dart';
import 'package:colegio_pipa_flutter/features/home/presentation/home_page.dart';
import 'package:flutter/material.dart';

class ButtonNavegation extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const ButtonNavegation({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  void _navigateToScreen(BuildContext context, int index) {
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ControleDiarioCreate()),
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
          icon: Icon(Icons.home_outlined, color: Color.fromARGB(255, 21, 101, 192)),
          label: 'Home',
          selectedIcon: Icon(Icons.home, color: Colors.white),
        ),
        NavigationDestination(
          icon: Icon(Icons.warning_outlined, color: Color.fromARGB(255, 21, 101, 192)),
          label: 'Avisos',
          selectedIcon: Icon(Icons.warning, color: Colors.white),
        ),
        NavigationDestination(
          icon: Icon(Icons.check_outlined, color: Color.fromARGB(255, 21, 101, 192)),
          label: 'Controle Diário',
          selectedIcon: Icon(Icons.check, color: Colors.white),
        ),
      ],
    );
  }
}
