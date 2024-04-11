import 'package:app/widgets/booklist_screen/booklists_screen.dart';
import 'package:app/widgets/profile_screen/profile_screen.dart';
import 'package:app/widgets/search_screen/search_screen.dart';
import 'package:app/widgets/swipe_screen/swipe_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

/// This class creates and uses bottomNavigationBar, it also controls switching between different screens.
class MyHomePageController extends StatefulWidget {
  @override
  _MyHomePageControllerState createState() => _MyHomePageControllerState();
}

class _MyHomePageControllerState extends State<MyHomePageController> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    SearchScreen(), // TODO: change this search to down
    SwipeScreen(),
    BookListsScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: _screens[_selectedIndex], // Muestra la pantalla seleccionada
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.0382,
              vertical: screenHeight * 0.01276),
          // padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: GNav(
            color: Colors.white,
            activeColor: Colors.amber,
            tabBackgroundColor: Color.fromARGB(255, 56, 55, 55),
            gap: 9,
            padding: EdgeInsets.all(16),
            tabs: [
              GButton(
                icon: Icons.swap_calls,
                text: 'Swipe',
                onPressed: () =>
                    _onItemTapped(0), // Cambia a la pantalla SwipeScreen
              ),
              GButton(
                icon: Icons.search,
                text: 'Search',
                onPressed: () =>
                    _onItemTapped(1), // Cambia a la pantalla SearchScreen
              ),
              GButton(
                icon: Icons.bookmark,
                text: 'Lists',
                onPressed: () =>
                    _onItemTapped(2), // Cambia a la pantalla ListsScreen
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
                onPressed: () =>
                    _onItemTapped(3), // Cambia a la pantalla ProfileScreen
              ),
            ],
          ),
        ),
      ),
    );
  }
}
