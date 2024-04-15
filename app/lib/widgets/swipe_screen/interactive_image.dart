import 'package:app/data/dummy/dummy_brais.dart';
import 'package:app/models/book.dart';
import 'package:app/models/enums.dart';
import 'package:app/widgets/swipe_screen/book_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class InteractiveImage extends StatelessWidget {
  const InteractiveImage(
      {super.key, required this.book, required this.controller});

  final Book book;
  final CardSwiperController controller;

  @override
  Widget build(BuildContext context) {
    //testing list to show some books
    DummyBrais dummy = DummyBrais();
    List<Book> allBooks = [dummy.book1, dummy.book2, dummy.book3, dummy.book4];

    return Scaffold(
      body: Expanded(
        child: CardSwiper(
          controller: controller,
          cardsCount: allBooks.length,
          cardBuilder: (context, index, percentThresholdX, percentThresholdY) {
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
              allBooks[previousIndex].icon = recordIcons[Record.disliked]!;
            }
            if (direction == CardSwiperDirection.top) {
              print('${allBooks[previousIndex].title} was skipped');
              allBooks[previousIndex].record = Record.none;
              allBooks[previousIndex].icon = recordIcons[Record.none]!;
            }
            if (direction == CardSwiperDirection.right) {
              print('${allBooks[previousIndex].title} was liked');
              allBooks[previousIndex].record = Record.liked;
              allBooks[previousIndex].icon = recordIcons[Record.liked]!;
              //add the book to the user defaultLists[0]
            }
            if (direction == CardSwiperDirection.bottom) {
              print('${allBooks[previousIndex].title} was mark as reading');
              allBooks[previousIndex].record = Record.read;
              allBooks[previousIndex].icon = recordIcons[Record.read]!;
              //add the book to the user defaultLists[1]
            }
            return true;
          },
        ),
      ),
    );
  }
}
