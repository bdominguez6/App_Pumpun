import 'package:app/constants/screen_constants.dart';
import 'package:app/models/booklist.dart';
import 'package:app/widgets/booklist_screen/book_item.dart';
import 'package:app/widgets/common/book_profile_screen/book_profile_screen.dart';
import 'package:app/widgets/common/goback_button_appbar.dart';
import 'package:flutter/material.dart';

//screen to show all the books of a list
class BookListDetailsScreen extends StatelessWidget {
  BookListDetailsScreen(
      {super.key, required this.currentList, required this.onDeleteList});

  final BookList currentList;
  final Function(BookList bookList) onDeleteList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GoBackButtonAppBar(
        title: currentList.title,
        buttonIcon: const Icon(Icons.delete),
        buttonMethod: () {
          onDeleteList(currentList);
          Navigator.pop(context);
        },
      ),
      //we check if the list has books. if not, we print a message
      body: currentList.books.isEmpty
          ? const Center(
              child: Text('Add new books to this list to be shown here'),
            )
          : Flexible(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(
                    vertical: ScreenConstants.height * 0.01),
                shrinkWrap: true,
                itemCount: currentList.books.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BookProfileScreen(
                                book: currentList.books[index])));
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenConstants.width * 0.04,
                        vertical: ScreenConstants.height * 0.009),
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
