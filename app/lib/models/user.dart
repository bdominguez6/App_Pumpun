import 'package:flutter/material.dart';

import 'booklist.dart';

class User {
  User({
    required this.username,
    required this.password,
    required this.name,
    required this.image,
  });

  final String username;
  final String password;
  // TODO: email
  final String name;
  final String image;

  List<BookList> defaultBookLists = [
    BookList(
        title: "Liked books",
        subtitle: "Books that you liked.",
        color: Colors.green),
    BookList(
        title: "Read books",
        subtitle: "Books that you already read.",
        color: Colors.red),
  ];

  BookList records = BookList(
      title: "Records", subtitle: "records", color: Colors.transparent);

  List<BookList> createdBookLists = [];

  List<BookList> get getAllBookLists =>
      ([...defaultBookLists, ...createdBookLists]);
}
