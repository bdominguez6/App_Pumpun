import 'package:app/widgets/profile/styled_text.dart';
import 'package:app/widgets/profile/user_portrait.dart';
import 'package:flutter/material.dart';

import '../../models/user.dart';

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
      height: screenHeight / 4,
      child: Column(
        children: [
          Expanded(
            child: UserPortrait(
              height: screenHeight / 3,
              width: screenWidth / 3,
              imagePath: user.image,
            ),
          ),
          SizedBox(height: screenWidth / 40),
          StyledText(
            text: user.username,
            fontSize: screenHeight / 35,
          ),
          SizedBox(height: screenHeight / 160),
          StyledText(
            text: user.name,
            fontSize: screenHeight / 50,
          ),
        ],
      ),
    );
  }
}
