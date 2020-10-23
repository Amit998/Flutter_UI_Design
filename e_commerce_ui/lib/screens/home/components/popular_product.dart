import 'package:e_commerce_ui/models/Product.dart';
import 'package:e_commerce_ui/screens/details/details_screen.dart';
import 'package:e_commerce_ui/screens/home/components/product_card.dart';
import 'package:e_commerce_ui/screens/home/components/sectionTitle.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';

class PopularProduct extends StatelessWidget {
  const PopularProduct({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          text: "Popular Section",
          press: () {},
        ),
        SizedBox(
          height: getProportionScreenWidth(20),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(demoProducts.length, (index) {
                if (demoProducts[index].isPopular)
                  return ProductCard(
                    product: demoProducts[index],
                    press: () => Navigator.pushNamed(context, DetailScreen.routeName,arguments: ProductDetailsArgument(product: demoProducts[index])),
                  );
                return SizedBox.shrink();
              }),
              SizedBox(
                width: getProportionScreenWidth(20),
              )
            ],
          ),
        ),
      ],
    );
  }
}
