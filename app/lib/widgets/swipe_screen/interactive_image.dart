import 'package:app/data/dummy/dummy_brais.dart';
import 'package:app/models/book.dart';
import 'package:app/widgets/swipe_screen/book_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class InteractiveImage extends StatelessWidget {
  const InteractiveImage({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    DummyBrais dummy = DummyBrais();
    List<Container> cards = [
      /// Image container
      Container(
        child: BookLayout(
          book: dummy.book1,
        ),
      ),

      /// Image container
      Container(
        child: BookLayout(
          book: dummy.book2,
        ),
      ),

      /// Image container
      Container(
        child: BookLayout(
          book: dummy.book3,
        ),
      ),

      /// Image container
      Container(
        child: BookLayout(
          book: dummy.book4,
        ),
      ),
    ];

    return Scaffold(
      body: Expanded(
        child: CardSwiper(
          cardsCount: cards.length,
          cardBuilder: (context, index, percentThresholdX, percentThresholdY) =>
              cards[index],
          // allowedSwipeDirection:
          //     AllowedSwipeDirection.only(right: true, left: true),
          // isLoop: true,
          numberOfCardsDisplayed: 2,
          onSwipe: (previousIndex, currentIndex, direction) {
            if (direction == CardSwiperDirection.left) {
              print('disliked');
            }
            if (direction == CardSwiperDirection.top) {
              print('skipped');
            }
            if (direction == CardSwiperDirection.right) {
              print('liked');
            }
            if (direction == CardSwiperDirection.bottom) {
              print('reading');
            }
            return true;
          },
        ),
      ),
    );
  }
}
