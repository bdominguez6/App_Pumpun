import 'package:app/constants/screen_constants.dart';
import 'package:app/constants/theme_constants.dart';
import 'package:app/controllers/settings_controller.dart';
import 'package:app/data/common/configuration.dart';
import 'package:app/data/dummy/dummy_bryan.dart';
import 'package:app/widgets/common/main_button_appbar.dart';
import 'package:app/widgets/profile_screen/empty_list_message.dart';
import 'package:app/widgets/profile_screen/records_screen.dart';
import 'package:app/widgets/profile_screen/settings_screen.dart';
import 'package:app/widgets/profile_screen/user_data.dart';
import 'package:flutter/material.dart';

import 'package:app/widgets/profile_screen/scrollable_book_list.dart';

import '../../controllers/common/shared_preferences_controller.dart';
import '../../models/book.dart';

/// Widget que muestra la pantalla del perfil de usuario.
///
/// Está compuesto por un [Scaffold] que muestra un [UserData] que contiene la
/// información principal del usuario, un [Container] con un texto y un
/// [TextButton] para acceder al historial y un [ScrollableBookList] con los últimos
/// libros que le han gustado.
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({required this.onChangeSettings});

  final void Function(BuildContext context) onChangeSettings;

  @override
  State<ProfileScreen> createState() {
    return _ProfileScreenState();
  }
}

class _ProfileScreenState extends State<ProfileScreen> {
  final SettingsController settingsController = SettingsController();

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
        builder: (context) => SettingsScreen(
          controller: settingsController,
          onChangeSettings: widget.onChangeSettings,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Coge los primeros 6 elementos de la lista de me gusta del usuario
    // List<Book> likedBooks = [];
    List<Book> likedBooks =
        Configuration.user.defaultBookLists[0].books.sublist(
      0,
      Configuration.user.defaultBookLists[0].books.length >= 6
          ? 6
          : Configuration.user.defaultBookLists[0].books.length,
    );

    return Scaffold(
      appBar: MainButtonAppBar(
        title: 'Profile',
        buttonIcon: Icon(Icons.settings),
        buttonMethod: () => _openSettingsScreen(context),
      ),
      body: Column(
        children: [
          SizedBox(height: ScreenConstants.height * 0.02),
          UserData(
            width: ScreenConstants.width,
            height: ScreenConstants.height,
            user: Configuration.user,
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
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
                TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStatePropertyAll<Color>(
                        Theme.of(context).colorScheme.tertiary),
                  ),
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
