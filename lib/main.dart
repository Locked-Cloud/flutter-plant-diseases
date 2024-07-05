import 'package:flutter/material.dart';
import 'upload_page.dart'; // Import your UploadPage widget here

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Define a custom ColorScheme
    final ColorScheme colorScheme = ColorScheme.fromSwatch(
      primarySwatch: Colors.teal, // Set your primary color swatch
      accentColor: Colors.deepOrange, // Set your accent color
      backgroundColor: Colors.white, // Set background color
      errorColor: Colors.red, // Set error color
      brightness: Brightness.light, // Set brightness (light or dark)
    );

    // Create ThemeData using ColorScheme
    final ThemeData theme = ThemeData.from(colorScheme: colorScheme);

    return MaterialApp(
      title: 'Image Upload App',
      theme: theme, // Set ThemeData created with ColorScheme
      home: UploadPage(), // Set UploadPage as the home page
    );
  }
}
