import 'package:app/models/book.dart';

class BookList {
  const BookList({
    required this.title,
    required this.subtitle,
    this.books = const [],
  });

  final String title;
  final String subtitle;
  final List<Book> books;
}
