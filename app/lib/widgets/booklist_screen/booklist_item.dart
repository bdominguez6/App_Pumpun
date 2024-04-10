import 'package:app/models/booklist.dart';
import 'package:flutter/material.dart';

class BookListItem extends StatelessWidget {
  BookListItem({super.key, required this.booklist});

  final BookList booklist;
  var currentBookCount = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    currentBookCount = booklist.books.length;
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 49, 47, 47),
          borderRadius: BorderRadius.circular(screenWidth * 0.04),
          /*border: Border.all(
            color: booklist.color,
            width: 3,
          ),*/
          boxShadow: [
            BoxShadow(
              color: booklist.color,
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ]),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.055, vertical: screenHeight * 0.023),
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
