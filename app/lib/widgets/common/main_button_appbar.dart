import 'package:app/constants/screen_constants.dart';
import 'package:flutter/material.dart';

class MainButtonAppBar extends StatelessWidget implements PreferredSizeWidget {
  MainButtonAppBar(
      {super.key,
      required this.title,
      required this.buttonIcon,
      required this.buttonMethod});

  String title;
  Icon buttonIcon;
  Function() buttonMethod;

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
        color: Colors.black,
        child: Text(
          title,
          style: TextStyle(
            fontSize: ScreenConstants.height * 0.028,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      titleSpacing: 0,
      actions: [
        IconButton(
            onPressed: () {
              buttonMethod();
            },
            icon: buttonIcon)
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
