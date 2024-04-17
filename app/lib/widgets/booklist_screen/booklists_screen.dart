import 'package:app/constants/screen_constants.dart';
import 'package:app/data/dummy/dummy_david.dart';
import 'package:app/widgets/booklist_screen/addbooklist_screen.dart';
import 'package:app/models/booklist.dart';
import 'package:app/widgets/booklist_screen/booklist_item.dart';
import 'package:app/widgets/booklist_screen/booklistdetails_screen.dart';
import 'package:app/widgets/common/main_button_appbar.dart';
import 'package:flutter/material.dart';

import '../../models/user.dart';
// TODO: hacer
//list of lists
class BookListsScreen extends StatefulWidget {
  BookListsScreen({super.key});

  //user created for testing this class
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

  void _addBookListAtPosition(int index, BookList bookList) {
    setState(() {
      widget.user!.createdBookLists.insert(index, bookList);
    });
  }

  void _deleteBookList(BookList bookList) {
    setState(() {
      int removedIndex = widget.user!.createdBookLists.indexOf(bookList);
      widget.user!.createdBookLists.remove(bookList);

      //we remove previous snack bars
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      //show a message to possibly undo the removing
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: Duration(seconds: 5),
          content: Text('${bookList.title} removed '),
          action: SnackBarAction(
            label: 'UNDO',
            onPressed: () {
              _addBookListAtPosition(removedIndex, bookList);
            },
          )));
    });
  }

  @override
  Widget build(BuildContext context) {
    List<BookList> allLists = widget.user!.getAllBookLists;

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
              itemCount: allLists.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookListDetailsScreen(
                            currentList: allLists[index],
                            onDeleteList: _deleteBookList),
                      ),
                    );
                  },
                  key: ValueKey(allLists[index]),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenConstants.width * 0.04,
                        vertical: ScreenConstants.height * 0.009),
                    child: BookListItem(booklist: allLists[index]),
                  ),
                );
              },
              onReorder: (int oldIndex, int newIndex) {
                setState(() {
                  if (oldIndex > 1 && newIndex > 1) {
                    if (newIndex > oldIndex) {
                      newIndex -= 1;
                    }
                    BookList value =
                        widget.user!.createdBookLists.removeAt(oldIndex - 2);
                    widget.user!.createdBookLists.insert(newIndex - 2, value);
                  } else {
                    //we remove previous snack bars
                    ScaffoldMessenger.of(context).removeCurrentSnackBar();
                    //show a message when you try to move a item
                    ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
                        duration: Duration(seconds: 3),
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
                  child: Text(
                    'Create more lists',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
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
