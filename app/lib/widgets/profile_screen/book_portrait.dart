import 'package:app/models/book.dart';
import 'package:app/widgets/profile_screen/styled_text.dart';
import 'package:flutter/material.dart';

class BookPortrait extends StatelessWidget {
  const BookPortrait({
    super.key,
    required this.book,
    required this.width,
    required this.height,
  });

  final Book book;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    //String clippedTitle = book.title;
    String clippedTitle = book.title.length >= 18
        ? "${book.title.substring(0, 15)}..."
        : book.title;
    return Container(
      color: Color.fromARGB(150, 50, 50, 50),
      child: Column(
        children: [
          SizedBox(height: height/20 + height/12,),
          Image.asset(
            book.cover,
            width: width,
            height: height / 10 * 9,
          ),
          SizedBox(
            height: height / 20,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StyledText(text: clippedTitle, fontSize: height / 12),
              Icon(IconData(book.icon, fontFamily: 'MaterialIcons'), color: Colors.amber,),
            ],
          ),
          SizedBox(height: height/20,),
        ],
      ),
    );
  }
}
