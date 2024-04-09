import 'package:app/models/booklist.dart';
import 'package:flutter/material.dart';

import "package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart";

class AddBooklistScreen extends StatefulWidget {
  const AddBooklistScreen({super.key, required this.onAddBooklist});

  final void Function(BookList booklist) onAddBooklist;
  @override
  State<AddBooklistScreen> createState() {
    return _AddBooklistScreen();
  }
}

class _AddBooklistScreen extends State<AddBooklistScreen> {
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(); // A key for managing the form
  String _title = ''; // Variable to store the entered name
  String _subtitle = ''; // Variable to store the entered email
  Color _color = Colors.white;

  void _submitForm() {
    // Check if the form is valid
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save(); // Save the form data
      //put here the user list of lists
      widget.onAddBooklist(
          BookList(title: _title, subtitle: _subtitle, color: _color));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey, // Associate the form key with this Form widget
      child: Padding(
        padding: EdgeInsets.all(50.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'List title'), // Label for the name field
              validator: (value) {
                // Validation function for the name field
                if (value!.isEmpty) {
                  return 'Please enter the list name.'; // Return an error message if the name is empty
                }
                return null; // Return null if the name is valid
              },
              onSaved: (value) {
                _title = value!; // Save the entered name
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Subtitle'), // Label for the email field
              validator: (value) {
                // Validation function for the email field
                if (value!.isEmpty) {
                  return 'Please enter the subtitle.'; // Return an error message if the email is empty
                }
                // You can add more complex validation logic here
                return null; // Return null if the email is valid
              },
              onSaved: (value) {
                _subtitle = value!; // Save the entered email
              },
            ),

            //color picker for the user
            // flutter pub add flutter_hsvcolor_picker
            //
            SizedBox(height: 20.0),
            Text(
              'Choose a Color',
            ),
            ColorPicker(
              pickerOrientation: PickerOrientation.inherit,
              color: Colors.blue,
              onChanged: (value) {
                _color = value;
              },
            ),

            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed:
                  _submitForm, // Call the _submitForm function when the button is pressed
              child: Text('Create'), // Text on the button
            ),
          ],
        ),
      ),
    );
  }
}
