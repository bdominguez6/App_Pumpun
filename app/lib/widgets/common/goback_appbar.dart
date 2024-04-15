import 'package:flutter/material.dart';

class GoBackAppBar extends StatelessWidget implements PreferredSizeWidget {
  GoBackAppBar({super.key, required this.title});

  String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: BackButton(),
      title: Text(title),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
