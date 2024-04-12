import 'package:app/constants/screen_constants.dart';
import 'package:app/data/dummy/dummy_bryan.dart';
import 'package:app/widgets/profile_screen/empty_list_message.dart';
import 'package:app/widgets/profile_screen/scrollable_book_list.dart';
import 'package:flutter/material.dart';

class RecordsScreen extends StatelessWidget {
  DummyBryan dummy = DummyBryan();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text('Records'),
      ),
      body: dummy.user!.defaultBookLists[0].books.isEmpty
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
                  books: dummy.user!.defaultBookLists[0].books),
            ),
    );
  }
}
