import 'package:app/constants/screen_constants.dart';
import 'package:app/models/enums.dart';
import 'package:flutter/material.dart';

import '../../controllers/settings_controller.dart';

class ThemeSettings extends StatefulWidget {
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
  State<ThemeSettings> createState() {
    return _ThemeSettingsState();
  }
}

class _ThemeSettingsState extends State<ThemeSettings> {
  Radio createRadio(AppTheme value, int color) {
    return Radio(
      value: value,
      groupValue: SettingsController.theme,
      onChanged: (theme) {
        setState(() {
          SettingsController.theme = theme;
        });
      },
      fillColor: MaterialStateColor.resolveWith(
          (states) => Theme.of(context).colorScheme.outline),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenConstants.width * 0.9,
      height: ScreenConstants.width * 0.675,
      child: Column(
        children: [
          Container(
            height: ScreenConstants.width * 0.225,
            width: ScreenConstants.width * 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                createRadio(AppTheme.red, 0),
                Container(
                  color: widget.colors[0],
                  width: ScreenConstants.width * 0.09,
                  height: ScreenConstants.width * 0.09,
                ),
                createRadio(AppTheme.orange, 1),
                Container(
                  color: widget.colors[1],
                  width: ScreenConstants.width * 0.09,
                  height: ScreenConstants.width * 0.09,
                ),
                createRadio(AppTheme.yellow, 2),
                Container(
                  color: widget.colors[2],
                  width: ScreenConstants.width * 0.09,
                  height: ScreenConstants.width * 0.09,
                ),
                createRadio(AppTheme.lime, 3),
                Container(
                  color: widget.colors[3],
                  width: ScreenConstants.width * 0.09,
                  height: ScreenConstants.width * 0.09,
                ),
              ],
            ),
          ),
          Container(
            height: ScreenConstants.width * 0.225,
            width: ScreenConstants.width * 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                createRadio(AppTheme.green, 4),
                Container(
                  color: widget.colors[4],
                  width: ScreenConstants.width * 0.09,
                  height: ScreenConstants.width * 0.09,
                ),
                createRadio(AppTheme.teal, 5),
                Container(
                  color: widget.colors[5],
                  width: ScreenConstants.width * 0.09,
                  height: ScreenConstants.width * 0.09,
                ),
                createRadio(AppTheme.aqua, 6),
                Container(
                  color: widget.colors[6],
                  width: ScreenConstants.width * 0.09,
                  height: ScreenConstants.width * 0.09,
                ),
                createRadio(AppTheme.lightBlue, 7),
                Container(
                  color: widget.colors[7],
                  width: ScreenConstants.width * 0.09,
                  height: ScreenConstants.width * 0.09,
                ),
              ],
            ),
          ),
          Container(
            height: ScreenConstants.width * 0.225,
            width: ScreenConstants.width * 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                createRadio(AppTheme.blue, 8),
                Container(
                  color: widget.colors[8],
                  width: ScreenConstants.width * 0.09,
                  height: ScreenConstants.width * 0.09,
                ),
                createRadio(AppTheme.lavender, 9),
                Container(
                  color: widget.colors[9],
                  width: ScreenConstants.width * 0.09,
                  height: ScreenConstants.width * 0.09,
                ),
                createRadio(AppTheme.violet, 10),
                Container(
                  color: widget.colors[10],
                  width: ScreenConstants.width * 0.09,
                  height: ScreenConstants.width * 0.09,
                ),
                createRadio(AppTheme.pink, 11),
                Container(
                  color: widget.colors[11],
                  width: ScreenConstants.width * 0.09,
                  height: ScreenConstants.width * 0.09,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
