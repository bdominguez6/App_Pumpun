import 'package:app/data/common/configuration.dart';
import 'package:app/models/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesController{
    Future<bool> loadUser() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      Configuration.user.username = prefs.getString('username') ?? 'ManzanaPlatano231';
      Configuration.user.password = prefs.getString('password') ?? '123456aB';
      Configuration.user.email = prefs.getString('email') ?? 'mariomanuel@pumpunhost.com';
      Configuration.user.name = prefs.getString('name') ?? 'Mario Manuel Gonzalez';
      Configuration.theme = AppTheme.values.byName(prefs.getString('theme') ?? 'orange');
      Configuration.theme.value();
      return true;
    }

    void saveUser() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('username', Configuration.user.username);
      prefs.setString('password', Configuration.user.password);
      prefs.setString('email', Configuration.user.email);
      prefs.setString('name', Configuration.user.name);
      prefs.setString('theme', Configuration.theme.name);
    }

}