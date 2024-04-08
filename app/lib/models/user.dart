import 'package:app/models/list.dart';

class User {
  const User(
      {required this.username,
      required this.password,
      required this.name,
      required this.image,
      this.bookLists = const [
        BookList(title: "Liked books", subtitle: "Books that you liked."),
        BookList(title: "Read books", subtitle: "Books that you already read."),
      ]});

  final String username;
  final String password;
  final String name;
  final String image;
  final List<BookList> bookLists;
}
