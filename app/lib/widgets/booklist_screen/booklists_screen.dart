import 'package:app/widgets/booklist_screen/addbooklist_screen.dart';
import 'package:app/models/book.dart';
import 'package:app/models/booklist.dart';
import 'package:app/models/user.dart';
import 'package:app/widgets/booklist_screen/booklist_item.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class BookListsScreen extends StatefulWidget {
  const BookListsScreen({super.key});

  @override
  State<BookListsScreen> createState() {
    return _BookListsScreenState();
  }
}

class _BookListsScreenState extends State<BookListsScreen> {
  void _openBooklistCreationModal() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      isDismissible: false,
      builder: (context) => AddBooklistScreen(
        onAddBooklist: _addBookList,
      ),
    );
  }

  void _addBookList(BookList bookList) {
    setState(() {
      testList.add(bookList);
      //user.bookLists.add(bookList);
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
    /*BookList(
        title: 'Read',
        subtitle: 'books you\'ve already read',
        books: [
          Book(
            title: '',
            cover: '',
            description: '',
            author: [''],
            genre: [''],
          ),
          Book(
            title: '',
            cover: '',
            description: '',
            author: [''],
            genre: [''],
          ),
        ],
        color: Colors.blue),
    BookList(
        title: 'Read',
        subtitle: 'books you\'ve already read',
        books: [
          Book(
            title: '',
            cover: '',
            description: '',
            author: [''],
            genre: [''],
          ),
          Book(
            title: '',
            cover: '',
            description: '',
            author: [''],
            genre: [''],
          ),
        ],
        color: const Color.fromARGB(255, 157, 194, 224)),
    BookList(
        title: 'Read',
        subtitle: 'books you\'ve already read',
        books: [
          Book(
            title: '',
            cover: '',
            description: '',
            author: [''],
            genre: [''],
          ),
          Book(
            title: '',
            cover: '',
            description: '',
            author: [''],
            genre: [''],
          ),
        ],
        color: Color.fromARGB(255, 68, 62, 3)),
    BookList(
        title: 'Read',
        subtitle: 'books you\'ve already read',
        books: [
          Book(
            title: '',
            cover: '',
            description: '',
            author: [''],
            genre: [''],
          ),
          Book(
            title: '',
            cover: '',
            description: '',
            author: [''],
            genre: [''],
          ),
        ],
        color: Color.fromARGB(255, 58, 196, 70)),
    BookList(
        title: 'Read',
        subtitle: 'books you\'ve already read',
        books: [
          Book(
            title: '',
            cover: '',
            description: '',
            author: [''],
            genre: [''],
          ),
          Book(
            title: '',
            cover: '',
            description: '',
            author: [''],
            genre: [''],
          ),
        ],
        color: const Color.fromARGB(255, 124, 132, 139)),
    BookList(
        title: 'Read',
        subtitle: 'books you\'ve already read',
        books: [
          Book(
            title: '',
            cover: '',
            description: '',
            author: [''],
            genre: [''],
          ),
          Book(
            title: '',
            cover: '',
            description: '',
            author: [''],
            genre: [''],
          ),
        ],
        color: Colors.blue),*/
  ];

  var currentIndex = 0;

  //void updateIndex(index)

  @override
  Widget build(BuildContext context) {
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
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                _openBooklistCreationModal();
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
              padding: const EdgeInsets.symmetric(vertical: 8),
              shrinkWrap: true,
              itemCount: testList.length,
              itemBuilder: (context, index) => GestureDetector(
                //TODO edit the onTap to open book details
                onTap: () {},
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: BookListItem(booklist: testList[index]),
                ),
              ),
            ),
          ),
          if (testList.length < 6)
            Padding(
              padding: EdgeInsets.all(40),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      _openBooklistCreationModal();
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
