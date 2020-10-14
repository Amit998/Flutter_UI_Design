import 'package:analog_clock/models/my_theme_provider.dart';
import 'package:analog_clock/screens/home_screen.dart';
import 'package:analog_clock/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyTheme(),
      child: Consumer<MemoryImage>(
        builder: (context,theme,child)=> MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Analog Clock',
        theme: themeData(context),
        darkTheme: darkThemeData(context),
        themeMode:  ? ThemeMode.light : ThemeMode.dark,
        home: HomeScreen(),
      ),
    ));
  }
}
