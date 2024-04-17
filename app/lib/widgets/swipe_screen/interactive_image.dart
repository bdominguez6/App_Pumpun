import 'package:app/controllers/database/bookList_service.dart';
import 'package:app/controllers/database/book_service.dart';
import 'package:app/data/dummy/dummy_brais.dart';
import 'package:app/models/book.dart';
import 'package:app/models/booklist.dart';
import 'package:app/models/enums.dart';
import 'package:app/widgets/swipe_screen/book_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class InteractiveImage extends StatelessWidget {
  InteractiveImage({super.key, required this.book, required this.controller});

  final Book book;
  CardSwiperController controller;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Book>>(
        future: BookService().getAllBooks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Return a loading indicator or some placeholder widget
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Handle error state
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            // Data is loaded, build your UI with the retrieved data
            List<Book> allBooks = [];
            for (var book in snapshot.data!) {
              allBooks.add(book);
            }
            return Scaffold(
              body: Expanded(
                child: CardSwiper(
                  controller: controller,
                  cardsCount: allBooks.length,
                  cardBuilder:
                      (context, index, percentThresholdX, percentThresholdY) {
                    return Container(
                        child: BookLayout(
                      book: allBooks[index],
                    ));
                  },
                  numberOfCardsDisplayed: 2,
                  onSwipe: (previousIndex, currentIndex, direction) {
                    //change the enum depends on the direction
                    if (direction == CardSwiperDirection.left) {
                      print('${allBooks[previousIndex].title} was disliked');
                      allBooks[previousIndex].record = Record.disliked;
                    }
                    if (direction == CardSwiperDirection.top) {
                      print('${allBooks[previousIndex].title} was skipped');
                      allBooks[previousIndex].record = Record.none;
                    }
                    if (direction == CardSwiperDirection.right) {
                      print('${allBooks[previousIndex].title} was liked');
                      allBooks[previousIndex].record = Record.liked;
                      //add the book to the user defaultLists[0]
                    }
                    if (direction == CardSwiperDirection.bottom) {
                      print(
                          '${allBooks[previousIndex].title} was mark as reading');
                      allBooks[previousIndex].record = Record.read;
                      //add the book to the user defaultLists[1]
                    }
                    return true;
                  },
                ),
              ),
            );
          }
        });
  }
}
