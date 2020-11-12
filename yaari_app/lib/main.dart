import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("AppBar"),
        ),
      ),
    );
  }
}

// keytool -list -v -keystore "%USERPROFILE%\.android\debug.keystore"-alias androiddebugkey -storepass android -keypass android
// keytool -list -v \
// -alias androiddebugkey -keystore %USERPROFILE%\.android\debug.keystore