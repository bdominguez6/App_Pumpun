import 'package:app/models/user.dart';

class Configuration{
  static User user = User(
    username: 'ManzanaPlatano231',
    password: 'password',
    name: 'Mario Gonzalez Iglesias',
    image: 'assets/images/icons/icon_512px.png',
  );
  static int theme = dark;  // 0. Light, 1. Dark, 2. Depende
}

enum Theme{
  light,
  dark,
  prefered,
}