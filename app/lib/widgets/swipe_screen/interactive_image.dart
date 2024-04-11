import 'package:app/models/book.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// This class provide the whole interactive image.
class InteractiveImage extends StatelessWidget {
  const InteractiveImage(
      {super.key,
      required this.screenWidth,
      required this.screenHeight,
      required this.book});

  final double screenWidth;
  final double screenHeight;
  final Book book;

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
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Image section
            Container(
              // ignore: prefer_const_constructors
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(
                      20.0), // Radio de borde en la esquina inferior izquierda
                  topRight: Radius.circular(
                      20.0), // Radio de borde en la esquina inferior derecha
                ),
              ),
              padding: EdgeInsets.fromLTRB(0, screenHeight * 0.02, 0, 0),
              width: screenWidth * 0.65,
              // height: screenHeight * 0.60,
              child: Image.asset(book.cover),
            ),

            /// Book description section
            Container(
              decoration: const BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(
                      20.0), // Radio de borde en la esquina inferior izquierda
                  bottomRight: Radius.circular(
                      20.0), // Radio de borde en la esquina inferior derecha
                ),
              ),
              width: screenWidth * 0.65,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// Title
                  Container(
                    height: screenHeight * 0.05,
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text(
                      book.title,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth *
                        0.6, // Establece el ancho al máximo disponible
                    child: const Divider(
                      color: Colors.grey, // Color de la línea
                      thickness: 1, // Grosor de la línea
                      height: 20, // Altura de la línea
                    ),
                  ),

                  /// Author and genre
                  Container(
                    height: screenHeight * 0.05,
                    margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Row(
                      children: [
                        Container(
                          child: const Text(
                            'Author',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        Container(
                          child: const Text(
                            'Genre',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
