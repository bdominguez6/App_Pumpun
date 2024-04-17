import 'package:app/models/book.dart';
import 'package:flutter/material.dart';

class BookList {
  BookList({
    this.id,
    required this.title,
    required this.subtitle,
    required this.color,
  }) : books = [];

  //constructor with maps from the database
  BookList.fromMap(Map<String, dynamic> item, List<Book> books)
      : this.id = item['id'],
        this.title = item['title'],
        this.subtitle = item['subtitle'],
        this.color = Color(item['color']),
        this.books = books;

  //send objects with map form to the data base
  Map<String, Object?> toMap() {
    return {'title': title, 'subtitle': subtitle, 'color': color.value};
  }

  int? id;
  final String title;
  final String subtitle;
  List<Book> books;
  Color color;
}
