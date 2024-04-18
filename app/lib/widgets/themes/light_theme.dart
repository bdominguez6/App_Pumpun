import 'package:flutter/material.dart';

class LightTheme {

  static Color primary = const Color.fromARGB(255, 255, 240, 225);
  static Color secondary = const Color.fromARGB(255, 235, 215, 195);
  static Color tertiary = const Color.fromARGB(255, 200, 100, 50);
  static Color outline = const Color.fromARGB(255, 70, 35, 0);
  static Color surface = const Color.fromARGB(255, 70, 60, 50);
  static Color background = const Color.fromARGB(255, 245, 230, 215);

  ThemeData get materialTheme {
    return ThemeData(
      // Fuente general
      fontFamily: 'Lato',
      // Paleta de colores general
      colorScheme: const ColorScheme.dark().copyWith(
        primary: primary,
        secondary: secondary,
        tertiary: tertiary,
        outline: outline,
        surface: surface,
        background: background,
      ),
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: tertiary,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: tertiary,
          ),
        ),
      ),
    );
  }
}
