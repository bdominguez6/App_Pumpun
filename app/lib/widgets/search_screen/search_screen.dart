import 'package:app/data/dummy/dummy_brais.dart';
import 'package:app/widgets/swipe_screen/book_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Search Screen', style: TextStyle(
        color: Theme.of(context).colorScheme.outline,
      ),),
    );
  }
}
