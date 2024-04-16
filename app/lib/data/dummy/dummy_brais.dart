import 'package:app/models/book.dart';
import 'package:app/models/enums.dart';
import 'package:app/models/user.dart';

class DummyBrais {
  User? userDummy;
  late Book book1;
  late Book book2;
  late Book book3;
  late Book book4;

  DummyBrais() {
    userDummy = User(
      username: 'ManzanaPlatano231',
      password: 'password',
      email: 'amksef@pumpunhost.com',
      name: 'Mario Gonzalez Iglesias',
      image: 'assets/images/icons/icon_512px.png',
    );

    book1 = Book(
      title:
          "Juego de tronos: Canción de Fuego y HieloJuego de tronos: Canción de Fuego y HieloJuego de tronos: Canción de Fuego y HieloJuego de tronos: Canción de Fuego y HieloJuego de tronos: Canción de Fuego y HieloJuego de tronos: Canción de Fuego y Hielo",
      cover: "assets/images/covers/portada1.jpg",
      authorList: [
        'George A.R. Martin',
      ],
      genreList: [Genre.horror, Genre.suspense],
      record: Record.liked,
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas in quam mollis, aliquet quam in, cursus erat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc viverra aliquet sapien nec eleifend. Nunc euismod a lorem non posuere. Etiam molestie imperdiet ornare. Suspendisse a sem eget eros commodo pellentesque quis maximus tortor. Maecenas iaculis vestibulum magna, at malesuada elit interdum id. Aliquam ac ante erat. Mauris facilisis elementum cursus. Vivamus hendrerit mauris a magna mollis auctor. Nulla auctor consequat mi in pulvinar. Maecenas at urna at neque tempus pulvinar. Nulla vitae diam condimentum, venenatis libero eu, ornare erat.Aenean ultricies, leo fringilla elementum gravida, ipsum lacus pellentesque leo, eu molestie mauris velit quis nunc. Morbi ac eros felis. Praesent et tellus libero. Vivamus efficitur lectus elit, ut ultricies leo pellentesque vitae. Ut auctor lectus eu sollicitudin lobortis. Vivamus eu tellus interdum, tempor quam iaculis, gravida neque. Quisque consectetur bibendum vulputate. Curabitur et tristique velit. Ut ut justo at erat tempus suscipit non eu odio. Donec mattis risus nec nisi ultricies consectetur. Praesent feugiat, nibh eget mattis bibendum, nisl urna sollicitudin mi, non aliquam risus nulla et sapien. Phasellus sagittis enim id velit vestibulum rhoncus. Integer ut congue lacus. Vivamus eu erat suscipit, tristique nisi eu, convallis ipsum.",
    );
    book2 = Book(
      title: "El Quijote",
      cover: "assets/images/covers/portada2.jpeg",
      authorList: [
        'Miguel de Cervantes',
        'Miguel de Cervantes',
        'Miguel de Cervantes'
      ],
      genreList: [Genre.romance, Genre.horror],
      record: Record.disliked,
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas in quam mollis, aliquet quam in, cursus erat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc viverra aliquet sapien nec eleifend. Nunc euismod a lorem non posuere. Etiam molestie imperdiet ornare. Suspendisse a sem eget eros commodo pellentesque quis maximus tortor. Maecenas iaculis vestibulum magna, at malesuada elit interdum id. Aliquam ac ante erat. Mauris facilisis elementum cursus. Vivamus hendrerit mauris a magna mollis auctor. Nulla auctor consequat mi in pulvinar. Maecenas at urna at neque tempus pulvinar. Nulla vitae diam condimentum, venenatis libero eu, ornare erat.Aenean ultricies, leo fringilla elementum gravida, ipsum lacus pellentesque leo, eu molestie mauris velit quis nunc. Morbi ac eros felis. Praesent et tellus libero. Vivamus efficitur lectus elit, ut ultricies leo pellentesque vitae. Ut auctor lectus eu sollicitudin lobortis.",
    );
    book3 = Book(
      title: "Orgullo y Prejuicio",
      cover: "assets/images/covers/portada2.jpeg",
      authorList: [
        'Jane Austen',
      ],
      genreList: [Genre.romance, Genre.horror],
      record: Record.disliked,
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas in quam mollis, aliquet quam in, cursus erat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc viverra aliquet sapien nec eleifend...",
    );
    book4 = Book(
      title: "Harry Potter: La piedra filosofal",
      cover: "assets/images/covers/harry_potter1_cover.jpg",
      authorList: ['J.K. Rowling'],
      genreList: [Genre.romance, Genre.horror, Genre.scifi],
      record: Record.disliked,
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas in quam mollis, aliquet quam in, cursus erat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc viverra aliquet sapien nec eleifend. Nunc euismod a lorem non posuere. Etiam molestie imperdiet ornare. Suspendisse a sem eget eros commodo pellentesque quis maximus tortor. Maecenas iaculis vestibulum magna, at malesuada elit interdum id. Aliquam ac ante erat. Mauris facilisis elementum cursus. Vivamus hendrerit mauris a magna mollis auctor. Nulla auctor consequat mi in pulvinar. Maecenas at urna at neque.",
    );
    // Method which fill booklist records on user class
    for (int index = 0; index < 4; index++) {
      userDummy!.defaultBookLists[0].books.insert(0, book1);
      userDummy!.defaultBookLists[0].books.insert(0, book2);
    }
    userDummy!.defaultBookLists[0].books.insert(0, book1);
  }
}
