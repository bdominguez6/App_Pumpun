import 'package:app/constants/screen_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ThemeSettings extends StatelessWidget {
  List<Color> colors = [
    const Color.fromARGB(255, 255, 0, 0),
    const Color.fromARGB(255, 200, 100, 50),
    const Color.fromARGB(255, 150, 150, 0),
    const Color.fromARGB(255, 100, 200, 0),
    const Color.fromARGB(255, 0, 200, 0),
    const Color.fromARGB(255, 0, 200, 100),
    const Color.fromARGB(255, 0, 175, 175),
    const Color.fromARGB(255, 0, 100, 200),
    const Color.fromARGB(255, 50, 50, 255),
    const Color.fromARGB(255, 100, 50, 200),
    const Color.fromARGB(255, 175, 0, 175),
    const Color.fromARGB(255, 200, 50, 100),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      width: ScreenConstants.width * 0.9,
      height: ScreenConstants.width * 0.675,
      child: Column(
        children: [
          Container(
            color: Colors.red,
            height: ScreenConstants.width * 0.225,
            child: Row(
              children: [
                Text('a'),
              ],
            ),
          ),
          Container(
            color: Colors.yellow,
            height: ScreenConstants.width * 0.225,
            child: Row(
              children: [
                Text('b'),
              ],
            ),
          ),
          Container(
            color: Colors.blue,
            height: ScreenConstants.width * 0.225,
            child: Row(
              children: [
                Text('c'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
