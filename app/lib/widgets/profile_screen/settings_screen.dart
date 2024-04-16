import 'package:app/controllers/settings_controller.dart';
import 'package:app/models/enums.dart';
import 'package:app/widgets/profile_screen/circular_image.dart';
import 'package:app/widgets/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';

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
        leading: BackButton(onPressed: () {
          bool error = false;
          setState(() {
            error = controller.changeSettings(context);
          });
          if (!error) {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfileScreen(),
              ),
            );
          }
        }),
        title: Text('Settings'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(ScreenConstants.width * 0.05,
              ScreenConstants.height * 0.05, ScreenConstants.width * 0.05, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Username
              TextField(
                controller: controller.usernameController,
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
              // Password
              TextField(
                controller: controller.passwordController,
                obscureText: true,
                cursorColor: Colors.amber,
                //obscureText: true,
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
              // Email
              TextField(
                controller: controller.emailController,
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
                      hintText: Configuration.user.email,
                      labelText: 'Email',
                    ),
              ),
              SizedBox(height: ScreenConstants.height * 0.02),
              // Name
              TextField(
                controller: controller.nameController,
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
              // Radio Buttons Theme
              Text(
                'Theme',
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: ScreenConstants.height * 0.03,
                ),
              ),
              // Light
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
              // Dark
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
              // Device Settings
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
            ],
          ),
        ),
      ),
    );
  }
}
