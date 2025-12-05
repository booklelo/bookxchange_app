import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignupAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<String> signupUser(String name, String email, String password) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final userInfo = {
        "name": name,
        "email": email,
        "uid": credential.user?.uid,
      };

      await db.collection("users").doc(userInfo['uid']).set(userInfo);

      return "success"; // SIGNUP SUCCESS
    } on FirebaseAuthException catch (e) {

      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } 

      if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }

      // Any other Firebase error
      return e.message ?? "Signup failed.";
    } catch (e) {
      return "Something went wrong. Try again.";
    }
  }
}
