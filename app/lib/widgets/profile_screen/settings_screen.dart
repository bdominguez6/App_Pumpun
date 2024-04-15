import 'package:app/controllers/settings_controller.dart';
import 'package:app/models/enums.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants/screen_constants.dart';
import '../../data/common/configuration.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SettingsScreenState();
  }
}

class _SettingsScreenState extends State<SettingsScreen> {
  SettingsController controller = SettingsController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () => Navigator.pop(context)),
        title: Text('Settings'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(ScreenConstants.width * 0.05,
              ScreenConstants.height * 0.05, ScreenConstants.width * 0.05, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                cursorColor: Colors.amber,
                decoration: InputDecoration()
                    .applyDefaults(
                      InputDecorationTheme(),
                    )
                    .copyWith(
                      labelStyle: TextStyle(
                        fontSize: ScreenConstants.height * 0.03,
                        color: Colors.amber,
                      ),
                      hintText: Configuration.user.username,
                      labelText: 'Username',
                    ),
              ),
              SizedBox(height: ScreenConstants.height * 0.02),
              TextField(
                cursorColor: Colors.amber,
                obscureText: true,
                decoration: InputDecoration()
                    .applyDefaults(
                      InputDecorationTheme(),
                    )
                    .copyWith(
                      labelStyle: TextStyle(
                        fontSize: ScreenConstants.height * 0.03,
                        color: Colors.amber,
                      ),
                      labelText: 'Password',
                    ),
              ),
              SizedBox(height: ScreenConstants.height * 0.02),
              TextField(
                obscureText: true,
                cursorColor: Colors.amber,
                decoration: InputDecoration()
                    .applyDefaults(
                      InputDecorationTheme(),
                    )
                    .copyWith(
                      labelStyle: TextStyle(
                        fontSize: ScreenConstants.height * 0.03,
                        color: Colors.amber,
                      ),
                      hintText: Configuration.user.name,
                      labelText: 'Name',
                    ),
              ),
              SizedBox(height: ScreenConstants.height * 0.03),
              Text(
                'Theme',
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: ScreenConstants.height * 0.03,
                ),
              ),
              RadioListTile(
                  activeColor: Colors.amber,
                  title: Text('Light Theme'),
                  value: AppTheme.light,
                  groupValue: controller.themeConfiguration,
                  onChanged: (AppTheme? value) {
                    setState(() {
                      controller.themeConfiguration = value;
                    });
                  }),
              RadioListTile(
                  activeColor: Colors.amber,
                  title: Text('Dark Theme'),
                  value: AppTheme.dark,
                  groupValue: controller.themeConfiguration,
                  onChanged: (AppTheme? value) {
                    setState(() {
                      controller.themeConfiguration = value;
                    });
                  }),
              RadioListTile(
                  activeColor: Colors.amber,
                  title: Text('Use device settings'),
                  value: AppTheme.prefered,
                  groupValue: controller.themeConfiguration,
                  onChanged: (AppTheme? value) {
                    setState(() {
                      controller.themeConfiguration = value;
                    });
                  }),
              SizedBox(height: ScreenConstants.height * 0.03),
              Text(
                'Profile Picture',
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: ScreenConstants.height * 0.03,
                ),
              ),
              ImagePicker(),
            ],
          ),
        ),
      ),
    );
  }
}
