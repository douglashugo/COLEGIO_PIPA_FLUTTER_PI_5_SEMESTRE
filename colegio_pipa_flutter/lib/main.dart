import 'package:colegio_pipa_flutter/core/constants/constants.dart';
import 'package:colegio_pipa_flutter/features/home/presentation/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: false,
          colorScheme: lightColorScheme,
          navigationBarTheme:
              NavigationBarThemeData(indicatorColor: Colors.blue.shade800)),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
      },
    );
  }
}
