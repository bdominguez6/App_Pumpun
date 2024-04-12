import 'package:app/constants/screen_constants.dart';
import 'package:app/data/dummy/dummy_bryan.dart';
import 'package:app/widgets/profile_screen/empty_list_message.dart';
import 'package:app/widgets/profile_screen/records_screen.dart';
import 'package:app/widgets/profile_screen/settings_screen.dart';
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

  void _openRecordsScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RecordsScreen(),
      ),
    );
  }

  void _openSettingsScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SettingsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    DummyBryan dummy = DummyBryan();
    // Coge los primeros 6 elementos de la lista de me gusta del usuario
    // List<Book> likedBooks = [];
    List<Book> likedBooks =
        DummyBryan().user!.defaultBookLists[1].books.sublist(
              0,
              DummyBryan().user!.defaultBookLists[1].books.length >= 6
                  ? 6
                  : DummyBryan().user!.defaultBookLists[1].books.length,
            );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // Fondo transparente
        elevation: 0,
        // Destabilizer el sombreado
        leading: Container(
          margin: const EdgeInsets.all(10),
          height: ScreenConstants.height * 0.03,
          width: ScreenConstants.width * 0.078,
          child: Image.asset('assets/images/icons/icon_64px.png'),
        ),
        title: Title(
          color: Colors.black,
          child: Text(
            'Profile',
            style: TextStyle(
              fontSize: ScreenConstants.height * 0.035,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        titleSpacing: 0,
        actions: [
          IconButton(
              onPressed: () {
                _openSettingsScreen(context);
              },
              icon: Icon(Icons.settings))
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: ScreenConstants.height * 0.02),
          UserData(
            width: ScreenConstants.width,
            height: ScreenConstants.height,
            user: dummy.user!,
          ),
          SizedBox(height: ScreenConstants.height * 0.02),
          Container(
            width: ScreenConstants.width * 0.95,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Last Liked',
                  style: TextStyle(
                    fontSize: ScreenConstants.height * 0.04,
                  ),
                ),
                TextButton(
                  style: const ButtonStyle(
                      foregroundColor:
                          MaterialStatePropertyAll<Color>(Colors.amber)),
                  onPressed: () {
                    _openRecordsScreen(context);
                  },
                  child: Text(
                    'More...',
                    style: TextStyle(
                      fontSize: ScreenConstants.height * 0.02,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: ScreenConstants.height * 0.02),
          if (likedBooks.isNotEmpty)
            ScrollableBookList(
              width: ScreenConstants.width * 0.95,
              height: ScreenConstants.height * 0.4,
              books: likedBooks,
            ),
          if (likedBooks.isEmpty)
            EmptyListMessage(
                width: ScreenConstants.width,
                height: ScreenConstants.height * 0.4),
        ],
      ),
    );
  }
}
