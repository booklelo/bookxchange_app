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
      appBar: AppBar(title: Text(widget.title)),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to BookLelo!',
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            Text(
              'Your one-stop solution for book lovers.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            const SizedBox(height: 50),

            ElevatedButton(
              onPressed: widget.toggleTheme,
              child: const Text('Change Theme Mode'),
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
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorCodes.primaryColor,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignupScreen()),
                );
              },
              child: Text(
                style: const TextStyle(color: ColorCodes.backgroundColor),
                "Join Us",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
