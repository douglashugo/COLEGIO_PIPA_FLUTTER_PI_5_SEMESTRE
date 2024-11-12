import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_playground/core/contants.dart';
import 'package:riverpod_playground/features/poc/app.dart';
import 'package:riverpod_playground/pages/login.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'providers/app_providers.dart';

void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await Supabase.initialize(
    url: dotenv.get('SB_URL'),
    anonKey: dotenv.get('SB_ANON_KEY'),
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Colégio PIPA',
      theme: ref.watch(themeSwitchProvider) ? kLightTheme : kDarkTheme,
      home: App(),
    );
  }
}


