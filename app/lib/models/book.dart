import 'package:app/models/enums.dart';
import 'package:flutter/material.dart';

class Book {
  Book(
      {required this.title,
      required this.cover,
      required this.description,
      required this.authorList,
      required this.genreList,
      this.amazonLink = '',
      required this.record}) {
    icon = recordIcons[record]!;
  }

  final String title;
  final String cover;
  final String description;
  final String amazonLink;
  final List<Genre> genreList;
  final List<String> authorList;
  final Record record;
  // para usarlo: IconData(ICON, fontFamily: 'MaterialIcons');
  int icon = 0xe1f0; // Temporal, debería ser una ruta

  //Method that returns the authors as a string
  String get getAuthors {
    return authorList.join(', ');
  }

  /// Method that returns the genders as a string
  String get getGenders {
    List<String> genreListAux = [];

    for (var genreAux in genreList) {
      String genderSplited = genreAux.toString().split('.').last;
      String genderCapitalized = genderSplited.substring(0, 1).toUpperCase() +
          genderSplited.substring(1);

      genreListAux.add(genderCapitalized);
    }
    return genreListAux.join(', ');
  }
} // note: End class


