import 'package:app/models/enums.dart';
import 'package:flutter/material.dart';

class Book {
  Book(
      {required this.id,
      required this.title,
      required this.cover,
      required this.description,
      required this.authorList,
      required this.genreList,
      this.amazonLink = '',
      required this.record}) {}

  final int id;
  final String title;
  final String cover;
  final String description;
  final String amazonLink;
  final List<Genre> genreList;
  final List<String> authorList;
  Record record;

  //icon = recordIcons[record]!;
  // para usarlo: IconData(ICON, fontFamily: 'MaterialIcons');
  //int icon = recordIcons[Record.none]!; // Temporal, debería ser una ruta

  //constructor with maps from the database
  Book.fromMap(
      Map<String, dynamic> item, List<Genre> genres, List<String> authors)
      : id = item['id'],
        title = item['title'],
        cover = item['cover'],
        description = item['description'],
        amazonLink = item['amazonLink'] ?? '',
        genreList = genres,
        authorList = authors,
        record = Record.values[item['record']];

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


