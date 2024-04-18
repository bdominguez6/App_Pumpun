import 'package:flutter/material.dart';

class DarkTheme{

  static Color primary = const Color.fromARGB(255, 15, 7, 0);
  static Color secondary = const Color.fromARGB(255, 55, 35, 15);
  static Color tertiary = const Color.fromARGB(255, 200, 100, 50);
  static Color outline = const Color.fromARGB(255, 255, 215, 175);
  static Color surface = const Color.fromARGB(255, 200, 170, 140);
  static Color background = const Color.fromARGB(255, 20, 10, 0);

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


