import 'package:app/constants/screen_constants.dart';
import 'package:app/data/dummy/dummy_brais.dart';
import 'package:app/models/book.dart';
import 'package:app/models/enums.dart';
import 'package:app/widgets/common/main_appbar.dart';
import 'package:app/widgets/swipe_screen/interactive_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class SwipeScreen extends StatelessWidget {
  SwipeScreen({super.key});

// TODO: si no funciona el swipe del video, hacerlo con Dismissible -> DismissDirection.horizontal, etc...

  DummyBrais dummy = DummyBrais();
  List<Book> bookList = [];

  @override
  Widget build(BuildContext context) {
    CardSwiperController cardSwiperController = CardSwiperController();
    return Scaffold(
      appBar: MainAppBar(title: 'Discover Books'),
      body: Column(
        children: [
          // Image container
          Expanded(
              child: InteractiveImage(
            book: dummy.book1,
            controller: cardSwiperController,
          )),

          // Button container
          Container(
            margin: EdgeInsets.only(top: ScreenConstants.height * 0.025),
            width: ScreenConstants.width * 0.92,
            height: ScreenConstants.height * 0.10,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                swipeMenuItem(
                    record: Record.liked,
                    onAdd: () {
                      cardSwiperController.swipe(CardSwiperDirection.right);
                    }),
                swipeMenuItem(
                    record: Record.disliked,
                    onAdd: () {
                      cardSwiperController.swipe(CardSwiperDirection.left);
                    }),
                swipeMenuItem(
                    record: Record.read,
                    onAdd: () {
                      cardSwiperController.swipe(CardSwiperDirection.bottom);
                    }),
                swipeMenuItem(
                    record: Record.none,
                    onAdd: () {
                      cardSwiperController.swipe(CardSwiperDirection.top);
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class swipeMenuItem extends StatelessWidget {
  swipeMenuItem({super.key, required this.record, required this.onAdd});

  Record record;
  Function() onAdd;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: ScreenConstants.height * 0.05,
        left: ScreenConstants.width * 0.023,
        right: ScreenConstants.width * 0.023,
      ),
      child: FloatingActionButton(
        onPressed: onAdd,
        shape: CircleBorder(),
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        hoverColor: Colors.blue,
        splashColor: Theme.of(context).colorScheme.tertiary,
        child: Icon(
          IconData(
            recordIcons[record]!,
            fontFamily: 'MaterialIcons',
          ),
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
