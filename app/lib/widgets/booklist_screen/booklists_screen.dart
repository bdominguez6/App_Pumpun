import 'package:app/constants/screen_constants.dart';
import 'package:app/data/dummy/dummy_david.dart';
import 'package:app/widgets/booklist_screen/addbooklist_screen.dart';
import 'package:app/models/booklist.dart';
import 'package:app/widgets/booklist_screen/booklist_item.dart';
import 'package:app/widgets/booklist_screen/booklistdetails_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
      appBar: AppBar(
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
            'Your book-lists',
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
                _openBooklistScreen();
              },
              icon: Icon(Icons.add))
        ],
      ),
      //show the lists
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
              child: /*ReorderableListView.builder(
              onReorder: (int oldIndex, int newIndex) {
                setState(() {
                  if (oldIndex > 1 && newIndex > 1) {
                    BookList value =
                        widget.user!.createdBookLists.removeAt(oldIndex - 2);
                    widget.user!.createdBookLists.insert(newIndex - 2, value);
                  } else {
                    Fluttertoast.showToast(
                        msg: 'You can\'t move default lists',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                });
              },
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BookListDetailsScreen(
                                currentList:
                                    widget.user!.allBookListsToShow[index],
                              )));
                },
                key: ValueKey(index),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenConstants.width * 0.04,
                      vertical: ScreenConstants.height * 0.009),
                  child: BookListItem(
                      booklist: widget.user!.allBookListsToShow[index]),
                ),
              ),
              itemCount: widget.user!.allBookListsToShow.length,
            ),*/
                  //TODO separate on other file
                  ListView(
            children: [
              /*ListView.builder(
                padding: EdgeInsets.symmetric(
                    vertical: ScreenConstants.height * 0.01),
                shrinkWrap: true,
                itemCount: widget.user!.allBookListsToShow.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BookListDetailsScreen(
                                  currentList:
                                      widget.user!.allBookListsToShow[index],
                                )));
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenConstants.width * 0.04,
                        vertical: ScreenConstants.height * 0.009),
                    child: BookListItem(
                        booklist: widget.user!.allBookListsToShow[index]),
                  ),
                ),
              ),*/
              ReorderableListView.builder(
                shrinkWrap: true,
                onReorder: (int oldIndex, int newIndex) {
                  setState(() {
                    if (oldIndex > 1 && newIndex > 1) {
                      BookList value =
                          widget.user!.createdBookLists.removeAt(oldIndex - 2);
                      widget.user!.createdBookLists.insert(newIndex - 2, value);
                    } else {
                      Fluttertoast.showToast(
                          msg: 'You can\'t move default lists',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  });
                },
                itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BookListDetailsScreen(
                                    currentList:
                                        widget.user!.allBookListsToShow[index],
                                  )));
                    },
                    key: ValueKey(index),
                    child: Dismissible(
                      key: ValueKey(index),
                      onDismissed: (direction) {
                        setState(() {
                          String itemDeleted = widget.user!.allBookListsToShow
                              .removeAt(index)
                              .title;
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('$itemDeleted dismissed')),
                          );
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenConstants.width * 0.04,
                            vertical: ScreenConstants.height * 0.009),
                        child: BookListItem(
                            booklist: widget.user!.allBookListsToShow[index]),
                      ),
                    )),
                itemCount: widget.user!.allBookListsToShow.length,
              ),
            ],
          )),
          //TODO: change the message to appear only at certain width
          //if there are less than 4 created list we include the + button after the lists presentation (to fill the empty space)
          if (widget.user!.createdBookLists.length < 4)
            Padding(
              padding: EdgeInsets.all(ScreenConstants.width * 0.06),
              child: Column(
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
            )
        ],
      ),
    );
  }
}
