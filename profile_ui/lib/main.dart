// import 'package:flutter/material.dart';
// import './page/home.dart';

// void main(){
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget{
// @override
// Widget build(BuildContext context) {
//   return MaterialApp(
//     title:'Flutter UI Design',
//     debugShowCheckedModeBanner: false,
//     theme: ThemeData(
//       primarySwatch: Colors.blue,
//       fontFamily: 'SFProText',
//       visualDensity: VisualDensity.adaptivePlatformDensity,
//     ),
//     // home: HomeView(),
//   );
// }
// }

import 'package:flutter/material.dart';
import 'package:profile_ui/page/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Ui",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'SFProText',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeView(),
    );
  }
}
