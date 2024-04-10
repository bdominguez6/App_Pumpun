import 'package:app/models/book.dart';
import 'package:flutter/material.dart';

//each book item display on the list
class BookItem extends StatelessWidget {
  const BookItem({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    String clippedDescription = book.description.length >= 50
        ? "${book.description.substring(0, 50)}..."
        : book.description;
    return Card(
      child: Text(clippedDescription),
    );
  }
}
