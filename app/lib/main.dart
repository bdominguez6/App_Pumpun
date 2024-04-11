import 'package:app/constants/screen_constants.dart';
import 'package:app/controllers/common/myhomepage_controller.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Mi Aplicación',
      themeMode: ThemeMode.dark, // Modo de tema oscuro
      theme: ThemeData(
        fontFamily: 'Lato', // Fuente general
        colorScheme: ColorScheme.dark(), // Paleta de colores general
      ),
      home: MyHomePageController(),
    ),
  );
}
