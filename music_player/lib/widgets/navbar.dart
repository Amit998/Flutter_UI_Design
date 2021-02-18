import 'package:flutter/material.dart';
import 'package:music_player/colors.dart';

class NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      margin: EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NavbarItem(
            icon: Icons.arrow_back_ios,
          ),
          Text(
            "Play Now",
            style: TextStyle(
                fontSize: 16,
                color: darkPrimaryColor,
                fontWeight: FontWeight.w500),
          ),
          NavbarItem(icon: Icons.list),
        ],
      ),
    );
  }
}

class NavbarItem extends StatelessWidget {
  final IconData icon;

  const NavbarItem({Key key, this.icon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: shadowList,
      ),
      child: Icon(
        icon,
        color: darkPrimaryColor,
      ),
    );
  }
}
