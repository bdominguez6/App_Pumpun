import 'package:app/controllers/database/author_service.dart';
import 'package:app/controllers/database/bookList_service.dart';
import 'package:app/controllers/database/genre_service.dart';
import 'package:app/models/book.dart';
import 'package:app/controllers/database/sqlite_service.dart';
import 'package:app/models/booklist.dart';
import 'package:app/models/enums.dart';
import 'package:sqflite/sqflite.dart';

class BookService {
  Future<void> createBook(Book book) async {
    final Database database = await SQLiteService().initializeDB();
    //insert the data and put the id to the book class
    book.id = await database.insert('book', book.toMap(false),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> updateBook(Book book) async {
    final Database database = await SQLiteService().initializeDB();
    await database.update('book', book.toMap(true),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

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

  Future<List<Book>> getAllBooks() async {
    final Database database = await SQLiteService().initializeDB();
    final List<Map<String, dynamic>> bookMaps = await database.query('book');
    return bookMaps
        .map((e) => Book.fromMap(
            e,
            GenreService().getGenresByBookId(e['id']) as List<Genre>,
            AuthorService().getAuthorsByBookId(e['id']) as List<String>))
        .toList();
  }

  Future<void> addBookToList(Book book, BookList bookList) async {
    final Database database = await SQLiteService().initializeDB();
    await database.insert(
        'bookonlist', {'book_id': book.id, 'booklist_id': bookList.id},
        conflictAlgorithm: ConflictAlgorithm.replace);
    bookList.books.add(book);
  }
}
