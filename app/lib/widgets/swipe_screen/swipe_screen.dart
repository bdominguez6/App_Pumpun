import 'package:flutter/material.dart';

class SwipeScreen extends StatelessWidget {
  const SwipeScreen({super.key});
// TODO: si no funciona el swipe del video, hacerlo con Dismissible -> DismissDirection.horizontal, etc...
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Fondo transparente
        elevation: 0, // Deshabilitar el sombreado
        leading: Container(
          margin: const EdgeInsets.all(10),
          height: 32,
          width: 32,
          child: Image.asset('assets/images/icons/icon_64px.png'),
        ),
        title: Title(
          color: Colors.black,
          child: Text(
            'Discover Books',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        titleSpacing: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            // SECTION 1
            child: Container(
              color: Colors.black,
              child: Center(
                child: InteractiveImage(),
                // child: Image.asset('assets/images/covers/harry_potter1_cover.jpg'),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.green,
              child: const Center(
                child: Text('Sección 2'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InteractiveImage extends StatelessWidget {
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
