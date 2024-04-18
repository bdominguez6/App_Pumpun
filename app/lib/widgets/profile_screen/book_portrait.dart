import 'package:app/models/book.dart';
import 'package:app/models/enums.dart';
import 'package:flutter/material.dart';

/// [Widget] que representa la miniatura de un libro
///
/// [Container] que representa la portada, el título y el icono del libro [book]
/// en una [Column] la cual contiene una [Row]
class BookPortrait extends StatelessWidget {
  const BookPortrait({
    super.key,
    required this.book,
    required this.width,
    required this.height,
    required this.action,
  });

  final Book book;
  final double width;
  final double height;
  final void Function() action;

  @override
  Widget build(BuildContext context) {
    String clippedTitle = book.title.length >= 18
        ? "${book.title.substring(0, 15)}..."
        : book.title;
    return InkWell(
      onTap: action,
      child: Container(
        color: Theme.of(context).colorScheme.secondary,
        child: Column(
          children: [
            SizedBox(height: height * 0.1333),
            Image.asset(
              book.cover,
              width: width,
              height: height * 0.9,
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  clippedTitle,
                  style: TextStyle(
                    fontSize: height * 0.0833,
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
                Icon(

                  IconData(recordIcons[book.record]!,
                      fontFamily: 'MaterialIcons'),
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ],
            ),
            SizedBox(
              height: height * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
