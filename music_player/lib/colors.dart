import 'package:flutter/material.dart';

Color primaryColor = Color(0xffedd3cb);
//Color primaryColor = Colors.blue[100];
//Color darkPrimaryColor = Colors.blue[800];
Color darkPrimaryColor = Color(0xff6f3d2e);

List<BoxShadow> shadowList = [
  BoxShadow(
      color: darkPrimaryColor.withOpacity(0.5),
      blurRadius: 10,
      offset: Offset(5, 10),
      spreadRadius: 3),
    BoxShadow(
      color: Colors.white.withOpacity(0.5),
      blurRadius: 20,
      offset: Offset(-3, -4),
      spreadRadius: -2)
];

