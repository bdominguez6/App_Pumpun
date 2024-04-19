import 'package:app/data/common/init_dummy_data.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

//PARA sqlite: flutter pub add sqflite path
//initialize the data base of sqlite
//this is applied for only ONE user right now. that user is stored on shared preferences
class SQLiteService {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initializeDB();
    return _database!;
  }

  Future<Database> initializeDB() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'swipebook.db'),
      version: 1,
      onCreate: (db, version) async {
        //USER is not used in this demo version
        /*db.execute(
            'CREATE TABLE user(id INTEGER PRIMARY KEY, username TEXT UNIQUE, name TEXT, email TEXT UNIQUE, image TEXT, password TEXT)');*/
        await db.execute(
            'CREATE TABLE booklist(id INTEGER PRIMARY KEY AUTOINCREMENT  , title TEXT UNIQUE NOT NULL, subtitle TEXT NOT NULL, color INTEGER NOT NULL) ');
        await db.execute(
            'CREATE TABLE book(id INTEGER PRIMARY KEY AUTOINCREMENT , title TEXT NOT NULL, cover TEXT NOT NULL, description TEXT NOT NULL, amazonLink TEXT, record TEXT NOT NULL) ');
        await db.execute(
            'CREATE TABLE bookonlist ( booklist_id INT, book_id INT, FOREIGN KEY (booklist_id) REFERENCES booklist(id), FOREIGN KEY (book_id) REFERENCES book(id))');
        await db.execute(
            'CREATE TABLE genre(id INTEGER PRIMARY KEY, name TEXT NOT NULL)');
        await db.execute(
            'CREATE TABLE author(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL)');
        await db.execute(
          'CREATE TABLE bookgenre(book_id INT, genre_id INT,FOREIGN KEY (book_id) REFERENCES book(id),FOREIGN KEY (genre_id) REFERENCES genre(id))',
        );
        await db.execute(
            'CREATE TABLE bookauthor(book_id INT, author_id INT,FOREIGN KEY (book_id) REFERENCES book(id),FOREIGN KEY (author_id) REFERENCES author(id))');
        initDummyData();
      },
    );
  }
}

//sqlite: flutter pub add sqflite path
