import 'package:app/constants/screen_constants.dart';
import 'package:flutter/material.dart';

class EmptyListMessage extends StatelessWidget {
  const EmptyListMessage({required this.width, required this.height});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width * 0.95,
      height: height,
      child: Center(
        heightFactor: ScreenConstants.height * 0.02,
        child: Text(
          'The list is empty, go swipe some books!',
          style: TextStyle(
            fontSize: ScreenConstants.height * 0.02,
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
      ),
    );
  }
}