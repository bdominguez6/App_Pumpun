import 'package:flutter/material.dart';

class GoBackAppBar extends StatelessWidget implements PreferredSizeWidget {
  GoBackAppBar({super.key, required this.title});

  String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: BackButton(
        color: Theme.of(context).colorScheme.outline,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Theme.of(context).colorScheme.outline,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
