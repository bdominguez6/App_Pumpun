import 'package:app/database/sqlite_service.dart';
import 'package:app/models/book.dart';
import 'package:app/models/enums.dart';
import 'package:sqflite/sqflite.dart';

class GenreService {
  Future<List<Genre>> getGenresByBookId(int id) async {
    final Database database = await SQLiteService().initializeDB();
    final List<Map<String, dynamic>> genreMaps =
        await database.query('bookgenre', where: 'book_id=?', whereArgs: [id]);

    return genreMaps.map((genreMap) {
      return Genre.values[genreMap['genre_id']];
    }).toList();
  }
}
