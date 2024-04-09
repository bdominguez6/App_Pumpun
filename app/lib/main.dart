import 'package:app/widgets/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

void main() {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          leading: Image.asset('assets/images/icon_64px.png'),
          title: Text('App'),
          ),
        bottomNavigationBar: Container(
          color: Colors.black,
          child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
              child: GNav(
                color: Colors.white,
                activeColor: Colors.amber,
                tabBackgroundColor: Color.fromARGB(255, 56, 55, 55),
                gap: 9,
                padding: EdgeInsets.all(16),
                tabs: [
                  GButton(icon: Icons.swap_calls, text: 'Swipe'),
                  GButton(
                    icon: Icons.search,
                    text: 'Search'
                  ),
                  GButton(icon: Icons.bookmark, text: 'Lists'),
                  GButton(icon: Icons.person_2, text: 'Profile')
                ],
              )),
        ),
        body: ProfileScreen(),
        ),
      ),
  );
}
