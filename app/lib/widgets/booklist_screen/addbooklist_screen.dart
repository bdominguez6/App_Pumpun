import 'package:app/constants/screen_constants.dart';
import 'package:app/models/booklist.dart';
import 'package:app/widgets/common/goback_appbar.dart';
import 'package:flutter/material.dart';

import 'package:flutter_colorpicker/flutter_colorpicker.dart';

//form to add new booklists to a user
class AddBooklistScreen extends StatefulWidget {
  const AddBooklistScreen({super.key, required this.onAddBooklist});

  final void Function(BookList booklist) onAddBooklist;

  @override
  State<AddBooklistScreen> createState() {
    return _AddBooklistScreen();
  }
}

class _AddBooklistScreen extends State<AddBooklistScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _title = '';
  String _subtitle = '';
  Color _color = Colors.white;

  void _submitForm() {
    // Check if the form is valid
    if (_formKey.currentState!.validate()) {
      // Save the form data
      _formKey.currentState!.save();
      //TOFIX: put here the user list of lists instead of my sample
      widget.onAddBooklist(
          BookList(title: _title, subtitle: _subtitle, color: _color));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GoBackAppBar(title: 'New list'),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            //padding: EdgeInsets.all(50.0),
            padding: EdgeInsets.only(
                left: ScreenConstants.width * 0.12,
                right: ScreenConstants.width * 0.12,
                top: ScreenConstants.height * 0.01),
            child: Column(
              children: [
                TextFormField(
                  cursorColor: Theme.of(context).colorScheme.tertiary,
                  style: TextStyle(color: Theme.of(context).colorScheme.outline,
                      decorationColor: Theme.of(context).colorScheme.outline),
                  decoration: const InputDecoration()
                      .applyDefaults(
                        const InputDecorationTheme(),
                      )
                      .copyWith(
                        labelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                        labelText: 'List title',
                      ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the list name.';
                    }
                    if (value.length > 20) {
                      return 'Title is too long';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _title = value!;
                  },
                ),
                TextFormField(
                  cursorColor: Theme.of(context).colorScheme.tertiary,
                  style: TextStyle(color: Theme.of(context).colorScheme.outline,
                      decorationColor: Theme.of(context).colorScheme.outline),
                  decoration: const InputDecoration()
                      .applyDefaults(
                        const InputDecorationTheme(),
                      )
                      .copyWith(
                        labelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                        labelText: 'Subtitle',
                      ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the subtitle.';
                    }
                    if (value.length > 30) {
                      return 'Subtitle is too long';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _subtitle = value!;
                  },
                ),
                SizedBox(height: ScreenConstants.height * 0.02),
                //color picker for the user
                // flutter pub add flutter_colorpicker
                Text(
                  'Choose a Color',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
                SizedBox(height: ScreenConstants.height * 0.02),
                Theme(
                  data: ThemeData(
                    canvasColor: Theme.of(context).colorScheme.secondary,
                    textTheme: TextTheme(
                      titleMedium: TextStyle(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                      bodyLarge: TextStyle(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                      bodyMedium: TextStyle(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
                  ),
                  child: ColorPicker(
                      pickerColor: _color,
                      onColorChanged: (color) => {_color = color}),
                ),
                SizedBox(height: ScreenConstants.height * 0.01),
                TextButton(
                  onPressed: _submitForm,
                  child: Text(
                    'Create',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
