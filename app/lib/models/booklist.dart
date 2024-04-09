import 'package:app/models/book.dart';
import 'package:flutter/material.dart';

class BookList {
  const BookList({
    required this.title,
    required this.subtitle,
    required this.color,
    this.books = const [],
  });

  final String title;
  final String subtitle;
  final List<Book> books;
  final Color color;
}
