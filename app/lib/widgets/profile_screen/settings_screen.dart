import 'package:app/controllers/settings_controller.dart';
import 'package:app/widgets/profile_screen/theme_settings.dart';
import 'package:flutter/material.dart';

import '../../constants/screen_constants.dart';
import '../../data/common/configuration.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen(
      {super.key, required this.controller, required this.onChangeSettings});

  final void Function(BuildContext context) onChangeSettings;
  final SettingsController controller;

  @override
  State<StatefulWidget> createState() {
    return SettingsScreenState();
  }
}

class SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: BackButton(
          onPressed: () => widget.onChangeSettings(context),
          color: Theme.of(context).colorScheme.outline,
        ),
        title: Text(
          'Settings',
          style: TextStyle(
            color: Theme.of(context).colorScheme.outline,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            ScreenConstants.width * 0.05,
            ScreenConstants.height * 0.05,
            ScreenConstants.width * 0.05,
            0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Username
              TextField(
                controller: widget.controller.usernameController,
                cursorColor: Theme.of(context).colorScheme.tertiary,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.outline,
                    decorationColor: Theme.of(context).colorScheme.outline),
                decoration: const InputDecoration()
                    .applyDefaults(
                      const InputDecorationTheme(),
                    )
                    .copyWith(
                      labelText: 'Username',
                      hintText: Configuration.user.username,
                      hintStyle: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .surface
                              .withOpacity(0.6)),
                      labelStyle: TextStyle(
                        fontSize: ScreenConstants.height * 0.03,
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                    ),
              ),
              SizedBox(height: ScreenConstants.height * 0.02),
              // Password
              TextField(
                controller: widget.controller.passwordController,
                obscureText: true,
                cursorColor: Theme.of(context).colorScheme.tertiary,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.outline,
                    decorationColor: Theme.of(context).colorScheme.outline),
                decoration: const InputDecoration()
                    .applyDefaults(
                      const InputDecorationTheme(),
                    )
                    .copyWith(
                      labelText: 'Password',
                      hintText: Configuration.user.password,
                      hintStyle: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .surface
                              .withOpacity(0.6)),
                      labelStyle: TextStyle(
                        fontSize: ScreenConstants.height * 0.03,
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                    ),
              ),
              SizedBox(height: ScreenConstants.height * 0.02),
              // Email
              TextField(
                controller: widget.controller.emailController,
                cursorColor: Theme.of(context).colorScheme.tertiary,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.outline,
                    decorationColor: Theme.of(context).colorScheme.outline),
                decoration: const InputDecoration()
                    .applyDefaults(
                      const InputDecorationTheme(),
                    )
                    .copyWith(
                      labelText: 'Email',
                      hintText: Configuration.user.email,
                      hintStyle: TextStyle(
                        color: Theme.of(context)
                            .colorScheme
                            .surface
                            .withOpacity(0.6),
                      ),
                      labelStyle: TextStyle(
                        fontSize: ScreenConstants.height * 0.03,
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                    ),
              ),
              SizedBox(height: ScreenConstants.height * 0.02),
              // Name
              TextField(
                controller: widget.controller.nameController,
                cursorColor: Theme.of(context).colorScheme.tertiary,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.outline,
                    decorationColor: Theme.of(context).colorScheme.outline),
                decoration: const InputDecoration()
                    .applyDefaults(
                      const InputDecorationTheme(),
                    )
                    .copyWith(
                      labelText: 'Name',
                      hintText: Configuration.user.name,
                      hintStyle: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .surface
                              .withOpacity(0.6)),
                      labelStyle: TextStyle(
                        fontSize: ScreenConstants.height * 0.03,
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                    ),
              ),
              SizedBox(height: ScreenConstants.height * 0.04),
              Text(
                'Themes',
                style: TextStyle(
                  fontSize: ScreenConstants.height * 0.03,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
              SizedBox(height: ScreenConstants.height * 0.008),
              ThemeSettings(),
            ],
          ),
        ),
      ),
    );
  }
}
