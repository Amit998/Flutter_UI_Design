import 'package:flutter/material.dart';
import 'package:messaging_app_light_and_dark/screens/wellcomeScreen/wellcome_screen.dart';
import 'package:messaging_app_light_and_dark/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Chat Demo",
      debugShowCheckedModeBanner: false,
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
      // themeMode: ThemeMode.light,
      home: WelcomeScreen(),
    );
  }
}
