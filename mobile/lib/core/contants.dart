import 'package:flutter/material.dart';

final kLightTheme = ThemeData(
  useMaterial3: false,
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.deepOrange,
    accentColor: const Color.fromARGB(255, 243, 149, 33),
  ),
  chipTheme: ChipThemeData.fromDefaults(
    primaryColor: Colors.deepOrange,
    // brightness: Brightness.light,
    secondaryColor: const Color.fromARGB(255, 243, 149, 33),
    labelStyle: const TextStyle(
      color: Colors.white,
      fontSize: 12,
    ),
  ),
);
// primaryColor != null || brightness != null': One of primaryColor or brightness
final kDarkTheme = ThemeData(
  brightness: Brightness.dark,
  colorSchemeSeed: Colors.deepOrange,
  chipTheme: ChipThemeData.fromDefaults(
    primaryColor: Colors.deepOrange,
    // brightness: Brightness.light,
    secondaryColor: const Color.fromARGB(255, 243, 149, 33),
    labelStyle: const TextStyle(
      color: Colors.white,
      fontSize: 12,
    ),
  ),
);
