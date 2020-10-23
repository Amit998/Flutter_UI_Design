import 'package:flutter/material.dart';

import '../size_config.dart';



class RoundIconButton extends StatelessWidget {
  const RoundIconButton({
    Key key,
    this.iconData,
    this.press,
  }) : super(key: key);

  final IconData iconData;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionScreenWidth(40),
      width: getProportionScreenHeight(40),
      child: FlatButton(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        color: Colors.white,
        onPressed: press,
        child: Icon(iconData),
      ),
    );
  }
}