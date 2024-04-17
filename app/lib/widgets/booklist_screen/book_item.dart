import 'package:app/constants/screen_constants.dart';
import 'package:app/models/book.dart';
import 'package:flutter/material.dart';

//each book item display on the list
class BookItem extends StatelessWidget {
  const BookItem({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    String clippedDescription = book.description.length >= 70
        ? "${book.description.substring(0, 70)}..."
        : book.description;
    return Card(
      surfaceTintColor: Colors.transparent,
      color: Theme.of(context).colorScheme.secondary,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: ScreenConstants.width * 0.055,
            vertical: ScreenConstants.height * 0.023),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Image.asset(
            book.cover,
            width: ScreenConstants.width * 0.2,
            height: ScreenConstants.height * 0.1,
          ),
          SizedBox(
            width: ScreenConstants.width * 0.04,
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  book.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
                SizedBox(
                  height: ScreenConstants.height * 0.01,
                ),
                Text(
                  clippedDescription,
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.surface),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
