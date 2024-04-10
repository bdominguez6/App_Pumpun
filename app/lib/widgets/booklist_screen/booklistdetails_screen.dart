import 'package:app/models/booklist.dart';
import 'package:flutter/material.dart';

class BookListDetailsScreen extends StatelessWidget {
  BookListDetailsScreen({super.key, required this.currentList});

  final BookList currentList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text(currentList.title),
      ),
    );
  }
}
