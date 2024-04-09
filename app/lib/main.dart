import 'package:app/widgets/booklist/booklists_screen.dart';
import 'package:app/widgets/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData.dark(),
    title: 'Swipereading',
    home: const BookListsScreen(),
  ));
}
