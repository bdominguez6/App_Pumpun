import 'package:flutter/material.dart';

import 'booklist.dart';

//unused class as there's only one user
class User {
  User({
    required this.username,
    required this.password,
    required this.email,
    required this.name,
    required this.image,
  });

  String username;
  String password;
  String email;
  String name;
  String image;

  List<BookList> defaultBookLists = [
    BookList(
        title: "Wishlist books",
        subtitle: "Books that you want to read.",
        color: Colors.green,
        books: []),
    BookList(
        title: "Read books",
        subtitle: "Books that you already read.",
        color: Colors.red,
        books: []),
  ];

  BookList records = BookList(
      title: "Records",
      subtitle: "records",
      color: Colors.transparent,
      books: []);

  List<BookList> createdBookLists = [];

  List<BookList> get getAllBookLists =>
      ([...defaultBookLists, ...createdBookLists]);
}
