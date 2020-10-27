import 'package:e_commerce_ui/screens/cart/cart_screen.dart';
import 'package:e_commerce_ui/screens/home/components/searchField.dart';
import 'package:e_commerce_ui/screens/login_success/components/icon_btn_with_search.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionScreenWidth(20),
        // vertical: getProportionScreenHeight(10)
      ),
      child: Row(
        children: [
          SearchField(),
          IconBarWithCounter(
            svgSrc: "assets/icons/Cart Icon.svg",
            numOfItem: 4,
            press: () => Navigator.pushNamed(context, CartScreen.routeName),
          ),
          IconBarWithCounter(
            svgSrc: "assets/icons/Bell.svg",
            numOfItem: 4,
          ),
        ],
      ),
    );
  }
}
