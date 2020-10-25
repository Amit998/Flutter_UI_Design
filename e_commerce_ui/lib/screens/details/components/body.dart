import 'package:e_commerce_ui/components/default_button.dart';
import 'package:e_commerce_ui/components/roundButton.dart';
import 'package:e_commerce_ui/constants.dart';
import 'package:e_commerce_ui/models/Product.dart';
import 'package:e_commerce_ui/screens/details/components/product_details.dart';
import 'package:e_commerce_ui/screens/details/components/product_image.dart';
import 'package:e_commerce_ui/screens/details/components/top_rounded_corner.dart';
import 'package:e_commerce_ui/size_config.dart';
import 'package:flutter/material.dart';

import 'color_dots.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductImage(product: product),
          TopRoundedContainer(
            color: Colors.white,
            child: ProductDescription(
              product: product,
              pressOnSeeMore: () {},
            ),
          ),
          TopRoundedContainer(
            color: Color(0xFFF6F7F9),
            child: ColorDots(product: product),
          ),
          TopRoundedContainer(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(
                left: SizeConfig.screenWidth * 0.10,
                right: SizeConfig.screenHeight * 0.10,
                top: getProportionScreenWidth(15),
                bottom: getProportionScreenWidth(40)
              ),
              child: DefaultButton(
                text: "Add To Cart",
                press: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}
