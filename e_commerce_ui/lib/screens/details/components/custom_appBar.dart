import 'package:e_commerce_ui/components/roundButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../size_config.dart';



class CustomAppBar extends PreferredSize {
  final double rating;

  CustomAppBar(this.rating);
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RoundIconButton(
            iconData: Icons.arrow_back_ios,
            press: () => Navigator.pop(context),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Text(
                  rating.toString(),
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(width: 5),
                SvgPicture.asset("assets/icons/Star Icon.svg")
              ],
            ),
          )
        ],
      ),
    ));
  }
}