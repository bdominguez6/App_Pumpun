import 'package:app/constants/screen_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  MainAppBar({super.key, required this.title});

  String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
        color: Theme.of(context).colorScheme.primary,
        child: Text(
          title,
          style: TextStyle(
            fontSize: ScreenConstants.height * 0.028,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.outline,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
