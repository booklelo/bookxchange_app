import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bookxchange_app/core/constants/color_codes.dart';
import 'screens/auth/onboarding.dart';
import 'screens/home/home_screen.dart';

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
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeMode,

      // 🔑 AUTH GATE (THIS IS THE KEY)
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // ⏳ Waiting for Firebase to restore session
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          // ✅ User logged in
          if (snapshot.hasData) {
            return HomeScreen(toggleTheme: _toggleTheme);
          }

          // ❌ User not logged in
          return MyHomePage(title: 'BookLelo', toggleTheme: _toggleTheme);
        },
      ),
    );
  }
}
