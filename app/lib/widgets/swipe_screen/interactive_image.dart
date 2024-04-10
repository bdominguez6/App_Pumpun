import 'package:flutter/material.dart';

class InteractiveImage extends StatelessWidget {
  const InteractiveImage(
      {super.key,
      required this.screenWidth,
      required this.screenHeight,
      required this.book});

  void _handleSwipe(DragUpdateDetails details) {
    // Obtener la dirección del desplazamiento
    double dx = details.delta.dx;
    double dy = details.delta.dy;

    if (dx.abs() > dy.abs()) {
      // Desplazamiento horizontal
      if (dx > 0) {
        // Desplazamiento hacia la derecha
        print('Desplazamiento hacia la derecha');
        // Ejecutar función específica
      } else {
        // Desplazamiento hacia la izquierda
        print('Desplazamiento hacia la izquierda');
        // Ejecutar función específica
      }
    } else {
      // Desplazamiento vertical
      if (dy > 0) {
        // Desplazamiento hacia abajo
        print('Desplazamiento hacia abajo');
        // Ejecutar función específica
      } else {
        // Desplazamiento hacia arriba
        print('Desplazamiento hacia arriba');
        // Ejecutar función específica
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _handleSwipe,
      child: Image.asset(
          'assets/images/covers/harry_potter1_cover.jpg'), // Cambia la ruta a tu imagen
    );
  }
}
