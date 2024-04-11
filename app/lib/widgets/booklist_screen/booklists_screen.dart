import 'package:app/data/dummy/dummy_david.dart';
import 'package:app/widgets/booklist_screen/addbooklist_screen.dart';
import 'package:app/models/booklist.dart';
import 'package:app/widgets/booklist_screen/booklist_item.dart';
import 'package:app/widgets/booklist_screen/booklistdetails_screen.dart';
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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      //appBar start
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.all(10),
          child: Image.asset('assets/images/icons/icon_64px.png'),
          height: 32,
          width: 32,
        ),
        title: Title(
          color: Colors.black,
          child: Text(
            ' Your book-lists',
            style: TextStyle(

              fontSize: 24,
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
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
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
                      horizontal: screenWidth * 0.04,
                      vertical: screenHeight * 0.009),
                  child: BookListItem(
                      booklist: widget.user!.allBookListsToShow[index]),
                ),
              ),
            ),
          ),
          //if there are less than 4 created list we include the + button after the lists presentation (to fill the empty space)
          if (widget.user!.createdBookLists.length < 4)
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.06),
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
