import 'package:firebase_auth/firebase_auth.dart';


class LoginAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> loginUser(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return "success";
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        return "No user found for that email.";
      } else if (e.code == "wrong-password") {
        return "Incorrect password.";
      } else {
        return e.message ?? "Login failed.";
      }
    } catch (e) {
      return "Something went wrong.";
    }
  }
}
