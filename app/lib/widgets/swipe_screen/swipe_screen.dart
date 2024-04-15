import 'package:app/constants/screen_constants.dart';
import 'package:app/data/dummy/dummy_brais.dart';
import 'package:app/models/book.dart';
import 'package:app/widgets/swipe_screen/interactive_image.dart';
import 'package:flutter/material.dart';

class SwipeScreen extends StatelessWidget {
  SwipeScreen({super.key});
// TODO: si no funciona el swipe del video, hacerlo con Dismissible -> DismissDirection.horizontal, etc...

  DummyBrais dummy = DummyBrais();
  List<Book> bookList = [];

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
          child: const Text(
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
        children: [
          /// Image container
          Expanded(
              child: InteractiveImage(
            book: dummy.book1,
          )),

          /// Button container
          Container(
            margin: EdgeInsets.only(top: ScreenConstants.height * 0.025),
            width: ScreenConstants.width * 0.92,
            height: ScreenConstants.height * 0.10,
            // margin: EdgeInsets.fromLTRB(0, screenHeight * 0.06, 0, 0),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 191, 0, 255),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text('Button container'),
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }
}
