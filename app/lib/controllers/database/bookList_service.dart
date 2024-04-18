import 'package:app/controllers/database/book_service.dart';
import 'package:app/models/book.dart';
import 'package:app/models/booklist.dart';
import 'package:app/controllers/database/sqlite_service.dart';
import 'package:sqflite/sqflite.dart';

class BookListService {
  Future<int> createBookList(BookList bookList) async {
    final Database database = await SQLiteService().database;
    //insert the data and put the id to the booklist class
    return await database.insert('booklist', bookList.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> deleteBookList(int id) async {
    final Database database = await SQLiteService().database;
    await database.delete('booklist', where: 'id=?', whereArgs: [id]);
  }

  Future<List<BookList>> getAllBookLists() async {
    final Database database = await SQLiteService().database;
    final List<Map<String, dynamic>> bookListMaps =
        await database.query('book');
    List<BookList> bookLists =
        bookListMaps.map((e) => BookList.fromMap(e)).toList();

    for (BookList bookList in bookLists) {
      bookList.books = await BookService().getBooksByListId(bookList.id);
    }

    return bookLists;
  }

  Future<BookList> getBookListById(int id) async {
    final Database database = await SQLiteService().database;
    final rows =
        await database.query('booklist', where: 'id=?', whereArgs: [id]);

    Map<String, dynamic> row = rows.first;

    BookList bookList = BookList.fromMap(row);

    bookList.books = await BookService().getBooksByListId(bookList.id);

    return bookList;
  }
}
