import 'package:app/constants/screen_constants.dart';
import 'package:app/data/dummy/dummy_brais.dart';
import 'package:app/models/book.dart';
import 'package:app/models/enums.dart';
import 'package:app/widgets/swipe_screen/interactive_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class SwipeScreen extends StatelessWidget {
  SwipeScreen({super.key});
// TODO: si no funciona el swipe del video, hacerlo con Dismissible -> DismissDirection.horizontal, etc...

  final CardSwiperController cardSwiperController = CardSwiperController();

  DummyBrais dummy = DummyBrais();
  List<Book> bookList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Fondo transparente
        elevation: 0, // Deshabilitar el sombreado
        leading: Container(
          margin: const EdgeInsets.all(10),
          height: 32,
          width: 32,
          child: Image.asset('assets/images/icons/icon_64px.png'),
        ),
        title: Title(
          color: Colors.black,
          child: const Text(
            'Discover Books',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        titleSpacing: 0,
      ),
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
      padding: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
      child: FloatingActionButton(
        onPressed: onAdd,
        shape: CircleBorder(),
        backgroundColor: Color.fromARGB(255, 205, 203, 203),
        elevation: 50,
        splashColor: Colors.amber,
        child: Icon(
          IconData(recordIcons[record]!, fontFamily: 'MaterialIcons'),
        ),
      ),
    );
  }
}
