import 'package:app/data/dummy/dummy_bryan.dart';
import 'package:app/widgets/booklist_screen/addbooklist_screen.dart';
import 'package:app/models/book.dart';
import 'package:app/models/booklist.dart';
import 'package:app/models/user.dart';
import 'package:app/widgets/booklist_screen/booklist_item.dart';
import 'package:app/widgets/booklist_screen/booklistdetails_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class BookListsScreen extends StatefulWidget {
  BookListsScreen({super.key});

  User? user = DummyBryan().userDummy;

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
      testList.add(bookList);
      widget.user?.createdBookLists.add(bookList);
    });
  }

  //test list

  final List<BookList> testList = [
    BookList(
        title: 'Read',
        subtitle: 'books you\'ve already read',
        color: Colors.blue),
    BookList(
        title: 'Reading',
        subtitle: 'books you\'re currently reading',
        color: Colors.yellow),
    BookList(
        title: 'Read',
        subtitle: 'books you\'ve already read',
        color: Color.fromARGB(255, 243, 94, 25)),
    BookList(
        title: 'Wants to read',
        subtitle: 'books you\'re planning to read',
        color: Color.fromARGB(255, 190, 214, 101)),
  ];

  var currentIndex = 0;

  //void updateIndex(index)

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
          margin: const EdgeInsets.all(15),
          child: Image.asset('assets/images/icons/icon_64px.png'),
          height: 32,
          width: 32,
        ),
        title: Title(
          color: Colors.black,
          child: Text(
            ' Your book-lists',
            style: GoogleFonts.lato(
              color: Colors.white,
              //fontSize: screenHeight * 0.0298,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                _openBooklistScreen();
              },
              icon: Icon(Icons.add))
        ],
      ),

      //show the lists
      //if there are less than 5 list we include the + button after the lists presentation
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
              shrinkWrap: true,
              itemCount: testList.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BookListDetailsScreen(
                                currentList: testList[index],
                              )));
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.04,
                      vertical: screenHeight * 0.009),
                  child: BookListItem(booklist: testList[index]),
                ),
              ),
            ),
          ),
          if (testList.length < 6)
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
