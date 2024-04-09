import 'package:app/models/user.dart';
import 'package:app/widgets/profile_screen/book_portrait.dart';
import 'package:app/widgets/profile_screen/styled_text.dart';
import 'package:flutter/material.dart';

class LastLiked extends StatelessWidget {
  const LastLiked(
      {super.key,
      required this.width,
      required this.height,
      required this.user});

  final double width;
  final double height;
  final User user;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ListView.separated(
        itemCount: 6,
        itemBuilder: (context, index) {
          return Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BookPortrait(book: user.defaultBookLists[0].books[index], width: width/10*4, height: height/2),
                BookPortrait(book: user.defaultBookLists[0].books[index], width: width/10*4, height: height/2),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: height / 6),
      ),
    );
  }
}
