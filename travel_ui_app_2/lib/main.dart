import 'package:flutter/material.dart';
import 'package:travel_ui_app_2/screens/home_screen.dart';


void main()=>runApp(MyApp());



class MyApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:'Travel UI',
      home: HomeScreen(),
      
    );
  }
}


