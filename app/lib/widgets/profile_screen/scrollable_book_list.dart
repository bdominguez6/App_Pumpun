import 'package:app/widgets/profile_screen/book_portrait.dart';
import 'package:flutter/material.dart';

import '../../models/book.dart';

/// Lista representada de forma scrolleable.
///
/// [SizedBox] que contiene un [ListBox] de [Row]s que muestran los elementos
/// de una lista de libros de dos a dos.
class ScrollableBookList extends StatelessWidget {
  const ScrollableBookList(
      {super.key,
      required this.width,
      required this.height,
      required this.books});

  final double width;
  final double height;
  final List<Book> books;

  // Las cuentas con la itemCount y el index son necesarias para que se muestren
  // los elementos en rows y no se salte ningún libro
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ListView.separated(
        itemCount: (books.length + 1) ~/ 2,
        itemBuilder: (context, index) {
          return Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BookPortrait(
                    book: books[index * 2],
                    width: width * 0.4,
                    height: height * 0.5),
                if (index * 2 + 1 < books.length)
                  BookPortrait(
                      book: books[index * 2 + 1],
                      width: width *0.4,
                      height: height * 0.5),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: height * 0.1666),
      ),
    );
  }
}
