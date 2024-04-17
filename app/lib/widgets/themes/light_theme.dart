import 'package:flutter/material.dart';

class LightTheme {
  // Color tertiary = const Color.fromARGB(255, 255, 0, 0); // red
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
  // Color primary = const Color.fromARGB(255, 255, 230, 230);
  // Color secondary = const Color.fromARGB(255, 225, 200, 200);
  // Color outline = const Color.fromARGB(255, 55, 0, 0);
  // Color surface = const Color.fromARGB(255, 70, 55, 55);
  // Color background = const Color.fromARGB(255, 235, 215, 215);

  // orange
  Color primary = const Color.fromARGB(255, 255, 240, 225);
  Color secondary = const Color.fromARGB(255, 235, 215, 195);
  Color outline = const Color.fromARGB(255, 70, 35, 0);
  Color surface = const Color.fromARGB(255, 70, 60, 50);
  Color background = const Color.fromARGB(255, 245, 230, 215);

  // yellow
  // Color primary = const Color.fromARGB(255, 255, 255, 220);
  // Color secondary = const Color.fromARGB(255, 225, 225, 185);
  // Color outline = const Color.fromARGB(255, 60, 60, 0);
  // Color surface = const Color.fromARGB(255, 75, 75, 45);
  // Color background = const Color.fromARGB(255, 235, 235, 205);

  // lime
  // Color primary = const Color.fromARGB(255, 240, 255, 225);
  // Color secondary = const Color.fromARGB(255, 215, 235, 195);
  // Color outline = const Color.fromARGB(255, 35, 70, 0);
  // Color surface = const Color.fromARGB(255, 60, 70, 50);
  // Color background = const Color.fromARGB(255, 230, 245, 215);

  // green
  // Color primary = const Color.fromARGB(255, 230, 255, 230);
  // Color secondary = const Color.fromARGB(255, 200, 225, 200);
  // Color outline = const Color.fromARGB(255, 0, 55, 0);
  // Color surface = const Color.fromARGB(255, 55, 70, 55);
  // Color background = const Color.fromARGB(255, 215, 235, 215);

  // teal
  // Color primary = const Color.fromARGB(255, 225, 255, 240);
  // Color secondary = const Color.fromARGB(255, 195, 235, 215);
  // Color outline = const Color.fromARGB(255, 0, 70, 35);
  // Color surface = const Color.fromARGB(255, 50, 70, 60);
  // Color background = const Color.fromARGB(255, 215, 245, 230);

  // aqua
  // Color primary = const Color.fromARGB(255, 220, 255, 255);
  // Color secondary = const Color.fromARGB(255, 185, 225, 225);
  // Color outline = const Color.fromARGB(255, 0, 60, 60);
  // Color surface = const Color.fromARGB(255, 45, 75, 75);
  // Color background = const Color.fromARGB(255, 205, 235, 235);

  // light blue
  // Color primary = const Color.fromARGB(255, 225, 240, 255);
  // Color secondary = const Color.fromARGB(255, 195, 215, 235);
  // Color outline = const Color.fromARGB(255, 0, 35, 70);
  // Color surface = const Color.fromARGB(255, 50, 60, 70);
  // Color background = const Color.fromARGB(255, 215, 230, 245);

  // blue
  // Color primary = const Color.fromARGB(255, 230, 230, 255);
  // Color secondary = const Color.fromARGB(255, 200, 200, 225);
  // Color outline = const Color.fromARGB(255, 0, 0, 55);
  // Color surface = const Color.fromARGB(255, 55, 55, 70);
  // Color background = const Color.fromARGB(255, 215, 215, 235);

  // lavender
  // Color primary = const Color.fromARGB(255, 240, 225, 255);
  // Color secondary = const Color.fromARGB(255, 215, 195, 235);
  // Color outline = const Color.fromARGB(255, 35, 0, 70);
  // Color surface = const Color.fromARGB(255, 60, 50, 70);
  // Color background = const Color.fromARGB(255, 230, 215, 245);

  // violet
  // Color primary = const Color.fromARGB(255, 255, 220, 255);
  // Color secondary = const Color.fromARGB(255, 225, 185, 225);
  // Color outline = const Color.fromARGB(255, 60, 0, 60);
  // Color surface = const Color.fromARGB(255, 75, 45, 75);
  // Color background = const Color.fromARGB(255, 235, 205, 235);

  // pink
  // Color primary = const Color.fromARGB(255, 255, 225, 240);
  // Color secondary = const Color.fromARGB(255, 235, 195, 215);
  // Color outline = const Color.fromARGB(255, 70, 0, 35);
  // Color surface = const Color.fromARGB(255, 70, 50, 60);
  // Color background = const Color.fromARGB(255, 245, 215, 230);

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
