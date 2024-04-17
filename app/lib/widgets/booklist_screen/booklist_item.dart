import 'package:app/constants/screen_constants.dart';
import 'package:app/models/booklist.dart';
import 'package:flutter/material.dart';

//item LIST (list of lists)
class BookListItem extends StatelessWidget {
  BookListItem({super.key, required this.booklist});

  final BookList booklist;
  var currentBookCount = 0;

  @override
  Widget build(BuildContext context) {
    currentBookCount = booklist.books.length;
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(ScreenConstants.width * 0.04),
          /*border: Border.all(
            color: booklist.color,
            width: 3,
          ),*/
          boxShadow: [
            BoxShadow(
              color: booklist.color,
              blurRadius: 8,
              offset: const Offset(3, 5),
            ),
          ]),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: ScreenConstants.width * 0.055,
            vertical: ScreenConstants.height * 0.023),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  booklist.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
                Text(
                  booklist.subtitle,
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.surface),
                ),
              ],
            ),
            Text(
              '$currentBookCount books',
              style: TextStyle(
                color: Theme.of(context).colorScheme.outline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
