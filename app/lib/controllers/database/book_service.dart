import 'package:app/controllers/database/author_service.dart';
import 'package:app/controllers/database/bookList_service.dart';
import 'package:app/controllers/database/genre_service.dart';
import 'package:app/models/book.dart';
import 'package:app/controllers/database/sqlite_service.dart';
import 'package:app/models/booklist.dart';
import 'package:app/models/enums.dart';
import 'package:sqflite/sqflite.dart';

class BookService {
  Future<int> createBook(Book book) async {
    final Database database = await SQLiteService().initializeDB();
    //insert the data and put the id to the book class
    return await database.insert('book', book.toMap(false),
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

    List<Book> books = bookMaps.map((e) => Book.fromMap(e)).toList();

    for (Book book in books) {
      book.genreList = await GenreService().getGenresByBookId(book.id);
      book.authorList = await AuthorService().getAuthorsByBookId(book.id);
    }
    return books;
  }

  Future<List<Book>> getAllBooks() async {
    final Database database = await SQLiteService().initializeDB();
    final List<Map<String, dynamic>> bookMaps = await database.query('book');
    List<Book> books = bookMaps.map((e) => Book.fromMap(e)).toList();

    for (Book book in books) {
      book.genreList = await GenreService().getGenresByBookId(book.id);
      book.authorList = await AuthorService().getAuthorsByBookId(book.id);
    }
    return books;
  }

  Future<void> addBookToList(Book book, BookList bookList) async {
    final Database database = await SQLiteService().initializeDB();
    await database.insert(
        'bookonlist', {'book_id': book.id, 'booklist_id': bookList.id},
        conflictAlgorithm: ConflictAlgorithm.replace);
    bookList.books.add(book);
  }
}
