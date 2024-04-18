import 'package:app/controllers/common/myhomepage_controller.dart';
import 'package:app/controllers/common/shared_preferences_controller.dart';
import 'package:app/data/dummy/dummy_bryan.dart';
import 'package:flutter/material.dart';

import 'constants/screen_constants.dart';

void main() {
  DummyBryan();
  runApp(
    MaterialApp(
      title: 'Mi Aplicación',
      themeMode: ThemeMode.dark, // Modo de tema oscuro
      theme: ThemeData(
        fontFamily: 'Lato', // Fuente general
        colorScheme: ColorScheme.dark().copyWith(), // Paleta de colores general
        inputDecorationTheme: const InputDecorationTheme(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.amber,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.amber,
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePageController(),
    ),
  );
}
