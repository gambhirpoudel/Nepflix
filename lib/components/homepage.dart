import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:nepflix/components/moviehome.dart';
import 'package:nepflix/components/tvhome.dart';
import 'package:nepflix/components/userprofile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Widget> _screens = <Widget>[
    const MovieHome(),
    const TvHome(),
    const Profile(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(8),
        color: const Color(0xFFE50914),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: GNav(
            backgroundColor: const Color(0xFFE50914),
            activeColor: const Color(0xFFE50914),
            color: Colors.white,
            tabBackgroundColor: Colors.white,
            gap: 15,
            padding: const EdgeInsets.all(10),
            tabs: const [
              GButton(
                icon: Icons.movie,
                text: 'Movies',
              ),
              GButton(
                icon: Icons.tv,
                text: 'TVs',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: _onItemTap,
          ),
        ),
      ),
    );
  }
}
