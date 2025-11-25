import 'package:flutter/material.dart';
import 'package:bookxchange_app/core/constants/color_codes.dart';
import 'screens/auth/onboarding.dart';

// @SAQIB
// This file sets up the main application widget.

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.dark
          ? ThemeMode.light
          : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BookLelo',

      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeMode,

      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'BookLelo', toggleTheme: _toggleTheme),
    );
  }
}
