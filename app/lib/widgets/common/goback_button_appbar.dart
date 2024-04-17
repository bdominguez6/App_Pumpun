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
      titleSpacing: 0,
      actions: [
        IconButton(
          onPressed: buttonMethod,
          icon: buttonIcon,
          color: Theme.of(context).colorScheme.outline,
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
