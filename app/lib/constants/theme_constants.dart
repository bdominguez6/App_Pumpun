import 'package:app/widgets/themes/dark_theme.dart';
import 'package:flutter/material.dart';

import '../widgets/themes/light_theme.dart';

class ThemeConstants {

  static void changeToRed() {
    //Dark
    DarkTheme.primary = const Color.fromARGB(255, 20, 0, 0);
    DarkTheme.secondary = const Color.fromARGB(255, 60, 30, 30);
    DarkTheme.tertiary = const Color.fromARGB(255, 255, 0, 0);
    DarkTheme.outline = const Color.fromARGB(255, 255, 215, 215);
    DarkTheme.surface = const Color.fromARGB(255, 200, 170, 170);
    DarkTheme.background = const Color.fromARGB(255, 25, 0, 0);

    // Light
    LightTheme.primary = const Color.fromARGB(255, 255, 230, 230);
    LightTheme.secondary = const Color.fromARGB(255, 225, 200, 200);
    LightTheme.tertiary = const Color.fromARGB(255, 255, 0, 0);
    LightTheme.outline = const Color.fromARGB(255, 55, 0, 0);
    LightTheme.surface = const Color.fromARGB(255, 70, 55, 55);
    LightTheme.background = const Color.fromARGB(255, 235, 215, 215);
  }

  static void changeToOrange() {
    // Dark
    DarkTheme.primary = const Color.fromARGB(255, 15, 7, 0);
    DarkTheme.secondary = const Color.fromARGB(255, 55, 35, 15);
    DarkTheme.tertiary = const Color.fromARGB(255, 200, 100, 50);
    DarkTheme.outline = const Color.fromARGB(255, 255, 215, 175);
    DarkTheme.surface = const Color.fromARGB(255, 200, 170, 140);
    DarkTheme.background = const Color.fromARGB(255, 20, 10, 0);

    // Light
    LightTheme.primary = const Color.fromARGB(255, 255, 240, 225);
    LightTheme.secondary = const Color.fromARGB(255, 235, 215, 195);
    LightTheme.tertiary = const Color.fromARGB(255, 200, 100, 50);
    LightTheme.outline = const Color.fromARGB(255, 70, 35, 0);
    LightTheme.surface = const Color.fromARGB(255, 70, 60, 50);
    LightTheme.background = const Color.fromARGB(255, 245, 230, 215);
  }

  static void changeToYellow() {
    // Dark
    DarkTheme.primary = const Color.fromARGB(255, 20, 20, 0);
    DarkTheme.secondary = const Color.fromARGB(255, 50, 50, 30);
    DarkTheme.tertiary = const Color.fromARGB(255, 150, 150, 0);
    DarkTheme.outline = const Color.fromARGB(255, 255, 255, 195);
    DarkTheme.surface = const Color.fromARGB(255, 200, 200, 170);
    DarkTheme.background = const Color.fromARGB(255, 25, 25, 5);

    // Light
    LightTheme.primary = const Color.fromARGB(255, 255, 255, 220);
    LightTheme.secondary = const Color.fromARGB(255, 225, 225, 185);
    LightTheme.tertiary = const Color.fromARGB(255, 150, 150, 0);
    LightTheme.outline = const Color.fromARGB(255, 60, 60, 0);
    LightTheme.surface = const Color.fromARGB(255, 75, 75, 45);
    LightTheme.background = const Color.fromARGB(255, 235, 235, 205);
  }

  static void changeToLime() {
    // Dark
    DarkTheme.primary = const Color.fromARGB(255, 7, 15, 0);
    DarkTheme.secondary = const Color.fromARGB(255, 35, 55, 15);
    DarkTheme.tertiary = const Color.fromARGB(255, 100, 200, 0);
    DarkTheme.outline = const Color.fromARGB(255, 215, 255, 175);
    DarkTheme.surface = const Color.fromARGB(255, 170, 200, 140);
    DarkTheme.background = const Color.fromARGB(255, 10, 20, 0);

    // Light
    LightTheme.primary = const Color.fromARGB(255, 240, 255, 225);
    LightTheme.secondary = const Color.fromARGB(255, 215, 235, 195);
    LightTheme.tertiary = const Color.fromARGB(255, 100, 200, 0);
    LightTheme.outline = const Color.fromARGB(255, 35, 70, 0);
    LightTheme.surface = const Color.fromARGB(255, 60, 70, 50);
    LightTheme.background = const Color.fromARGB(255, 230, 245, 215);
  }

  static void changeToGreen() {
    // Dark
    DarkTheme.primary = const Color.fromARGB(255, 0, 20, 0);
    DarkTheme.secondary = const Color.fromARGB(255, 30, 60, 30);
    DarkTheme.tertiary = const Color.fromARGB(255, 0, 200, 0);
    DarkTheme.outline = const Color.fromARGB(255, 215, 255, 215);
    DarkTheme.surface = const Color.fromARGB(255, 170, 210, 170);
    DarkTheme.background = const Color.fromARGB(255, 0, 20, 0);

    // Light
    LightTheme.primary = const Color.fromARGB(255, 230, 255, 230);
    LightTheme.secondary = const Color.fromARGB(255, 200, 225, 200);
    LightTheme.tertiary = const Color.fromARGB(255, 0, 200, 0);
    LightTheme.outline = const Color.fromARGB(255, 0, 55, 0);
    LightTheme.surface = const Color.fromARGB(255, 55, 70, 55);
    LightTheme.background = const Color.fromARGB(255, 215, 235, 215);
  }

  static void changeToTeal() {
    // Dark
    DarkTheme.primary = const Color.fromARGB(255, 0, 15, 7);
    DarkTheme.secondary = const Color.fromARGB(255, 15, 55, 35);
    DarkTheme.tertiary = const Color.fromARGB(255, 0, 200, 100);
    DarkTheme.outline = const Color.fromARGB(255, 175, 255, 215);
    DarkTheme.surface = const Color.fromARGB(255, 140, 200, 170);
    Color background = const Color.fromARGB(255, 0, 20, 10);

    // Light
    LightTheme.primary = const Color.fromARGB(255, 225, 255, 240);
    LightTheme.secondary = const Color.fromARGB(255, 195, 235, 215);
    LightTheme.tertiary = const Color.fromARGB(255, 0, 200, 100);
    LightTheme.outline = const Color.fromARGB(255, 0, 70, 35);
    LightTheme.surface = const Color.fromARGB(255, 50, 70, 60);
    LightTheme.background = const Color.fromARGB(255, 215, 245, 230);
  }

  static void changeToAqua() {
    // Dark
    DarkTheme.primary = const Color.fromARGB(255, 0, 20, 20);
    DarkTheme.secondary = const Color.fromARGB(255, 30, 50, 50);
    DarkTheme.tertiary = const Color.fromARGB(255, 0, 175, 175);
    DarkTheme.outline = const Color.fromARGB(255, 195, 255, 255);
    DarkTheme.surface = const Color.fromARGB(255, 170, 200, 200);
    DarkTheme.background = const Color.fromARGB(255, 5, 25, 25);

    // Light
    LightTheme.primary = const Color.fromARGB(255, 220, 255, 255);
    LightTheme.secondary = const Color.fromARGB(255, 185, 225, 225);
    LightTheme.tertiary = const Color.fromARGB(255, 0, 175, 175);
    LightTheme.outline = const Color.fromARGB(255, 0, 60, 60);
    LightTheme.surface = const Color.fromARGB(255, 45, 75, 75);
    LightTheme.background = const Color.fromARGB(255, 205, 235, 235);
  }

  static void changeToLightBlue() {
    // Dark
    DarkTheme.primary = const Color.fromARGB(255, 0, 7, 15);
    DarkTheme.secondary = const Color.fromARGB(255, 15, 35, 55);
    DarkTheme.tertiary = const Color.fromARGB(255, 0, 100, 200);
    DarkTheme.outline = const Color.fromARGB(255, 175, 215, 255);
    DarkTheme.surface = const Color.fromARGB(255, 140, 170, 200);
    DarkTheme.background = const Color.fromARGB(255, 0, 10, 20);

    // Light
    LightTheme.primary = const Color.fromARGB(255, 225, 240, 255);
    LightTheme.secondary = const Color.fromARGB(255, 195, 215, 235);
    LightTheme.tertiary = const Color.fromARGB(255, 0, 100, 200);
    LightTheme.outline = const Color.fromARGB(255, 0, 35, 70);
    LightTheme.surface = const Color.fromARGB(255, 50, 60, 70);
    LightTheme.background = const Color.fromARGB(255, 215, 230, 245);
  }

  static void changeToBlue() {
    // Dark
    DarkTheme.primary = const Color.fromARGB(255, 0, 0, 20);
    DarkTheme.secondary = const Color.fromARGB(255, 30, 30, 60);
    DarkTheme.tertiary = const Color.fromARGB(255, 50, 50, 255);
    DarkTheme.outline = const Color.fromARGB(255, 215, 215, 255);
    DarkTheme.surface = const Color.fromARGB(255, 170, 170, 210);
    DarkTheme.background = const Color.fromARGB(255, 0, 0, 20);

    // Light
    LightTheme.primary = const Color.fromARGB(255, 230, 230, 255);
    LightTheme.secondary = const Color.fromARGB(255, 200, 200, 225);
    LightTheme.tertiary = const Color.fromARGB(255, 50, 50, 255);
    LightTheme.outline = const Color.fromARGB(255, 0, 0, 55);
    LightTheme.surface = const Color.fromARGB(255, 55, 55, 70);
    LightTheme.background = const Color.fromARGB(255, 215, 215, 235);
  }

  static void changeToLavender() {
    // Dark
    DarkTheme.primary = const Color.fromARGB(255, 7, 0, 15);
    DarkTheme.secondary = const Color.fromARGB(255, 35, 15, 55);
    DarkTheme.tertiary = const Color.fromARGB(255, 100, 50, 200);
    DarkTheme.outline = const Color.fromARGB(255, 215, 175, 255);
    DarkTheme.surface = const Color.fromARGB(255, 170, 140, 200);
    DarkTheme.background = const Color.fromARGB(255, 10, 0, 20);

    // Light
    LightTheme.primary = const Color.fromARGB(255, 240, 225, 255);
    LightTheme.secondary = const Color.fromARGB(255, 215, 195, 235);
    LightTheme.tertiary = const Color.fromARGB(255, 100, 50, 200);
    LightTheme.outline = const Color.fromARGB(255, 35, 0, 70);
    LightTheme.surface = const Color.fromARGB(255, 60, 50, 70);
    LightTheme.background = const Color.fromARGB(255, 230, 215, 245);
  }

  static void changeToViolet() {
    // Dark
    DarkTheme.primary = const Color.fromARGB(255, 20, 0, 20);
    DarkTheme.secondary = const Color.fromARGB(255, 50, 30, 50);
    DarkTheme.tertiary = const Color.fromARGB(255, 175, 0, 175);
    DarkTheme.outline = const Color.fromARGB(255, 255, 195, 255);
    DarkTheme.surface = const Color.fromARGB(255, 200, 170, 200);
    DarkTheme.background = const Color.fromARGB(255, 25, 5, 25);

    // Light
    LightTheme.primary = const Color.fromARGB(255, 255, 220, 255);
    LightTheme.secondary = const Color.fromARGB(255, 225, 185, 225);
    LightTheme.tertiary = const Color.fromARGB(255, 175, 0, 175);
    LightTheme.outline = const Color.fromARGB(255, 60, 0, 60);
    LightTheme.surface = const Color.fromARGB(255, 75, 45, 75);
    LightTheme.background = const Color.fromARGB(255, 235, 205, 235);
  }

  static void changeToPink() {
    // Dark
    DarkTheme.primary = const Color.fromARGB(255, 15, 0, 7);
    DarkTheme.secondary = const Color.fromARGB(255, 55, 15, 35);
    DarkTheme.tertiary = const Color.fromARGB(255, 200, 50, 100);
    DarkTheme.outline = const Color.fromARGB(255, 255, 175, 215);
    DarkTheme.surface = const Color.fromARGB(255, 200, 140, 170);
    DarkTheme.background = const Color.fromARGB(255, 20, 0, 10);

    // Light
    LightTheme.primary = const Color.fromARGB(255, 255, 225, 240);
    LightTheme.secondary = const Color.fromARGB(255, 235, 195, 215);
    LightTheme.tertiary = const Color.fromARGB(255, 200, 50, 100);
    LightTheme.outline = const Color.fromARGB(255, 70, 0, 35);
    LightTheme.surface = const Color.fromARGB(255, 70, 50, 60);
    LightTheme.background = const Color.fromARGB(255, 245, 215, 230);
  }
}