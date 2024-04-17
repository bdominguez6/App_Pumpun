import 'package:app/constants/screen_constants.dart';
import 'package:app/models/book.dart';
import 'package:app/widgets/common/book_profile_screen/book_profile_screen.dart';
import 'package:flutter/material.dart';

/// This class provide the whole interactive image.
class BookLayout extends StatelessWidget {
  const BookLayout({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BookProfileScreen(book: book)));
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Image section
            Expanded(
              child: Container(
                // ignore: prefer_const_constructors
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(
                        20.0), // Radio de borde en la esquina inferior izquierda
                    topRight: Radius.circular(
                        20.0), // Radio de borde en la esquina inferior derecha
                  ),
                ),
                padding:
                    EdgeInsets.fromLTRB(0, ScreenConstants.height * 0.02, 0, 0),
                width: ScreenConstants.width * 0.65,
                // height: screenHeight * 0.60,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                  child: Image.asset(
                    book.cover,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),

            /// Book description section
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(
                      10.0), // Radio de borde en la esquina inferior izquierda
                  bottomRight: Radius.circular(
                      10.0), // Radio de borde en la esquina inferior derecha
                ),
              ),
              width: ScreenConstants.width * 0.65,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// Title
                  Container(
                    height: ScreenConstants.height * 0.05,
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.all(ScreenConstants.width * 0.02),
                    child: Text(
                      book.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
                  ),

                  /// Horizontal divider line
                  SizedBox(
                    width: ScreenConstants.width * 0.6,
                    child: Divider(
                      color: Theme.of(context).colorScheme.primary.withAlpha(100),
                      thickness: 1,
                      height: 0,
                    ),
                  ),

                  /// Author and genre
                  Container(
                    height: ScreenConstants.height * 0.05,
                    margin: EdgeInsets.all(ScreenConstants.width * 0.02),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            book.getAuthors,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.outline.withOpacity(0.7),
                              fontSize: 12,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: ScreenConstants.width * 0.03,
                        ),
                        Expanded(
                          child: Text(
                            book.getGenders,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.outline.withOpacity(0.7),
                              fontSize: 12,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
