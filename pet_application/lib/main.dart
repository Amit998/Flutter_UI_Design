import 'package:flutter/material.dart';
import 'package:pet_application/pages/drawerscreen.dart';
import 'package:pet_application/pages/homescreen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DrawerScreen(),
          HomeScreen(),
        ],
      ),
    );
  }
}
