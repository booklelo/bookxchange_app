import 'package:firebase_auth/firebase_auth.dart';

// @SAQIB
// This service handles user authentication for login.

class LoginAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> loginUser(String email, String password) async {
    try {
      print("$email and $password");

      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return "success"; // authenticated successfully
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Incorrect password. Please try again.';
      } else {
        return e.message ?? "Authentication failed.";
      }
    } catch (e) {
      return "Something went wrong. Try again later.";
    }
  }
}
