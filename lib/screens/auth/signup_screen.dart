import 'package:flutter/material.dart';
import '../../core/constants/color_codes.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // Controllers to capture text from TextFields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // Dispose controllers to avoid memory leaks
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleSignup() {
    final String name = _nameController.text.trim();
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();

    print("Name: $name");
    print("Email: $email");
    print("Password: $password");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _signupScreenBody());
  }

  Widget _signupScreenBody() {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Signup Screen',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),

              // Name
              const Align(alignment: Alignment.centerLeft, child: Text("Name")),
              const SizedBox(height: 8),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'John Doe',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),

              const SizedBox(height: 20),

              // Email
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Email"),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'johndoe@example.com',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),

              const SizedBox(height: 20),

              // Password
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Password"),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'JohnDoe@123',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),

              const SizedBox(height: 30),

              // Signup Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorCodes.primaryColor,
                  minimumSize: const Size.fromHeight(48),
                ),
                onPressed: _handleSignup,
                child: const Text(
                  "Sign Up",
                  style: TextStyle(
                    color: ColorCodes.backgroundColor,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
