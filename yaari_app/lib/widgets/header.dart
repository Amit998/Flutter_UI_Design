import 'package:flutter/material.dart';

AppBar header(context,{bool isAppTitle = false,String titleText="Yaari App"}) {
  return AppBar(
    title: Text(
      isAppTitle ?  titleText : titleText,
      style: TextStyle(
          color: Colors.white,
          fontFamily: "Signatra",
          fontSize: isAppTitle ?  50.0 : 45.0
        ),
    ),
    centerTitle: true,
    backgroundColor: Theme.of(context).accentColor,
  );
}
