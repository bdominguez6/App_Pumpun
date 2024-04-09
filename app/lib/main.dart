import 'package:app/widgets/booklist/booklists_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData.dark(),
    title: 'Swipereading',
    home: const BookListsScreen(),
  ));
}
