import 'package:app/models/booklist.dart';
import 'package:app/widgets/profile/styled_text.dart';
import 'package:app/widgets/profile/user_data.dart';
import 'package:flutter/material.dart';

import 'package:app/widgets/profile/last_liked.dart';

import '../../models/book.dart';
import '../../models/user.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    Book book1 = Book(title: "Juego de tronos: Canción de Fuego y Hielo", cover: "assets/images/portada1.jpg", author: ['George R.R. Martin','George R.R. Martin'], genre: [Genre.horror, Genre.suspense],record: Record.liked,  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas in quam mollis, aliquet quam in, cursus erat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc viverra aliquet sapien nec eleifend. Nunc euismod a lorem non posuere. Etiam molestie imperdiet ornare. Suspendisse a sem eget eros commodo pellentesque quis maximus tortor. Maecenas iaculis vestibulum magna, at malesuada elit interdum id. Aliquam ac ante erat. Mauris facilisis elementum cursus. Vivamus hendrerit mauris a magna mollis auctor. Nulla auctor consequat mi in pulvinar. Maecenas at urna at neque tempus pulvinar. Nulla vitae diam condimentum, venenatis libero eu, ornare erat.Aenean ultricies, leo fringilla elementum gravida, ipsum lacus pellentesque leo, eu molestie mauris velit quis nunc. Morbi ac eros felis. Praesent et tellus libero. Vivamus efficitur lectus elit, ut ultricies leo pellentesque vitae. Ut auctor lectus eu sollicitudin lobortis. Vivamus eu tellus interdum, tempor quam iaculis, gravida neque. Quisque consectetur bibendum vulputate. Curabitur et tristique velit. Ut ut justo at erat tempus suscipit non eu odio. Donec mattis risus nec nisi ultricies consectetur. Praesent feugiat, nibh eget mattis bibendum, nisl urna sollicitudin mi, non aliquam risus nulla et sapien. Phasellus sagittis enim id velit vestibulum rhoncus. Integer ut congue lacus. Vivamus eu erat suscipit, tristique nisi eu, convallis ipsum.", );
    Book book2 = Book(title: "El Quijote", cover: "assets/images/portada2.jpeg", author: ['Miguel de Cervantes','Miguel de Cervantes', 'Miguel de Cervantes'], genre: [Genre.romance, Genre.horror], record: Record.disliked,  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas in quam mollis, aliquet quam in, cursus erat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc viverra aliquet sapien nec eleifend. Nunc euismod a lorem non posuere. Etiam molestie imperdiet ornare. Suspendisse a sem eget eros commodo pellentesque quis maximus tortor. Maecenas iaculis vestibulum magna, at malesuada elit interdum id. Aliquam ac ante erat. Mauris facilisis elementum cursus. Vivamus hendrerit mauris a magna mollis auctor. Nulla auctor consequat mi in pulvinar. Maecenas at urna at neque tempus pulvinar. Nulla vitae diam condimentum, venenatis libero eu, ornare erat.Aenean ultricies, leo fringilla elementum gravida, ipsum lacus pellentesque leo, eu molestie mauris velit quis nunc. Morbi ac eros felis. Praesent et tellus libero. Vivamus efficitur lectus elit, ut ultricies leo pellentesque vitae. Ut auctor lectus eu sollicitudin lobortis.", );
    User user = User(
      username: 'ManzanaPlatano231',
      password: 'password',
      name: 'Mario Gonzalez Iglesias',
      image: 'assets/images/icon_64px.png',
    );

    for(int index = 0; index < 4 ; index++){
      user.defaultBookLists[0].books.insert(0, book1);
      user.defaultBookLists[0].books.insert(0, book2);
    }
    user.defaultBookLists[0].books.insert(0,book1);

    return Column(
      children: [
        SizedBox(height: screenHeight / 40),
        UserData(
          screenWidth: screenWidth,
          screenHeight: screenHeight,
          user: user,
        ),
        SizedBox(height: screenHeight / 40),
        Container(
          width: screenWidth / 20 * 19,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StyledText(
                text: 'Last Liked',
                fontSize: screenHeight / 25,
              ),
              TextButton(
                style: ButtonStyle(foregroundColor: MaterialStatePropertyAll<Color>(Colors.amber)),
                onPressed: () {},
                child: StyledText(
                  text: 'More...',
                  fontSize: screenHeight / 50,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: screenHeight/45),
        LastLiked(
          width: screenWidth/20*19,
          height: screenHeight/10*4,
          user: user,
        ),
      ],
    );
  }
}
