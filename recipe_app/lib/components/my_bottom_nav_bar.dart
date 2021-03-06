import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/models/newItem.dart';
import 'package:recipe_app/size_config.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return Consumer<NavItems>(
      builder: (context, navItems, child) => Container(
        padding: EdgeInsets.symmetric(horizontal: defaultSize * 3),
        // height: 80,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            offset: Offset(0, -7),
            blurRadius: 30,
            color: Color(0xFF4B1A39).withOpacity(0.2),
          )
        ]),
        child: SafeArea(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                navItems.items.length,
                (index) => buildnavBarItem(
                  icon: navItems.items[index].icon,
                  press: () {
                    navItems.navItemsChanger(index: index);
                    if (navItems.items[index].destinationChecker())
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => navItems.items[index].destination
                      )
                    );
                  },
                  isActive: navItems.selectedIndex == index ? true : false,
                ),
              )),
        ),
      ),
    );
  }

  IconButton buildnavBarItem({String icon, Function press, bool isActive}) {
    return IconButton(
      icon: SvgPicture.asset(icon,
          color: isActive ? kPrimaryColor : Color(0xFFD1D4D4)),
      onPressed: press,
    );
  }
}
