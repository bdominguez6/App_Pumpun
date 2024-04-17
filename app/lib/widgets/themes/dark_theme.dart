import 'package:flutter/material.dart';

class DarkTheme{
  Color tertiary = Colors.amber.shade700;

  Color primary = const Color.fromARGB(255, 15, 10, 5);
  Color secondary = const Color.fromARGB(255, 55, 50, 45);
  Color outline = const Color.fromARGB(255, 255, 250, 245);
  Color surface = const Color.fromARGB(255, 195, 190, 185);
  Color background = const Color.fromARGB(255, 20, 15, 10);

  // Color primary = Colors.black;
  // Color secondary = const Color.fromARGB(255, 55, 55, 55);
  // Color outline = Colors.white;
  // Color surface = const Color.fromARGB(255, 190, 190, 190);
  // Color background = const Color.fromARGB(255, 20, 20, 20);

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
      textTheme: TextTheme().apply(
        bodyColor: outline,
        displayColor: outline,
        decorationColor: outline,
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


