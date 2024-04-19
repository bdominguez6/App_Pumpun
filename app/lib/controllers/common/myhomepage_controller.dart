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
  const MyHomePageController({required this.onChangeTheme});

  final void Function() onChangeTheme;

  @override
  _MyHomePageControllerState createState() => _MyHomePageControllerState();
}

class _MyHomePageControllerState extends State<MyHomePageController> {
  int _selectedIndex = 0;

  List<Widget> _screens = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _screens = [
      SwipeScreen(),
      SearchScreen(),
      BookListsScreen(),
      ProfileScreen(onChangeTheme: widget.onChangeTheme)
    ];
      //init db
      //add first data (books, listbooks, put that books on the list, add genres and authors to those books)
      SQLiteService().initializeDB:
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex], // Muestra la pantalla seleccionada
      bottomNavigationBar: Container(
        color: Theme.of(context).colorScheme.primary,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ScreenConstants.width * 0.0382,
              vertical: ScreenConstants.height * 0.01276),
          // padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: GNav(
            color: Theme.of(context).colorScheme.outline,
            activeColor: Theme.of(context).colorScheme.tertiary,
            tabBackgroundColor: Theme.of(context).colorScheme.secondary,
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
