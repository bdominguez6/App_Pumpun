import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text('Settings'),
      ),
    );
  }
}