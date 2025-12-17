import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../../core/constants/color_codes.dart';
import '../profile/my_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../auth/onboarding.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  final VoidCallback toggleTheme;

  const HomeScreen({super.key, required this.toggleTheme});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  Timer? _logoutTimer;
  bool _isHoldingProfile = false;

  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey =
      GlobalKey<CurvedNavigationBarState>();

  Future<void> _logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (_) => MyHomePage(title: "BookLelo", toggleTheme: () {}),
      ),
      (route) => false,
    );
  }

  final List<Widget> _pages = [
    const Center(child: Text("Home Page", style: TextStyle(fontSize: 22))),
    const Center(child: Text("Search Page", style: TextStyle(fontSize: 22))),
    const Center(child: Text("Books Page", style: TextStyle(fontSize: 22))),
    const Center(child: Text("Chats Page", style: TextStyle(fontSize: 22))),
    MyProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: Column(children: [Expanded(child: _pages[_page])]),

        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: _page,
          height: 60,
          backgroundColor: Colors.transparent,
          color: ColorCodes.primaryColor,
          animationDuration: const Duration(milliseconds: 300),
          items: [
            const Icon(Icons.home, size: 30, color: Colors.white),
            const Icon(Icons.search, size: 30, color: Colors.white),
            const Icon(Icons.menu_book, size: 30, color: Colors.white),
            const Icon(Icons.chat, size: 30, color: Colors.white),

            // 👇 PROFILE ICON WITH 5s HOLD LOGOUT
            GestureDetector(
              onLongPressStart: (_) {
                _isHoldingProfile = true;
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Hold for 5 seconds to logout")),
                );

                _logoutTimer = Timer(const Duration(seconds: 3), () {
                  if (_isHoldingProfile) {
                    _logout(context);
                  }
                });
              },
              onLongPressEnd: (_) {
                _isHoldingProfile = false;
                _logoutTimer?.cancel();
              },
              child: const Icon(Icons.person, size: 30, color: Colors.white),
            ),
          ],
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
        ),
      ),
    );
  }
}
