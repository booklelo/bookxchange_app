import 'package:flutter/material.dart';

/// @SAQIB
/// Color codes used throughout the application for consistent theming.

class ColorCodes {
  static const Color primaryColor = Color.fromARGB(255, 65, 126, 187);
  static const Color secondaryColor = Color.fromARGB(255, 109, 62, 2);
  static const Color accentColor = Color(0xFFFFC107);
  static const Color backgroundColor = Color(0xFFF5F5F5);
  static const Color textColor = Color(0xFF212121);
}

/// -------------------------
///   LIGHT THEME
/// -------------------------

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: ColorCodes.primaryColor,
  scaffoldBackgroundColor: ColorCodes.backgroundColor,

  colorScheme: ColorScheme.light(
    primary: ColorCodes.primaryColor,
    secondary: ColorCodes.accentColor,
    surface: ColorCodes.backgroundColor,
    onSurface: ColorCodes.textColor,
  ),

  appBarTheme: AppBarTheme(
    backgroundColor: ColorCodes.primaryColor,
    foregroundColor: Colors.white,
    titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
    elevation: 2,
  ),

  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: ColorCodes.textColor),
    bodyMedium: TextStyle(color: ColorCodes.textColor),
  ),
);

/// ---------------------
///   DARK THEME
/// ---------------------

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: ColorCodes.secondaryColor,
  scaffoldBackgroundColor: const Color(0xFF121212),

  colorScheme: ColorScheme.dark(
    primary: ColorCodes.secondaryColor,
    secondary: ColorCodes.accentColor,
    surface: Color.fromARGB(255, 1, 211, 88),
    onSurface: Colors.white,
  ),

  appBarTheme: AppBarTheme(
    backgroundColor: ColorCodes.secondaryColor,
    foregroundColor: Colors.white,
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
    elevation: 2,
  ),

  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white70),
  ),
);
