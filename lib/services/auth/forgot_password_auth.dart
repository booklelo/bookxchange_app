import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return "success";
    } on FirebaseAuthException catch (e) {
      return e.message ?? "Something went wrong";
    } catch (e) {
      return "An unexpected error occurred";
    }
  }
}
