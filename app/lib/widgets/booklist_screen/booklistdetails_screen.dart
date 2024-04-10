import 'package:app/models/booklist.dart';
import 'package:app/widgets/booklist_screen/book_item.dart';
import 'package:flutter/material.dart';

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
      body: Flexible(
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
