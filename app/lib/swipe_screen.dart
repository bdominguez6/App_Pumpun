import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

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
            style: GoogleFonts.lato(
              color: Colors.white,
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
      bottomNavigationBar: Container(
        color: Colors.black,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: GNav(
            color: Colors.white,
            activeColor: Colors.amber,
            tabBackgroundColor: Color.fromARGB(255, 56, 55, 55),
            gap: 9,
            padding: EdgeInsets.all(16),
            //ontabchange
            tabs: [
              GButton(
                icon: Icons.search,
                text: 'Search',
              ),
              GButton(icon: Icons.bookmark, text: 'Lists'),
              GButton(icon: Icons.swap_calls, text: 'Swipe'),
              GButton(icon: Icons.person_2, text: 'Profile')
            ],
          ),
        ),
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
