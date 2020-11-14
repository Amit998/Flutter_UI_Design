import 'package:flutter/material.dart';


import 'info.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Info(
          name: "Jhon Doe",
          email: "JhonDoe@gmail.com",
          image: "assets/images/pic.png",
        ),
      ],
    );
  }
}
