import 'package:app/constants/theme_constants.dart';
import 'package:app/controllers/common/myhomepage_controller.dart';
import 'package:app/controllers/common/shared_preferences_controller.dart';
import 'package:app/controllers/settings_controller.dart';
import 'package:app/data/dummy/dummy_bryan.dart';
import 'package:app/widgets/themes/dark_theme.dart';
import 'package:app/widgets/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants/screen_constants.dart';

void main() {
  DummyBryan();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((fn) => runApp(MyApp()));
}

class MyApp extends StatefulWidget {
  SettingsController settingsController = SettingsController();

  @override
  State<MyApp> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  void changeSettings(BuildContext context) {
    bool error = false;
    setState(() {
      error = widget.settingsController.changeSettings(context);
      if (!error) {
        SharedPreferencesController().saveUser();
      }
      ThemeConstants.changeToAqua();
    });
    if (!error) {
      Navigator.pop(context);
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      SharedPreferencesController().loadUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Aplicación',
      themeMode: ThemeMode.system,
      theme: LightTheme().materialTheme,
      darkTheme: DarkTheme().materialTheme,
      debugShowCheckedModeBanner: false,
      home: MyHomePageController(onChangeSettings: changeSettings,),
    );
  }
}
