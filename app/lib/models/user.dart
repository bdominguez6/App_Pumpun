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
  final String name;
  final String image;
  List<BookList> defaultBookLists = [
    BookList(title: "Records", subtitle: "records", color: Colors.transparent),
    BookList(
        title: "Liked books",
        subtitle: "Books that you liked.",
        color: Colors.green),
    BookList(
        title: "Read books",
        subtitle: "Books that you already read.",
        color: Colors.red),
  ];
  List<BookList> createdBookLists = [];

  List<BookList> get allBookListsToShow =>
      ([...defaultBookLists.sublist(1), ...createdBookLists]);
}
