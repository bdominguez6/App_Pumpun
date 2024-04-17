import 'package:app/controllers/database/sqlite_service.dart';
import 'package:app/models/author.dart';
import 'package:app/models/book.dart';
import 'package:app/models/enums.dart';
import 'package:sqflite/sqflite.dart';

class AuthorService {
  Future<void> createAuthor(Author author) async {
    final Database database = await SQLiteService().initializeDB();
    //insert the data and put the id to the author class
    author.id = await database.insert('author', author.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  //put an author on a book
  Future<void> addAuthorToBook(Author author, Book book) async {
    final Database database = await SQLiteService().initializeDB();
    await database.insert(
        'bookauthor', {'author_id': author.id, 'book_id': book.id},
        conflictAlgorithm: ConflictAlgorithm.replace);
    book.authorList?.add(author.name);
  }

  //get all the authors a book has
  Future<List<String>> getAuthorsByBookId(int id) async {
    final Database database = await SQLiteService().initializeDB();
    final List<Map<String, dynamic>> authorMaps =
        await database.query('bookauthor', where: 'book_id=?', whereArgs: [id]);

    return authorMaps.map((e) => Author.fromMap(e).name).toList();
  }
}
