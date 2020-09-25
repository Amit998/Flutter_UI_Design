import 'package:flutter/material.dart';
import '../size_config.dart';
import 'package:flutter_svg/svg.dart';


class CustomSurffixIcon extends StatelessWidget {
  const CustomSurffixIcon({
    Key key,
    @required this.svgIcon,
  }) : super(key: key);
  final String svgIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        0,
        getProportionScreenWidth(20),
        getProportionScreenWidth(20),
        getProportionScreenWidth(20),
      ),
      child: SvgPicture.asset(
        svgIcon,
        height: getProportionScreenHeight(18),
      ),
    );
  }
}
