import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class IconBarWithCounter extends StatelessWidget {
  const IconBarWithCounter({
    Key key,
    @required this.svgSrc,
    this.numOfItem = 3,
    this.press,
  }) : super(key: key);
  final String svgSrc;
  final int numOfItem;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        child: Stack(
          overflow: Overflow.visible,
          children: [
            Container(
                padding: EdgeInsets.all(getProportionScreenWidth(10)),
                // margin: EdgeInsets.fromLTRB(40, 0, 0, 0),
                height: getProportionScreenHeight(46),
                width: getProportionScreenWidth(46),
                decoration: BoxDecoration(
                  color: kSecondaryColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(svgSrc)),
            if (numOfItem != 0)
              Positioned(
                right: 0,
                top: -3,
                child: Container(
                  height: getProportionScreenHeight(16),
                  width: getProportionScreenWidth(16),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                      border: Border.all(width: 1.5, color: Colors.white)),
                  child: Center(
                    child: Text(
                      '$numOfItem',
                      style: TextStyle(
                        fontSize: getProportionScreenWidth(10),
                        height: 1,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
