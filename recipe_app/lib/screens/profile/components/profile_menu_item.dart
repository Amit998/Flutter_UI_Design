import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';
import '../../../size_config.dart';



class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    this.name,
    this.iconSrc,
    this.press,
    Key key,
  }) : super(key: key);
  final String iconSrc, name;
  final Function press;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: defaultSize * 2,
          vertical: defaultSize * 3,
        ),
        child: SafeArea(
          child: Row(
            children: [
              SvgPicture.asset(iconSrc),
              SizedBox(
                width: defaultSize * 2,
              ),
              Text(
                name,
                style:
                    TextStyle(fontSize: defaultSize * 1.6, color: kPrimaryColor),
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                size: defaultSize * 1.6,
                color: kTextColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
