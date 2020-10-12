
import 'package:analog_clock/screens/home_screen.dart';
import 'package:analog_clock/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Analog Clock',
      theme: themeData(context),
      darkTheme: darkThemeData(context),
      themeMode: ThemeMode.light,
      home: HomeScreen(),
    );
  }
}
