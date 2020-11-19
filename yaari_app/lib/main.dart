import 'package:flutter/material.dart';
import 'package:yaari_app/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.deepPurple,
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.teal,
        ),
        home: Home()
      );
  }
}

// keytool -list -v -keystore "%USERPROFILE%\.android\debug.keystore"-alias androiddebugkey -storepass android -keypass android
// keytool -list -v \
// -alias androiddebugkey -keystore %USERPROFILE%\.android\debug.keystore
