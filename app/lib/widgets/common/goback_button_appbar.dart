import 'package:flutter/material.dart';

class GoBackButtonAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  GoBackButtonAppBar(
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
      leading: BackButton(),
      title: Text(title),
      titleSpacing: 0,
      actions: [IconButton(onPressed: buttonMethod, icon: buttonIcon)],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
