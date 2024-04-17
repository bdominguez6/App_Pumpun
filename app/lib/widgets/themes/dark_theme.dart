import 'package:flutter/material.dart';

class DarkTheme{

  // Color tertiary = const Color.fromARGB(255, 255, 0, 0); // red
  // Color tertiary = const Color.fromARGB(255, 255, 160, 0); // amber
  Color tertiary = const Color.fromARGB(255, 200, 100, 50); // orange
  // Color tertiary = const Color.fromARGB(255, 150, 150, 0); // yellow
  // Color tertiary = const Color.fromARGB(255, 100, 200, 0); // lime
  // Color tertiary = const Color.fromARGB(255, 0, 200, 0); // green
  // Color tertiary = const Color.fromARGB(255, 0, 200, 100); // teal
  // Color tertiary = const Color.fromARGB(255, 0, 175, 175); // aqua
  // Color tertiary = const Color.fromARGB(255, 0, 100, 200); // light blue
  // Color tertiary = const Color.fromARGB(255, 50, 50, 255); // blue
  // Color tertiary = const Color.fromARGB(255, 100, 50, 200); // lavender
  // Color tertiary = const Color.fromARGB(255, 175, 0, 175); // violet
  // Color tertiary = const Color.fromARGB(255, 200, 50, 100); // pink


  // red
  // Color primary = const Color.fromARGB(255, 20, 0, 0);
  // Color secondary = const Color.fromARGB(255, 60, 30, 30);
  // Color outline = const Color.fromARGB(255, 255, 215, 215);
  // Color surface = const Color.fromARGB(255, 200, 170, 170);
  // Color background = const Color.fromARGB(255, 25, 0, 0);

  // orange
  Color primary = const Color.fromARGB(255, 15, 7, 0);
  Color secondary = const Color.fromARGB(255, 55, 35, 15);
  Color outline = const Color.fromARGB(255, 255, 215, 175);
  Color surface = const Color.fromARGB(255, 200, 170, 140);
  Color background = const Color.fromARGB(255, 20, 10, 0);

  // yellow
  // Color primary = const Color.fromARGB(255, 20, 20, 0);
  // Color secondary = const Color.fromARGB(255, 50, 50, 30);
  // Color outline = const Color.fromARGB(255, 255, 255, 195);
  // Color surface = const Color.fromARGB(255, 200, 200, 170);
  // Color background = const Color.fromARGB(255, 25, 25, 5);

  // lime
  // Color primary = const Color.fromARGB(255, 7, 15, 0);
  // Color secondary = const Color.fromARGB(255, 35, 55, 15);
  // Color outline = const Color.fromARGB(255, 215, 255, 175);
  // Color surface = const Color.fromARGB(255, 170, 200, 140);
  // Color background = const Color.fromARGB(255, 10, 20, 0);

  // green
  // Color primary = const Color.fromARGB(255, 0, 20, 0);
  // Color secondary = const Color.fromARGB(255, 30, 60, 30);
  // Color outline = const Color.fromARGB(255, 215, 255, 215);
  // Color surface = const Color.fromARGB(255, 170, 210, 170);
  // Color background = const Color.fromARGB(255, 0, 20, 0);

  // teal
  // Color primary = const Color.fromARGB(255, 0, 15, 7);
  // Color secondary = const Color.fromARGB(255, 15, 55, 35);
  // Color outline = const Color.fromARGB(255, 175, 255, 215);
  // Color surface = const Color.fromARGB(255, 140, 200, 170);
  // Color background = const Color.fromARGB(255, 0, 20, 10);

  // aqua
  // Color primary = const Color.fromARGB(255, 0, 20, 20);
  // Color secondary = const Color.fromARGB(255, 30, 50, 50);
  // Color outline = const Color.fromARGB(255, 195, 255, 255);
  // Color surface = const Color.fromARGB(255, 170, 200, 200);
  // Color background = const Color.fromARGB(255, 5, 25, 25);

  // light blue
  // Color primary = const Color.fromARGB(255, 0, 7, 15);
  // Color secondary = const Color.fromARGB(255, 15, 35, 55);
  // Color outline = const Color.fromARGB(255, 175, 215, 255);
  // Color surface = const Color.fromARGB(255, 140, 170, 200);
  // Color background = const Color.fromARGB(255, 0, 10, 20);

  // blue
  // Color primary = const Color.fromARGB(255, 0, 0, 20);
  // Color secondary = const Color.fromARGB(255, 30, 30, 60);
  // Color outline = const Color.fromARGB(255, 215, 215, 255);
  // Color surface = const Color.fromARGB(255, 170, 170, 210);
  // Color background = const Color.fromARGB(255, 0, 0, 20);

  // lavender
  // Color primary = const Color.fromARGB(255, 7, 0, 15);
  // Color secondary = const Color.fromARGB(255, 35, 15, 55);
  // Color outline = const Color.fromARGB(255, 215, 175, 255);
  // Color surface = const Color.fromARGB(255, 170, 140, 200);
  // Color background = const Color.fromARGB(255, 10, 0, 20);

  // violet
  // Color primary = const Color.fromARGB(255, 20, 0, 20);
  // Color secondary = const Color.fromARGB(255, 50, 30, 50);
  // Color outline = const Color.fromARGB(255, 255, 195, 255);
  // Color surface = const Color.fromARGB(255, 200, 170, 200);
  // Color background = const Color.fromARGB(255, 25, 5, 25);

  // pink
  // Color primary = const Color.fromARGB(255, 15, 0, 7);
  // Color secondary = const Color.fromARGB(255, 55, 15, 35);
  // Color outline = const Color.fromARGB(255, 255, 175, 215);
  // Color surface = const Color.fromARGB(255, 200, 140, 170);
  // Color background = const Color.fromARGB(255, 20, 0, 10);

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


