import 'package:app/constants/screen_constants.dart';
import 'package:app/data/dummy/dummy_david.dart';
import 'package:app/widgets/booklist_screen/addbooklist_screen.dart';
import 'package:app/models/booklist.dart';
import 'package:app/widgets/booklist_screen/booklist_item.dart';
import 'package:app/widgets/booklist_screen/booklistdetails_screen.dart';
import 'package:app/widgets/common/main_button_appbar.dart';
import 'package:flutter/material.dart';

import '../../models/user.dart';

//list of lists
class BookListsScreen extends StatefulWidget {
  BookListsScreen({super.key});

  User? user = DummyDavid().userDummy;

  @override
  State<BookListsScreen> createState() {
    return _BookListsScreenState();
  }
}

class _BookListsScreenState extends State<BookListsScreen> {
  void _openBooklistScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                AddBooklistScreen(onAddBooklist: _addBookList)));
  }

  void _addBookList(BookList bookList) {
    setState(() {
      widget.user!.createdBookLists.add(bookList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //appBar start
      appBar: MainButtonAppBar(
          title: 'Your book-lists',
          buttonIcon: Icon(Icons.add),
          buttonMethod: _openBooklistScreen),

      //show the lists
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            //reordable list that has two parts: the default list (inmutable) and the other list ()
            child: ReorderableListView.builder(
              itemCount: widget.user!.allBookListsToShow.length,
              itemBuilder: (context, index) {
                if (index < widget.user!.defaultBookLists.length) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BookListDetailsScreen(
                                    currentList:
                                        widget.user!.allBookListsToShow[index],
                                  )));
                    },
                    key: ValueKey(widget.user!.allBookListsToShow[index]),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenConstants.width * 0.04,
                          vertical: ScreenConstants.height * 0.009),
                      child: BookListItem(
                          booklist: widget.user!.allBookListsToShow[index]),
                    ),
                  );
                } else {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BookListDetailsScreen(
                                    currentList: widget
                                        .user!.createdBookLists[index - 2],
                                  )));
                    },
                    key: ValueKey(widget.user!.createdBookLists[index - 2]),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenConstants.width * 0.04,
                          vertical: ScreenConstants.height * 0.009),
                      child: BookListItem(
                          booklist: widget.user!.allBookListsToShow[index]),
                    ),
                  );
                }
              },
              onReorder: (int oldIndex, int newIndex) {
                setState(() {
                  if (oldIndex > 1 && newIndex > 1) {
                    BookList value =
                        widget.user!.createdBookLists.removeAt(oldIndex - 2);
                    widget.user!.createdBookLists.insert(newIndex - 2, value);
                  } else {
                    //show a message when you try to move a item
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Can\'t reorder the default lists')));
                  }
                });
              },
            ),
          ),

          //TODO: change the message to appear only at certain width
          //if there are less than 4 created list we include the + button after the lists presentation (to fill the empty space)
          if (widget.user!.createdBookLists.length < 4)
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    _openBooklistScreen();
                  },
                  child: const Text(
                    'Create more lists',
                    style: TextStyle(
                      color: Colors.amber,
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
