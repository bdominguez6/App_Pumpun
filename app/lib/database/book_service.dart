import 'package:app/database/author_service.dart';
import 'package:app/database/genre_service.dart';
import 'package:app/models/book.dart';
import 'package:app/database/sqlite_service.dart';
import 'package:app/models/enums.dart';
import 'package:sqflite/sqflite.dart';

class BookService {
  Future<List<Book>> getBooksByListId(int id) async {
    final Database database = await SQLiteService().initializeDB();
    final List<Map<String, dynamic>> bookMaps = await database
        .query('bookOnList', where: 'booklist_id=?', whereArgs: [id]);

    return bookMaps
        .map((e) => Book.fromMap(
            e,
            GenreService().getGenresByBookId(e['id']) as List<Genre>,
            AuthorService().getAuthorsByBookId(e['id']) as List<String>))
        .toList();
  }

  Future<List<Book>> getAllBooks(int id) async {
    final Database database = await SQLiteService().initializeDB();
    final List<Map<String, dynamic>> bookMaps = await database.query('book');
    return bookMaps
        .map((e) => Book.fromMap(
            e,
            GenreService().getGenresByBookId(e['id']) as List<Genre>,
            AuthorService().getAuthorsByBookId(e['id']) as List<String>))
        .toList();
  }
}
