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

      final userInfo = <String, dynamic>{
        "name": name,
        "email": email,
        "uid": credential.user?.uid,
      };

      db.collection("users").doc(userInfo['uid']).set(userInfo);

      return "success"; // authenticated successfully
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }

    return "Something went wrong. Try again later.";
  }
}
