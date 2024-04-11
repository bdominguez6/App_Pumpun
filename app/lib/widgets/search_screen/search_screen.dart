import 'package:app/data/dummy/dummy_brais.dart';
import 'package:app/widgets/swipe_screen/interactive_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DummyBrais dummy = DummyBrais();
    List<Container> cards = [
      /// Image container
      Container(
        child: InteractiveImage(
          book: dummy.book1,
        ),
      ),

      /// Image container
      Container(
        child: InteractiveImage(
          book: dummy.book2,
        ),
      ),

      /// Image container
      Container(
        child: InteractiveImage(
          book: dummy.book3,
        ),
      ),

      /// Image container
      Container(
        child: InteractiveImage(
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
        ),
      ),
    );
  }
}
