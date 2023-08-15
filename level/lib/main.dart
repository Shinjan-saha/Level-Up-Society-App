import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'home.dart';
import 'tournament.dart';
import 'contact.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    TournamentPage(),
    ContactPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('asset/body-bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _selectedIndex,
        backgroundColor: const Color.fromARGB(255, 136, 4, 132),
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        height: 50,
        items: const <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.gamepad, size: 30),
          Icon(Icons.contact_emergency_sharp, size: 30),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}