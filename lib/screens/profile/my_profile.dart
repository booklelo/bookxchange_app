import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../core/constants/color_codes.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  String _getInitial(User user) {
    final String? name = user.displayName;
    final String? email = user.email;

    if (name != null && name.trim().isNotEmpty) {
      return name.trim()[0].toUpperCase();
    }

    if (email != null && email.trim().isNotEmpty) {
      return email.trim()[0].toUpperCase();
    }

    return "U";
  }

  String _getUserName(User user) {
    if (user.displayName != null && user.displayName!.trim().isNotEmpty) {
      return user.displayName!;
    }
    return "User";
  }

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return const Center(
        child: Text("No user logged in", style: TextStyle(fontSize: 18)),
      );
    }

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Avatar
            CircleAvatar(
              radius: 50,
              backgroundColor: ColorCodes.primaryColor,
              child: Text(
                _getInitial(user),
                style: const TextStyle(
                  fontSize: 36,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Username
            Text(
              _getUserName(user),
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            // Email
            Text(
              user.email ?? "No email",
              style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
            ),

            const SizedBox(height: 24),

            // Profile Info Card (Simplified)
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  _infoTile("Username", _getUserName(user)),
                  _infoTile("Email", user.email ?? "No email"),
                  _infoTile(
                    "Email Verified",
                    user.emailVerified ? "Yes" : "No",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            OutlinedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Edit profile coming soon")),
                );
              },
              icon: const Icon(Icons.edit),
              label: const Text("Edit Profile"),
            ),

            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
              },
              child: const Text("LOGOUT"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoTile(String title, String value) {
    return ListTile(title: Text(title), subtitle: Text(value), dense: true);
  }
}
