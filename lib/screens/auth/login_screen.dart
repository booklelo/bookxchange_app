import 'package:bookxchange_app/app.dart';
import 'package:bookxchange_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import '../../core/constants/color_codes.dart';
import '../../services/auth/login_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Email"),
            TextField(),
            SizedBox(height: 20),
            Text("Password"),
            TextField(obscureText: true),
            ElevatedButton(
              onPressed: () async {
                String value = await LoginAuth().loginUser(
                  "jvedsaqib1@gmail.com",
                  "Saqib@11",
                );

                if (value == "success") {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Login Successful!")),
                  );

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                } else {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(value)));
                }
              },
              child: const Text("LOGIN"),
            ),
          ],
        ),
      ),
    );
  }
}
