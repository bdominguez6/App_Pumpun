import 'package:app/widgets/common/myhomepage_controller.dart';
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
