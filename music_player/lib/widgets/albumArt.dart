import 'package:flutter/material.dart';
import 'package:music_player/colors.dart';

class AlbumArt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      width: 260,
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(horizontal: 70, vertical: 40),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          "assets/images/img.png",
          fit: BoxFit.fill,
        ),
      ),
      decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: darkPrimaryColor.withOpacity(0.5),
                blurRadius: 25,
                offset: Offset(20, 20),
                spreadRadius: 3),
            BoxShadow(
                color: Colors.white.withOpacity(0.5),
                blurRadius: 20,
                offset: Offset(-3, -4),
                spreadRadius: -2)
          ]),
    );
  }
}
