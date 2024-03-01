import 'package:firebase_project/Sscreen/view_note.dart';
import 'package:firebase_project/auth/screen/login_screen.dart';
import 'package:flutter/material.dart';

class BottonBar extends StatefulWidget {
  static const String routeName = "/button-bar";
  const BottonBar({super.key});

  @override
  State<BottonBar> createState() => _BottonBarState();
}

class _BottonBarState extends State<BottonBar> {
  int _page = 0;

  List<Widget> pages=[
    ViewNoteScreen(),
    HomeScreen(),
    HomeScreen(),
  ];
  void updatePage(int page){
    setState(() {
      _page=page;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.amber,
        selectedIndex: _page,
        elevation: 10,
        onDestinationSelected: updatePage,
        destinations: const [
          NavigationDestination(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          NavigationDestination(
            label: 'Favorites',
            icon: Icon(Icons.favorite),
          ),
          NavigationDestination(
            label: 'Profile',
            icon: Icon(
              Icons.person,
            ),
          ),
        ],
      ),
    );
  }
}