import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Signup')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InputDecorator(
              decoration: const InputDecoration(labelText: 'Email'),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(),
              ),
            ),
            InputDecorator(
              decoration: const InputDecoration(labelText: 'Name'),
              child: TextField(
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(),
              ),
            ),
            InputDecorator(
              decoration: const InputDecoration(labelText: 'Password'),
              child: TextField(
                keyboardType: TextInputType.visiblePassword,
                decoration: const InputDecoration(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: Text("Sign Up")),
          ],
        ),
      ),
    );
  }
}
