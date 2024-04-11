import 'package:app/models/book.dart';
import 'package:flutter/material.dart';

//each book item display on the list
class BookItem extends StatelessWidget {
  const BookItem({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    String clippedDescription = book.description.length >= 70
        ? "${book.description.substring(0, 70)}..."
        : book.description;
    return Card(
        child: Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.055, vertical: screenHeight * 0.023),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Image.asset(
          book.cover,
          width: screenWidth * 0.2,
          height: screenHeight * 0.1,
        ),
        SizedBox(
          width: screenWidth * 0.04,
        ),
        Expanded(
            child: Column(
          children: [
            Text(
              book.title,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            Text(
              clippedDescription,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        )),
      ]),
    ));
  }
}
