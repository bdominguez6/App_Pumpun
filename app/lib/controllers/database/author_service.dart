import 'package:app/controllers/database/sqlite_service.dart';
import 'package:app/models/author.dart';
import 'package:app/models/book.dart';
import 'package:app/models/enums.dart';
import 'package:sqflite/sqflite.dart';

class AuthorService {
  Future<int> createAuthor(Author author) async {
    final Database database = await SQLiteService().database;
    //insert the data and put the id to the author class
    return await database.insert('author', author.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  //put an author on a book
  Future<void> addAuthorToBook(Author author, Book book) async {
    final Database database = await SQLiteService().database;
    await database.insert(
        'bookauthor', {'author_id': author.id, 'book_id': book.id},
        conflictAlgorithm: ConflictAlgorithm.replace);
    book.authorList.add(author.name);
  }

  //get all the authors a book has
  Future<List<String>> getAuthorsByBookId(int id) async {
    final Database database = await SQLiteService().database;
    final List<Map<String, dynamic>> authorMaps =
        await database.query('bookauthor', where: 'book_id=?', whereArgs: [id]);

    return authorMaps.map((e) => Author.fromMap(e).name).toList();
  }
}
