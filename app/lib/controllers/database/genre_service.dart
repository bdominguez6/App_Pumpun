import 'package:app/controllers/database/sqlite_service.dart';
import 'package:app/models/book.dart';
import 'package:app/models/enums.dart';
import 'package:sqflite/sqflite.dart';

class GenreService {
  Future<void> createGenre(Genre genre) async {
    final Database database = await SQLiteService().initializeDB();
    await database.insert(
        'genre', {'id': genre.index, 'name': genre.toString()},
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  //pass a genre to a book
  Future<void> addGenreToBook(Genre genre, Book book) async {
    final Database database = await SQLiteService().initializeDB();
    await database.insert(
        'bookgenre', {'genre_id': genre.index, 'book_id': book.id},
        conflictAlgorithm: ConflictAlgorithm.replace);
    book.genreList?.add(genre);
  }

  //get all the genres of a book
  Future<List<Genre>> getGenresByBookId(int id) async {
    final Database database = await SQLiteService().initializeDB();
    final List<Map<String, dynamic>> genreMaps =
        await database.query('bookgenre', where: 'book_id=?', whereArgs: [id]);

    return genreMaps.map((genreMap) {
      return Genre.values[genreMap['genre_id']];
    }).toList();
  }
}
