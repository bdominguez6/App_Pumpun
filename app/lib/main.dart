import 'package:app/widgets/profile/profile_screen.dart';
import 'package:app/swipe_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Mi Aplicación',
      themeMode: ThemeMode.dark, // Modo de tema oscuro
      darkTheme: ThemeData.dark(), // Configuración del tema oscuro
      home: const SwipeScreen(),
    ),
  );
}
