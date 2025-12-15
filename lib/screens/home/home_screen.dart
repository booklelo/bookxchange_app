import 'package:bookxchange_app/screens/auth/onboarding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../../core/constants/color_codes.dart';
import '../profile/my_profile.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback toggleTheme;

  const HomeScreen({super.key, required this.toggleTheme});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;

  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey =
      GlobalKey<CurvedNavigationBarState>();

  final List<Widget> _pages = [
    const Center(child: Text("Home Page", style: TextStyle(fontSize: 22))),
    const Center(child: Text("Search Page", style: TextStyle(fontSize: 22))),
    const Center(child: Text("Books Page", style: TextStyle(fontSize: 22))),
    const Center(child: Text("Chats Page", style: TextStyle(fontSize: 22))),
    const MyProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: _pages[_page]),

          // // Programmatic Navigation Example
          // ElevatedButton(
          //   child: const Text('Go To Books Tab (index 1)'),
          //   onPressed: () {
          //     final navBarState = _bottomNavigationKey.currentState;
          //     navBarState?.setPage(1);
          //   },
          // ),
        ],
      ),

      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: _page,
        height: 60,
        backgroundColor: Colors.transparent,
        color: ColorCodes.primaryColor,
        animationDuration: const Duration(milliseconds: 300),
        items: const [
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.search, size: 30, color: Colors.white),
          Icon(Icons.menu_book, size: 30, color: Colors.white),
          Icon(Icons.chat, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
    );
  }
}
