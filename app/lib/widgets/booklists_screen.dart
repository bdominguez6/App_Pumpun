import 'package:app/models/book.dart';
import 'package:app/models/list.dart';
import 'package:app/widgets/booklist_item.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BookListsScreen extends StatefulWidget {
  const BookListsScreen({super.key});

  @override
  State<BookListsScreen> createState() {
    return _BookListsScreenState();
  }
}

class _BookListsScreenState extends State<BookListsScreen> {
  //test list
  final List<BookList> testList = [
    BookList(title: 'Read', subtitle: 'books you\'ve already read', books: [
      Book(title: '', cover: '', description: '', author: [''], genre: [''])
    ]),
    const BookList(
        title: 'Reading', subtitle: 'books you\'re currently reading')
  ];

  var currentIndex = 0;

  //void updateIndex(index)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),

      //show the lists
      //if there are less than 5 list we include the + button after the lists presentation
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
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
          if (testList.length < 5) ...[
            const Text('Create more lists'),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
            ),
          ]
        ],
      ),

      //bottom menu

      bottomNavigationBar: Container(
        color: Colors.black,
        child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: GNav(
              color: Colors.white,
              activeColor: Colors.amber,
              tabBackgroundColor: Color.fromARGB(255, 56, 55, 55),
              gap: 9,
              padding: EdgeInsets.all(16),
              //ontabchange
              tabs: [
                GButton(
                  icon: Icons.search,
                  text: 'Search',
                ),
                GButton(icon: Icons.bookmark, text: 'Lists'),
                GButton(icon: Icons.swap_calls, text: 'Swipe'),
                GButton(icon: Icons.person_2, text: 'Profile')
              ],
            )),
      ),
    );
  }
}
