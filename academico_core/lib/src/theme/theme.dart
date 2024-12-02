import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4287581240),
      surfaceTint: Color(4287581240),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4294958033),
      onPrimaryContainer: Color(4281993985),
      secondary: Color(4281164428),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4291683839),
      onSecondaryContainer: Color(4278197554),
      tertiary: Color(4287254562),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4294958277),
      onTertiaryContainer: Color(4281340928),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294965494),
      onSurface: Color(4280490263),
      onSurfaceVariant: Color(4283646783),
      outline: Color(4286935918),
      outlineVariant: Color(4292395708),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281937451),
      inversePrimary: Color(4294948256),
      primaryFixed: Color(4294958033),
      onPrimaryFixed: Color(4281993985),
      primaryFixedDim: Color(4294948256),
      onPrimaryFixedVariant: Color(4285674787),
      secondaryFixed: Color(4291683839),
      onSecondaryFixed: Color(4278197554),
      secondaryFixedDim: Color(4288334842),
      onSecondaryFixedVariant: Color(4278930034),
      tertiaryFixed: Color(4294958277),
      onTertiaryFixed: Color(4281340928),
      tertiaryFixedDim: Color(4294948740),
      onTertiaryFixedVariant: Color(4285348107),
      surfaceDim: Color(4293449426),
      surfaceBright: Color(4294965494),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294963693),
      surfaceContainer: Color(4294765285),
      surfaceContainerHigh: Color(4294436064),
      surfaceContainerHighest: Color(4294041562),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4285346079),
      surfaceTint: Color(4287581240),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4289356108),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4278339182),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4282808739),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4285019399),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4288964149),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294965494),
      onSurface: Color(4280490263),
      onSurfaceVariant: Color(4283383611),
      outline: Color(4285291351),
      outlineVariant: Color(4287199090),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281937451),
      inversePrimary: Color(4294948256),
      primaryFixed: Color(4289356108),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4287383862),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4282808739),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4281032841),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4288964149),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4287057440),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4293449426),
      surfaceBright: Color(4294965494),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294963693),
      surfaceContainer: Color(4294765285),
      surfaceContainerHigh: Color(4294436064),
      surfaceContainerHighest: Color(4294041562),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4282585348),
      surfaceTint: Color(4287581240),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4285346079),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4278199356),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4278339182),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4281997568),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4285019399),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294965494),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4281213213),
      outline: Color(4283383611),
      outlineVariant: Color(4283383611),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281937451),
      inversePrimary: Color(4294961121),
      primaryFixed: Color(4285346079),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4283505676),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4278339182),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4278202188),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4285019399),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4283048448),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4293449426),
      surfaceBright: Color(4294965494),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294963693),
      surfaceContainer: Color(4294765285),
      surfaceContainerHigh: Color(4294436064),
      surfaceContainerHighest: Color(4294041562),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294948256),
      surfaceTint: Color(4294948256),
      onPrimary: Color(4283834127),
      primaryContainer: Color(4285674787),
      onPrimaryContainer: Color(4294958033),
      secondary: Color(4288334842),
      onSecondary: Color(4278203218),
      secondaryContainer: Color(4278930034),
      onSecondaryContainer: Color(4291683839),
      tertiary: Color(4294948740),
      onTertiary: Color(4283376896),
      tertiaryContainer: Color(4285348107),
      onTertiaryContainer: Color(4294958277),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279898383),
      onSurface: Color(4294041562),
      onSurfaceVariant: Color(4292395708),
      outline: Color(4288711815),
      outlineVariant: Color(4283646783),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4294041562),
      inversePrimary: Color(4287581240),
      primaryFixed: Color(4294958033),
      onPrimaryFixed: Color(4281993985),
      primaryFixedDim: Color(4294948256),
      onPrimaryFixedVariant: Color(4285674787),
      secondaryFixed: Color(4291683839),
      onSecondaryFixed: Color(4278197554),
      secondaryFixedDim: Color(4288334842),
      onSecondaryFixedVariant: Color(4278930034),
      tertiaryFixed: Color(4294958277),
      onTertiaryFixed: Color(4281340928),
      tertiaryFixedDim: Color(4294948740),
      onTertiaryFixedVariant: Color(4285348107),
      surfaceDim: Color(4279898383),
      surfaceBright: Color(4282529588),
      surfaceContainerLowest: Color(4279503882),
      surfaceContainerLow: Color(4280490263),
      surfaceContainer: Color(4280753435),
      surfaceContainerHigh: Color(4281477157),
      surfaceContainerHighest: Color(4282200623),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294949799),
      surfaceTint: Color(4294948256),
      onPrimary: Color(4281403136),
      primaryContainer: Color(4291525733),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4288598271),
      onSecondary: Color(4278196266),
      secondaryContainer: Color(4284782017),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294950286),
      onTertiary: Color(4280815616),
      tertiaryContainer: Color(4291133774),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279898383),
      onSurface: Color(4294965752),
      onSurfaceVariant: Color(4292658880),
      outline: Color(4289961625),
      outlineVariant: Color(4287790970),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4294041562),
      inversePrimary: Color(4285806116),
      primaryFixed: Color(4294958033),
      onPrimaryFixed: Color(4280812800),
      primaryFixedDim: Color(4294948256),
      onPrimaryFixedVariant: Color(4284294420),
      secondaryFixed: Color(4291683839),
      onSecondaryFixed: Color(4278194722),
      secondaryFixedDim: Color(4288334842),
      onSecondaryFixedVariant: Color(4278204763),
      tertiaryFixed: Color(4294958277),
      onTertiaryFixed: Color(4280290048),
      tertiaryFixedDim: Color(4294948740),
      onTertiaryFixedVariant: Color(4283968000),
      surfaceDim: Color(4279898383),
      surfaceBright: Color(4282529588),
      surfaceContainerLowest: Color(4279503882),
      surfaceContainerLow: Color(4280490263),
      surfaceContainer: Color(4280753435),
      surfaceContainerHigh: Color(4281477157),
      surfaceContainerHighest: Color(4282200623),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294965752),
      surfaceTint: Color(4294948256),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4294949799),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294572799),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4288598271),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294966008),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4294950286),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279898383),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294965752),
      outline: Color(4292658880),
      outlineVariant: Color(4292658880),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4294041562),
      inversePrimary: Color(4283242761),
      primaryFixed: Color(4294959320),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4294949799),
      onPrimaryFixedVariant: Color(4281403136),
      secondaryFixed: Color(4292209151),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4288598271),
      onSecondaryFixedVariant: Color(4278196266),
      tertiaryFixed: Color(4294959567),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4294950286),
      onTertiaryFixedVariant: Color(4280815616),
      surfaceDim: Color(4279898383),
      surfaceBright: Color(4282529588),
      surfaceContainerLowest: Color(4279503882),
      surfaceContainerLow: Color(4280490263),
      surfaceContainer: Color(4280753435),
      surfaceContainerHigh: Color(4281477157),
      surfaceContainerHighest: Color(4282200623),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
