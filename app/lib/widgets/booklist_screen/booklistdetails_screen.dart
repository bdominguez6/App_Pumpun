import 'package:app/models/booklist.dart';
import 'package:app/widgets/booklist_screen/book_item.dart';
import 'package:flutter/material.dart';

//screen to show all the books of a list
class BookListDetailsScreen extends StatelessWidget {
  BookListDetailsScreen({super.key, required this.currentList});

  final BookList currentList;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text(currentList.title),
      ),
      //we check if the list has books. if not, we print a message
      body: currentList.books.isEmpty
          ? Center(
              child: Text('Add new books to this list to be shown here'),
            )
          : Flexible(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                shrinkWrap: true,
                itemCount: currentList.books.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    //TODO call the book prophile screen when a book is tapped);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.04,
                        vertical: screenHeight * 0.009),
                    child: BookItem(
                      book: currentList.books[index],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
