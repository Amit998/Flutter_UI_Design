import 'package:flutter/material.dart';

AppBar header(context,
    {bool isAppTitle = false,
    String titleText ,
    removeBackButton = false}) {
  return AppBar(
    automaticallyImplyLeading: removeBackButton ? false: true,
    title: Text(
      isAppTitle ? "Yaari App" : titleText,
      style: TextStyle(
          color: Colors.white,
          fontFamily: "Signatra",
          fontSize: isAppTitle ? 50.0 : 45.0),
    ),
    centerTitle: true,
    backgroundColor: Theme.of(context).accentColor,
  );
}
