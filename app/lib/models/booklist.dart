import 'package:app/models/book.dart';
import 'package:flutter/material.dart';

class BookList {
  BookList({
    required this.title,
    required this.subtitle,
    required this.color,
  }) : books = [];

  final String title;
  final String subtitle;
  List<Book> books;
  Color color;
}
