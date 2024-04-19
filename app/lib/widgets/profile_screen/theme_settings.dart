import 'package:app/constants/screen_constants.dart';
import 'package:app/widgets/profile_screen/settings_screen.dart';
import 'package:flutter/material.dart';

class ThemeSettings extends StatefulWidget {
  @override
  State<ThemeSettings> createState() {
    return _ThemeSettingsState();
  }
}

class _ThemeSettingsState extends State<ThemeSettings> {

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
      width: ScreenConstants.width * 0.9,
      height: ScreenConstants.width * 0.675,
      child: Column(
        children: [
          Container(
            height: ScreenConstants.width * 0.225,
            child: Row(
              children: [
                SettingsScreenState.radios[0],
              ],
            ),
          ),
          Container(
            height: ScreenConstants.width * 0.225,
            child: Row(
              children: [
                SettingsScreenState.radios[1],
              ],
            ),
          ),
          Container(
            height: ScreenConstants.width * 0.225,
            child: Row(
              children: [
                SettingsScreenState.radios[2],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomRadio extends StatefulWidget {
  CustomRadio({
    super.key,
    required this.id,
    required this.color,
    required this.selected,
    required this.onTap,
  });

  final int id;
  final Color color;
  late Color selectedColor;
  bool selected;
  void Function(int id) onTap;

  @override
  State<StatefulWidget> createState() {
    return _CustomRadioState(
      id: id,
      color: color,
      selected: selected,
      onTap: onTap,
    );
  }
}

class _CustomRadioState extends State<CustomRadio> {
  _CustomRadioState({
    required this.id,
    required this.color,
    required this.selected,
    required this.onTap,
  });

  final int id;
  final Color color;
  late Color selectedColor;
  bool selected;
  void Function(int id) onTap;

  Widget build(BuildContext context) {
    selectedColor =
        selected ? Theme.of(context).colorScheme.outline : Colors.transparent;

    return InkWell(
      onTap: () {
        onTap(id);
      },
      child: Container(
        width: ScreenConstants.width * 0.225,
        height: ScreenConstants.width * 0.225,
        child: Center(
          child: Container(
            width: ScreenConstants.width * 0.2,
            height: ScreenConstants.width * 0.2,
            color: selectedColor,
            child: Center(
              child: Container(
                width: ScreenConstants.width * 0.18,
                height: ScreenConstants.width * 0.18,
                color: color,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
