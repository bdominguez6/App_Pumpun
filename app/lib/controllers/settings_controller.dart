import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../data/common/configuration.dart';
import '../models/enums.dart';

class SettingsController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  AppTheme? themeConfiguration = Configuration.theme;

  bool changeSettings(BuildContext context) {
    bool error = false;
    String newEmail = emailController.text;
    String newPassword = passwordController.text;
    if (usernameController.text.isNotEmpty) {
      Configuration.user.username = usernameController.text;
    }
    if (newEmail.isNotEmpty) {
      if (EmailValidator.validate(newEmail)) {
        Configuration.user.email = emailController.text;
      } else {
        error = true;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("The email is not valid."),
          ),
        );
      }
    }
    if (nameController.text.isNotEmpty) {
      Configuration.user.name = nameController.text;
    }
    // 1 mayuscula, 1 minuscula, 1 numero y 8 letras
    if (newPassword.isNotEmpty) {
      if (newPassword.contains(
      RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$'))) {
        Configuration.user.password = newPassword;
      } else {
        error = true;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                "The password must have one upper case letter, one lower case letter, one number and one special character"),
          ),
        );
      }
    }
      return error;
  }
}
