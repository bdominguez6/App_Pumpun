import 'package:app/models/user.dart';

import '../../models/enums.dart';

class Configuration {
  static User user = User(
    username: 'ManzanaPlatano231',
    password: 'password',
    name: 'Mario Gonzalez Iglesias',
    image: 'assets/images/icons/icon_512px.png',
  );
  static AppTheme theme = AppTheme.dark;
}
