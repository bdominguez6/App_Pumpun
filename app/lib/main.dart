import 'package:app/controllers/common/myhomepage_controller.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Mi Aplicación',
      themeMode: ThemeMode.dark, // Modo de tema oscuro
      darkTheme: ThemeData.dark(), // Configuración del tema oscuro
      home: MyHomePageController(),
    ),
  );
}
