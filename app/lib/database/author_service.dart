import 'package:app/database/sqlite_service.dart';
import 'package:app/models/book.dart';
import 'package:app/models/enums.dart';
import 'package:sqflite/sqflite.dart';

class AuthorService {
  Future<List<String>> getAuthorsByBookId(int id) async {
    final Database database = await SQLiteService().initializeDB();
    final List<Map<String, dynamic>> authorMaps =
        await database.query('bookauthor', where: 'book_id=?', whereArgs: [id]);

    return authorMaps.map((authorMap) {
      return authorMap['author_id'].toString();
    }).toList();
  }
}
