import 'package:app/constants/screen_constants.dart';
import 'package:app/controllers/common/shared_preferences_controller.dart';
import 'package:app/data/common/init_dummy_data.dart';
import 'package:app/controllers/database/book_service.dart';
import 'package:app/controllers/database/sqlite_service.dart';
import 'package:app/models/book.dart';
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
    SwipeScreen(),
    SearchScreen(),
    BookListsScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      //init shared preferences
      SharedPreferencesController().loadUser();
      //init db
      initDummyData();
      //add first data (books, listbooks, put that books on the list, add genres and authors to those books)
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex], // Muestra la pantalla seleccionada
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ScreenConstants.width * 0.0382,
              vertical: ScreenConstants.height * 0.01276),
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
