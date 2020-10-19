import 'package:e_commerce_ui/constants.dart';
import 'package:e_commerce_ui/screens/home/components/searchField.dart';
import 'package:e_commerce_ui/screens/home/components/sectionTitle.dart';
import 'package:e_commerce_ui/screens/home/components/specialOffers.dart';
import 'package:e_commerce_ui/screens/login_success/components/icon_btn_with_search.dart';
import 'package:e_commerce_ui/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'categories.dart';
import 'discount_banner.dart';
import 'homeHeader.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: getProportionScreenWidth(20),
            ),
            HomeHeader(),
            SizedBox(
              height: getProportionScreenWidth(20),
            ),
            DiscountBanner(),
            SizedBox(
              height: getProportionScreenWidth(20),
            ),
            Categories(),
            SizedBox(
              height: getProportionScreenWidth(20),
            ),
            SpecialOffers(),
            SizedBox(
              height: getProportionScreenWidth(20),
            ),
            SectionTitle(text: "Popular Section",press: () {
              
            },)

          ],
        ),
      ),
    );
  }
}
