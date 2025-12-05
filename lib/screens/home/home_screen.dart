import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../core/constants/color_codes.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Home", style: TextStyle(color: ColorCodes.textColor)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(2),
        child: Column(
          children: [
            // DoubleTapToExit(
            //   child: Scaffold(),
            //   snackBar: const SnackBar(content: Text('Tap again to exit !')),
            // ),
            ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pop(context);
              },
              child: const Text("LOGOUT"),
            ),
          ],
        ),
      ),
    );
  }
}
