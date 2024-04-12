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
          color: const Color.fromARGB(255, 49, 47, 47),
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
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  booklist.subtitle,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            Text('$currentBookCount books'),
          ],
        ),
      ),
    );
  }
}
