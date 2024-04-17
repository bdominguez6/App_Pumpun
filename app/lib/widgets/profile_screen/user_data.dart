import 'package:app/widgets/profile_screen/circular_image.dart';
import 'package:flutter/material.dart';

import '../../models/user.dart';

/// Un [Container] que representa la información principal de un usuario.
///
/// Genera un [Container] que, en función de [width] y de [height],
/// representa mediante una Column [user.image], [user.username] y [user.name] en ese orden.
class UserData extends StatelessWidget {
  const UserData(
      {super.key,
      required this.width,
      required this.height,
      required this.user});

  final double width;
  final double height;
  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height * 0.25,
      child: Column(
        children: [
          Expanded(
            child: CircularImage(
              height: height * 0.333,
              width: width * 0.333,
              imagePath: user.image,
            ),
          ),
          SizedBox(height: width * 0.025),
          Text(
            user.username,
            style: TextStyle(
              fontSize: height * 0.0285,
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
          SizedBox(height: height * 0.00625),
          Text(
            user.name,
            style: TextStyle(
              fontSize: height * 0.02,
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
        ],
      ),
    );
  }
}
