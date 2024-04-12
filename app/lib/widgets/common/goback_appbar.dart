import 'package:app/constants/screen_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
