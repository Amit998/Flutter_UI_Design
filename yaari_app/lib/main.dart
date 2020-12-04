import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yaari_app/pages/home.dart';

void main() {
  runApp(MyApp());
  Firestore.instance.settings(timestampsInSnapshotsEnabled: true).then((_) {
    print("Timestamps Enabled in snapshot\n");
    // runApp(MyApp());
  }, onError: (_) {
    print("There Was an Error\n");
    // runApp(MyApp());
  });
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
        home: Home());
  }
}

// keytool -list -v -keystore "%USERPROFILE%\.android\debug.keystore"-alias androiddebugkey -storepass android -keypass android
// keytool -list -v \
// -alias androiddebugkey -keystore %USERPROFILE%\.android\debug.keystore
// 470004f8-256f-44d7-bbc2-bc6edaa62274
