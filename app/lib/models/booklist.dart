import 'package:app/models/book.dart';
import 'package:flutter/material.dart';

class BookList {
  BookList({
    required this.books,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  //constructor with maps from the database
  BookList.fromMap(Map<String, dynamic> item)
      : this.id = item['id'] as int,
        this.title = item['title'] as String,
        this.subtitle = item['subtitle'] as String,
        this.color = Color(item['color'] as int),
        this.books = [];

  //send objects with map form to the data base
  Map<String, Object?> toMap() {
    return {'title': title, 'subtitle': subtitle, 'color': color.value};
  }

  late int id;
  final String title;
  final String subtitle;
  List<Book> books;
  Color color;
}
