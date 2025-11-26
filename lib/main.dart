import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app.dart';

// @SAQIB
// This is the main entry point of the application.

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Main());
}
