import 'package:flutter/material.dart';

class LightTheme {
  Color tertiary = Colors.amber.shade700;

  Color primary = const Color.fromARGB(255, 255, 250, 245);
  Color secondary = const Color.fromARGB(255, 225, 220, 215);
  Color outline = const Color.fromARGB(255, 30, 20, 10);
  Color surface = const Color.fromARGB(255, 70, 65, 60);
  Color background = const Color.fromARGB(255, 240, 235, 230);

  // Color primary = Colors.white;
  // Color secondary = const Color.fromARGB(255, 190, 190, 190);
  // Color outline = Colors.black;
  // Color surface = const Color.fromARGB(255, 65, 65, 65);
  // Color background = const Color.fromARGB(255, 235, 235, 235);

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
