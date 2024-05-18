import 'package:colegio_pipa_flutter/core/constants/constants.dart';
import 'package:flutter/material.dart';

import 'features/home/presentation/home_page.dart';
import 'features/controleDiario/presentation/ControleDiarioList.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: lightColorScheme),
      initialRoute: '/',
      routes: {
        '/': (context) => const ListaAlunos(),
      },
    );
  }
}
