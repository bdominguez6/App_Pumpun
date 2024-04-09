import 'package:flutter/material.dart';

class UserPortrait extends StatelessWidget {
  const UserPortrait(
      {super.key,
      required this.width,
      required this.height,
      required this.imagePath});

  final double width;
  final double height;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          width: width / 100,
        ),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
