import 'package:app/controllers/common/myhomepage_controller.dart';
import 'package:app/controllers/common/shared_preferences_controller.dart';
import 'package:app/data/dummy/dummy_bryan.dart';
import 'package:app/widgets/themes/dark_theme.dart';
import 'package:app/widgets/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants/screen_constants.dart';

void main() {
  SharedPreferencesController().loadUser();
  DummyBryan();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((fn) {
    runApp(
      MaterialApp(
        title: 'Mi Aplicación',
        themeMode: ThemeMode.system,
        theme: LightTheme().materialTheme,
        darkTheme: DarkTheme().materialTheme,
        debugShowCheckedModeBanner: false,
        home: MyHomePageController(),
      ),
    );
  });
}
