// import 'package:e_commerce_ui/constants.dart';
import 'package:e_commerce_ui/route.dart';
import 'package:flutter/material.dart';
import './screens/spalsh/splash_screen.dart';
import './theme.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo', 
      theme: theme(),
      // home: SplashScreen(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
