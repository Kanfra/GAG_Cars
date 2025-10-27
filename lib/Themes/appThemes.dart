// themes/app_themes.dart
import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: ColorGlobalVariables.brownColor,
    primarySwatch: _createMaterialColor(ColorGlobalVariables.brownColor),
    scaffoldBackgroundColor: const Color(0xFFFAFAFA), // grey[50]
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xFFFFFFFF), // white
      foregroundColor: ColorGlobalVariables.brownColor,
      elevation: 0,
      iconTheme: IconThemeData(color: ColorGlobalVariables.brownColor),
      titleTextStyle: TextStyle(
        color: ColorGlobalVariables.brownColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    cardColor: const Color(0xFFFFFFFF), // white
    // Remove cardTheme and let it use default with cardColor
    textTheme: const TextTheme(
      displayLarge: TextStyle(color: Color(0xDD000000)), // black87
      displayMedium: TextStyle(color: Color(0xDD000000)),
      displaySmall: TextStyle(color: Color(0xDD000000)),
      headlineLarge: TextStyle(color: Color(0xDD000000)),
      headlineMedium: TextStyle(color: Color(0xDD000000)),
      headlineSmall: TextStyle(color: Color(0xDD000000)),
      titleLarge: TextStyle(color: Color(0xDD000000)),
      titleMedium: TextStyle(color: Color(0xDD000000)),
      titleSmall: TextStyle(color: Color(0xDD000000)),
      bodyLarge: TextStyle(color: Color(0xDD000000)),
      bodyMedium: TextStyle(color: Color(0xDD000000)),
      bodySmall: TextStyle(color: Color(0xDD000000)),
      labelLarge: TextStyle(color: Color(0xDD000000)),
      labelMedium: TextStyle(color: Color(0xDD000000)),
      labelSmall: TextStyle(color: Color(0xDD000000)),
    ),
    iconTheme: const IconThemeData(color: Color(0x8A000000)), // black54
    dividerColor: const Color(0xFFEEEEEE), // grey[200]
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFFF5F5F5), // grey[100]
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: ColorGlobalVariables.brownColor,
    primarySwatch: _createMaterialColor(ColorGlobalVariables.brownColor),
    scaffoldBackgroundColor: const Color(0xFF303030), // grey[900]
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF424242), // grey[800]
      foregroundColor: Color(0xFFFFFFFF), // white
      elevation: 0,
      iconTheme: IconThemeData(color: Color(0xFFFFFFFF)),
      titleTextStyle: TextStyle(
        color: Color(0xFFFFFFFF),
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    cardColor: const Color(0xFF424242), // grey[800]
    // Remove cardTheme and let it use default with cardColor
    textTheme: const TextTheme(
      displayLarge: TextStyle(color: Color(0xB3FFFFFF)), // white70
      displayMedium: TextStyle(color: Color(0xB3FFFFFF)),
      displaySmall: TextStyle(color: Color(0xB3FFFFFF)),
      headlineLarge: TextStyle(color: Color(0xFFFFFFFF)), // white
      headlineMedium: TextStyle(color: Color(0xFFFFFFFF)),
      headlineSmall: TextStyle(color: Color(0xFFFFFFFF)),
      titleLarge: TextStyle(color: Color(0xFFFFFFFF)),
      titleMedium: TextStyle(color: Color(0xFFFFFFFF)),
      titleSmall: TextStyle(color: Color(0xFFFFFFFF)),
      bodyLarge: TextStyle(color: Color(0xB3FFFFFF)),
      bodyMedium: TextStyle(color: Color(0xB3FFFFFF)),
      bodySmall: TextStyle(color: Color(0xB3FFFFFF)),
      labelLarge: TextStyle(color: Color(0xB3FFFFFF)),
      labelMedium: TextStyle(color: Color(0xB3FFFFFF)),
      labelSmall: TextStyle(color: Color(0xB3FFFFFF)),
    ),
    iconTheme: const IconThemeData(color: Color(0xB3FFFFFF)), // white70
    dividerColor: const Color(0xFF616161), // grey[700]
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFF424242), // grey[800]
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),
  );

  // Helper method to create MaterialColor from Color
  static MaterialColor _createMaterialColor(Color color) {
    List<double> strengths = [.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }

    for (double strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }

    return MaterialColor(color.value, swatch);
  }
}