import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../size_config.dart';



class RoundButton extends StatelessWidget {
  const RoundButton(
      {Key key,
      this.iconImgSrc,
      this.press,
      this.size = 64,
      this.color,
      this.iconColor
      })
      : super(key: key);
  final double size;
  final String iconImgSrc;
  final VoidCallback press;
  final Color color, iconColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenWidth(size),
      width: getProportionateScreenWidth(size),
      child: FlatButton(
        padding: EdgeInsets.all(15 / 64 * size),
        color: color,
        onPressed: press,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        child: SvgPicture.asset(
          iconImgSrc,
          color: iconColor,
        ),
      ),
    );
  }
}
