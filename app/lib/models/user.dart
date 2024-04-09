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
    const BookList(
        title: "Liked books",
        subtitle: "Books that you liked.",
        color: Colors.green),
    const BookList(
        title: "Read books",
        subtitle: "Books that you already read.",
        color: Colors.yellow),
    const BookList(
        title: "Reading",
        subtitle: "Books that you are reading.",
        color: Colors.white),
    const BookList(
        title: "Records",
        subtitle: "records",
        color: Color.fromARGB(0, 0, 0, 0)),
  ];
  List<BookList> createdBookLists = [];
}
