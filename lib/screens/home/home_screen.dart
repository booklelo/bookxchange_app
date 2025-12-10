import 'package:bookxchange_app/screens/auth/onboarding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../core/constants/color_codes.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback toggleTheme;

  HomeScreen({super.key, required this.toggleTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Home", style: TextStyle(color: ColorCodes.textColor)),

        actions: [
          IconButton(
            onPressed: toggleTheme,
            icon: const Icon(Icons.brightness_6),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();

                if (!context.mounted) return;

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        MyHomePage(title: "BookLelo", toggleTheme: toggleTheme),
                  ),
                );
              },
              child: const Text("LOGOUT"),
            ),
          ],
        ),
      ),
    );
  }
}
