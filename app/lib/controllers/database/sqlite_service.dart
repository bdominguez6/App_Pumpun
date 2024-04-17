import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

//PARA sqlite: flutter pub add sqflite path
//initialize the data base of sqlite
//this is applied for only ONE user right now. that user is stored on shared preferences
class SQLiteService {
  Future<Database> initializeDB() async {
    return openDatabase(
      join(await getDatabasesPath(), 'swipebook.db'),
      onCreate: (db, version) {
        //USER is not used in this demo version
        /*db.execute(
            'CREATE TABLE user(id INTEGER PRIMARY KEY, username TEXT UNIQUE, name TEXT, email TEXT UNIQUE, image TEXT, password TEXT)');*/
        db.execute(
            'CREATE TABLE booklist(id INT AUTO_INCREMENT PRIMARY KEY , title TEXT UNIQUE NOT NULL, subtitle TEXT NOT NULL, color INTEGER NOT NULL) ');
        db.execute(
            'CREATE TABLE book(id INT AUTO_INCREMENT PRIMARY KEY, title TEXT NOT NULL, cover TEXT NOT NULL, description TEXT NOT NULL, amazonLink TEXT, record TEXT NOT NULL) ');
        db.execute(
            'CREATE TABLE bookonlist ( booklist_id INT, book_id INT, FOREIGN KEY (booklist_id) REFERENCES booklist(id), FOREIGN KEY (book_id) REFERENCES book(id))');
        db.execute(
            'CREATE TABLE genre(id INT PRIMARY KEY, name TEXT NOT NULL)');
        db.execute(
            'CREATE TABLE author(id INT AUTO_INCREMENT, name TEXT NOT NULL)');
        db.execute(
          'CREATE TABLE bookgenre(book_id INT, genre_id INT,FOREIGN KEY (book_id) REFERENCES book(id),FOREIGN KEY (genre_id) REFERENCES genre(id))',
        );
        db.execute(
            'CREATE TABLE bookauthor(book_id INT, author_id INT,FOREIGN KEY (book_id) REFERENCES book(id),FOREIGN KEY (author_id) REFERENCES author(id))');
      },
      version: 1,
    );
  }
}

//sqlite: flutter pub add sqflite path
