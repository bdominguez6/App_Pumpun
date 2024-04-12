import 'package:app/constants/screen_constants.dart';
import 'package:app/controllers/common/string_extension.dart';
import 'package:flutter/material.dart';

class GenreCard extends StatelessWidget {
  const GenreCard({super.key, required this.genre});

  final String genre;

  @override
  Widget build(BuildContext context) {
    return Card(
      // 255, 193, 7
      color: Color.fromARGB(150, 255, 193, 7),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: ScreenConstants.height * 0.008,
            horizontal: ScreenConstants.width * 0.04),
        child: Text(genre.capitalize(), style: TextStyle(fontSize: ScreenConstants.height * 0.018),),
      ),
    );
  }
}