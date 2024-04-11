import 'package:app/widgets/profile_screen/circular_image.dart';
import 'package:flutter/material.dart';

import '../../models/user.dart';

/// Un [Container] que representa la información principal de un usuario.
///
/// Genera un [Container] que, en función de [screenWidth] y de [screenHeight],
/// representa mediante una [Column] [user.image], [user.username] y [user.name] en ese orden.
class UserData extends StatelessWidget {
  const UserData(
      {super.key,
      required this.screenWidth,
      required this.screenHeight,
      required this.user});

  final double screenWidth;
  final double screenHeight;
  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      height: screenHeight * 0.25,
      child: Column(
        children: [
          Expanded(
            child: CircularImage(
              height: screenHeight * 0.333,
              width: screenWidth * 0.333,
              imagePath: user.image,
            ),
          ),
          SizedBox(height: screenWidth * 0.025),
          Text(
            user.username,
            style: TextStyle(fontSize: screenHeight * 0.0285),
          ),
          SizedBox(height: screenHeight * 0.00625),
          Text(
            user.name,
            style: TextStyle(fontSize: screenHeight * 0.02),
          ),
        ],
      ),
    );
  }
}
