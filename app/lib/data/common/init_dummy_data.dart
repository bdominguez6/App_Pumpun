import 'package:app/controllers/database/author_service.dart';
import 'package:app/controllers/database/bookList_service.dart';
import 'package:app/controllers/database/book_service.dart';
import 'package:app/controllers/database/genre_service.dart';
import 'package:app/models/author.dart';
import 'package:app/models/book.dart';
import 'package:app/models/booklist.dart';
import 'package:app/models/enums.dart';
import 'package:app/widgets/booklist_screen/booklists_screen.dart';
import 'package:flutter/material.dart';

initDummyData() async {
  //ADD AUTHORS TO THE DATABASE
  Author author1 = Author(name: 'Jane Austen');
  Author author2 = Author(name: 'Miguel de Cervantes');
  Author author3 = Author(name: 'George A.R. Martin');
  author1.id = await AuthorService().createAuthor(author1);
  author2.id = await AuthorService().createAuthor(author2);
  author3.id = await AuthorService().createAuthor(author3);

//ADD GENRES TO THE DB
  for (int index = 0; index < Genre.values.length; index++) {
    GenreService().createGenre(Genre.values[index]);
  }

  //default lists (records, wishlist and read)
  BookList records = BookList(
      title: "Records",
      subtitle: "records",
      color: Colors.transparent,
      books: []);
  BookList bookList1 = BookList(
      title: "Wishlist books",
      subtitle: "Books that you want to read.",
      color: Colors.green,
      books: []);
  BookList bookList2 = BookList(
      title: "Read books",
      subtitle: "Books that you already read.",
      color: Colors.red,
      books: []);

  records.id = await BookListService().createBookList(records);
  bookList1.id = await BookListService().createBookList(bookList1);
  bookList2.id = await BookListService().createBookList(bookList2);

  //add some books and put genres, authors abd lists
  for (int index = 0; index < 20; index++) {
    Book book = Book(
        title: 'Libro ${index}',
        cover: "assets/images/covers/harry_potter1_cover.jpg",
        record: Record.none,
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas in quam mollis, aliquet quam in, cursus erat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc viverra aliquet sapien nec eleifend. Nunc euismod a lorem non posuere. Etiam molestie imperdiet ornare. Suspendisse a sem eget eros commodo pellentesque quis maximus tortor. Maecenas iaculis vestibulum magna, at malesuada elit interdum id. Aliquam ac ante erat. Mauris facilisis elementum cursus. Vivamus hendrerit mauris a magna mollis auctor. Nulla auctor consequat mi in pulvinar. Maecenas at urna at neque.",
        authorList: [],
        genreList: []);
    book.id = await BookService().createBook(book);
    BookService().createBook(book);
    AuthorService().addAuthorToBook(author1, book);
    AuthorService().addAuthorToBook(author2, book);
    AuthorService().addAuthorToBook(author3, book);
    GenreService().addGenreToBook(Genre.romance, book);
    GenreService().addGenreToBook(Genre.scifi, book);
    BookService().addBookToList(book, bookList1);
    print('libro numero ${book.id} anhadido');
  }
  for (int index = 0; index < 20; index++) {
    Book book = Book(
        title: 'Libro 2.${index}',
        cover: "assets/images/covers/portada1.jpg",
        record: Record.none,
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas in quam mollis, aliquet quam in, cursus erat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc viverra aliquet sapien nec eleifend. Nunc euismod a lorem non posuere. Etiam molestie imperdiet ornare. Suspendisse a sem eget eros commodo pellentesque quis maximus tortor. Maecenas iaculis vestibulum magna, at malesuada elit interdum id. Aliquam ac ante erat. Mauris facilisis elementum cursus. Vivamus hendrerit mauris a magna mollis auctor. Nulla auctor consequat mi in pulvinar. Maecenas at urna at neque.",
        authorList: [],
        genreList: []);
    book.id = await BookService().createBook(book);
    BookService().createBook(book);
    AuthorService().addAuthorToBook(author2, book);
    GenreService().addGenreToBook(Genre.romance, book);
    GenreService().addGenreToBook(Genre.scifi, book);
    print('libro numero ${book.id} anhadido');
  }
  for (int index = 0; index < 20; index++) {
    Book book = Book(
        title: 'Libro 3.${index}',
        cover: "assets/images/covers/portada2.jpg",
        record: Record.none,
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas in quam mollis, aliquet quam in, cursus erat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc viverra aliquet sapien nec eleifend. Nunc euismod a lorem non posuere. Etiam molestie imperdiet ornare. Suspendisse a sem eget eros commodo pellentesque quis maximus tortor. Maecenas iaculis vestibulum magna, at malesuada elit interdum id. Aliquam ac ante erat. Mauris facilisis elementum cursus. Vivamus hendrerit mauris a magna mollis auctor. Nulla auctor consequat mi in pulvinar. Maecenas at urna at neque.",
        authorList: [],
        genreList: []);
    book.id = await BookService().createBook(book);
    AuthorService().addAuthorToBook(author1, book);
    AuthorService().addAuthorToBook(author3, book);
    GenreService().addGenreToBook(Genre.scifi, book);
    BookService().addBookToList(book, bookList2);
    print('libro numero ${book.id} anhadido');
  }
}
