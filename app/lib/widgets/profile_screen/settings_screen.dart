import 'package:flutter/material.dart';

import '../../constants/screen_constants.dart';
import '../../data/common/configuration.dart';

class SettingsScreen extends StatelessWidget {
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
              SizedBox(height: ScreenConstants.height * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
