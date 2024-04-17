import 'package:app/controllers/database/book_service.dart';
import 'package:app/models/book.dart';
import 'package:app/models/booklist.dart';
import 'package:app/controllers/database/sqlite_service.dart';
import 'package:sqflite/sqflite.dart';

class BookListService {
  Future<void> createBookList(BookList bookList) async {
    final Database database = await SQLiteService().initializeDB();
    //insert the data and put the id to the booklist class
    bookList.id = await database.insert('booklist', bookList.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> deleteBookList(int id) async {
    final Database database = await SQLiteService().initializeDB();
    await database.delete('booklist', where: 'id=?', whereArgs: [id]);
  }

  Future<List<BookList>> getAllBookLists() async {
    final Database database = await SQLiteService().initializeDB();
    final List<Map<String, dynamic>> bookListMaps =
        await database.query('book');
    return bookListMaps
        .map((e) => BookList.fromMap(
            e, BookService().getBooksByListId(e['id']) as List<Book>))
        .toList();
  }

  Future<BookList> getBookListById(int id) async {
    final Database database = await SQLiteService().initializeDB();
    final rows =
        await database.query('booklist', where: 'id=?', whereArgs: [id]);

    Map<String, dynamic> row = rows.first;
    BookList bookList = BookList.fromMap(
        row, BookService().getBooksByListId(row['id']) as List<Book>);

    return bookList;
  }
}
