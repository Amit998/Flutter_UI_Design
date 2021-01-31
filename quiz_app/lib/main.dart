import 'package:flutter/material.dart';
import 'package:quiz_app/screens/quiz_screen/quiz_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: QuizScreen()
    );
  }
}
