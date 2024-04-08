import 'package:app/models/list.dart';
import 'package:flutter/material.dart';

class BookListItem extends StatelessWidget {
  BookListItem({super.key, required this.booklist});

  final BookList booklist;
  var currentBookCount = 0;

  @override
  Widget build(BuildContext context) {
    currentBookCount = booklist.books.length;
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  booklist.title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  booklist.subtitle,
                  style: TextStyle(color: Colors.grey),
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
