import 'package:app/models/author.dart';
import 'package:app/models/enums.dart';
import 'package:flutter/material.dart';

class Book {
  Book(
      {required this.authorList,
      required this.genreList,
      required this.title,
      required this.cover,
      required this.description,
      this.amazonLink = '',
      required this.record});

  late int id;
  final String title;
  final String cover;
  final String description;
  String amazonLink;
  List<Genre> genreList;
  List<String> authorList;
  Record record;

  //icon = recordIcons[record]!;
  // para usarlo: IconData(ICON, fontFamily: 'MaterialIcons');
  //int icon = recordIcons[Record.none]!; // Temporal, debería ser una ruta

  //constructor with maps from the database
  Book.fromMap(Map<String, dynamic> item)
      : id = item['id'] as int,
        title = item['title'] as String,
        cover = item['cover'] as String,
        description = item['description'] as String,
        amazonLink = item['amazonLink'] ?? '',
        authorList = [],
        genreList = [],
        record = Record.values.byName(item['record']);

  Map<String, Object?> toMap(bool update) {
    return {
      'title': title,
      'cover': cover,
      'description': description,
      'amazonLink': amazonLink,
      'record': record.name,
    };
  }

  //Method that returns the authors as a string
  String get getAuthors {
    return authorList.join(', ');
  }

  /// Method that returns the genders as a string
  String get getGenders {
    List<String> genreListAux = [];

    for (var genreAux in genreList!) {
      String genderSplited = genreAux.toString().split('.').last;
      String genderCapitalized = genderSplited.substring(0, 1).toUpperCase() +
          genderSplited.substring(1);

      genreListAux.add(genderCapitalized);
    }
    return genreListAux.join(', ');
  }
} // note: End class


