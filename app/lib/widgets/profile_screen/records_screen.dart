import 'package:app/constants/screen_constants.dart';
import 'package:app/widgets/common/goback_appbar.dart';
import 'package:app/widgets/profile_screen/empty_list_message.dart';
import 'package:app/widgets/profile_screen/scrollable_book_list.dart';
import 'package:flutter/material.dart';

import '../../data/common/configuration.dart';

class RecordsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GoBackAppBar(title: 'Records'),
      body: Configuration.user.records.books.isEmpty
          ? EmptyListMessage(
              width: ScreenConstants.width,
              height: ScreenConstants.height,
            )
          : Padding(
              padding:
                  EdgeInsets.fromLTRB(0, ScreenConstants.height * 0.05, 0, 0),
              child: ScrollableBookList(
                  width: ScreenConstants.width,
                  height: ScreenConstants.height * 0.78,
                  books: Configuration.user.records.books),
            ),
    );
  }
}
