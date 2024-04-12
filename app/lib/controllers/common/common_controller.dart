import 'package:app/widgets/common/book_profile_screen/book_profile_screen.dart';
import 'package:flutter/material.dart';

import '../../models/book.dart';

class CommonController {
  static void openBookProfileScreen({required BuildContext context, required Book book}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookProfileScreen(book: book,),
      ),
    );
  }
}
