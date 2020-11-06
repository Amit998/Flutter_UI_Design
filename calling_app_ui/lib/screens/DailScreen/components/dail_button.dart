import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../size_config.dart';



class DailButton extends StatelessWidget {
  const DailButton({
    Key key, this.iconSrc, this.text, this.press,
  }) : super(key: key);
  final String iconSrc, text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(120),
      child: FlatButton(
          padding:
              EdgeInsets.symmetric(vertical: getProportionateScreenWidth(20)),
          onPressed: press,
          // color: Colors.white,
          child: Column(
            children: [
              SvgPicture.asset(iconSrc,
                  color: Colors.white, height: 36),
              Text(text,
                  style: TextStyle(color: Colors.white, fontSize: 12)),
            ],
          )
        ),
    );
  }
}
