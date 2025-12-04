import 'package:bookxchange_app/core/constants/color_codes.dart';
import 'package:bookxchange_app/screens/auth/login_screen.dart';
import 'package:bookxchange_app/screens/auth/signup_screen.dart';
import 'package:flutter/material.dart';
import '../../widgets/buttons/auth_button.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  final VoidCallback toggleTheme;

  const MyHomePage({super.key, required this.title, required this.toggleTheme});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(
          255,
          40,
          98,
          145,
        ), // 🔵 Only this blue
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to BookLelo!',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            Text(
              'Your one-stop solution for book lovers.',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 50),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 40, 98, 145),
              ),
              onPressed: widget.toggleTheme,
              child: const Text(
                'Change Theme Mode',
                style: TextStyle(color: Colors.white),
              ),
            ),

            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(
                  255,
                  40,
                  98,
                  145,
                ), // 🔵 BLUE BG
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignupScreen()),
                );
              },
              child: const Text(
                "Join Us",
                style: TextStyle(color: Colors.white), // ⚪ WHITE TEXT
              ),
            ),
            const SizedBox(height: 20),
            AuthButton(
              text: 'Login',

              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
