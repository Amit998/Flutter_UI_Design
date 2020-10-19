import 'package:e_commerce_ui/models/Product.dart';
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
              ...List.generate(
                  demoProducts.length,
                  (index) => ProductCard(
                        product: demoProducts[index],
                      )
              ),
              SizedBox(width: getProportionScreenWidth(20),)
            ],
          ),
        ),
      ],
    );
  }
}
