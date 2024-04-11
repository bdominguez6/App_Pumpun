import 'package:app/data/dummy/dummy_bryan.dart';
import 'package:app/widgets/profile_screen/user_data.dart';
import 'package:flutter/material.dart';

import 'package:app/widgets/profile_screen/scrollable_book_list.dart';

import '../../models/book.dart';

/// Widget que muestra la pantalla del perfil de usuario.
///
/// Está compuesto por un [Scaffold] que muestra un [UserData] que contiene la
/// información principal del usuario, un [Container] con un texto y un
/// [TextButton] para acceder al historial y un [ScrollableBookList] con los últimos
/// libros que le han gustado.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    DummyBryan dummy = DummyBryan();
    // Coge los primeros 6 elementos de la lista de me gusta del usuario
    List<Book> likedBooks =
        DummyBryan().userDummy!.defaultBookLists[1].books.sublist(
              0,
              DummyBryan().userDummy!.defaultBookLists[1].books.length >= 6
                  ? 6
                  : DummyBryan().userDummy!.defaultBookLists[1].books.length,
            );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // Fondo transparente
        elevation: 0,
        // Deshabilitar el sombreado
        leading: Container(
          margin: const EdgeInsets.all(10),
          height: screenHeight * 0.036,
          width: screenWidth * 0.078,
          child: Image.asset('assets/images/icons/icon_64px.png'),
        ),
        title: Title(
          color: Colors.black,
          child: Text(
            'Profile',
            style: TextStyle(
              fontSize: screenHeight * 0.027,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        titleSpacing: 0,
      ),
      body: Column(
        children: [
          SizedBox(height: screenHeight * 0.025),
          UserData(
            screenWidth: screenWidth,
            screenHeight: screenHeight,
            user: dummy.userDummy!,
          ),
          SizedBox(height: screenHeight * 0.025),
          Container(
            width: screenWidth * 0.95,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Last Liked',
                  style: TextStyle(
                    fontSize: screenHeight * 0.04,
                  ),
                ),
                TextButton(
                  style: const ButtonStyle(
                      foregroundColor:
                          MaterialStatePropertyAll<Color>(Colors.amber)),
                  onPressed: () {},
                  child: Text(
                    'More...',
                    style: TextStyle(
                      fontSize: screenHeight * 0.02,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.0222),
          if (likedBooks.isNotEmpty)
            ScrollableBookList(
              width: screenWidth * 0.95,
              height: screenHeight * 0.4,
              books: likedBooks,
            ),
          if (likedBooks.isEmpty)
            SizedBox(
              width: screenWidth * 0.95,
              height: screenHeight * 0.4,
              child: Center(
                heightFactor: screenHeight * 0.02,
                child: Text(
                  'The \"Liked Books\" list is empty, go swipe some books!',
                  style: TextStyle(
                    fontSize: screenHeight * 0.02,
                    color: Color.fromARGB(100, 255, 255, 255),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
