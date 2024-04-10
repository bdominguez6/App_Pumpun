import 'package:app/data/dummy/dummy_bryan.dart';
import 'package:app/widgets/swipe_screen/interactive_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SwipeScreen extends StatelessWidget {
  SwipeScreen({super.key});
// TODO: si no funciona el swipe del video, hacerlo con Dismissible -> DismissDirection.horizontal, etc...

  DummyBryan dummy = DummyBryan();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

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
        children: [
          SizedBox(),
          InteractiveImage(
            screenWidth: screenWidth,
            screenHeight: screenHeight,
            book: dummy, //TODO: pasarle BOOKS ficticios y mostrarlos
          )
        ],
      ),
    );
  }
}
