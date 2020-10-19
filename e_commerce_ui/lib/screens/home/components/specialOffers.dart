import 'package:e_commerce_ui/screens/home/components/sectionTitle.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';


class SpecialOffers extends StatelessWidget {
  const SpecialOffers({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
              text: "Special Offer For You",
              press: () {},
          ),
          SizedBox(
              height: getProportionScreenWidth(20),
          ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SpecialOfferCard(
                category: "Smart Phone\n",
                image: "assets/images/Image Banner 2.png",
                numOfBrands: 18,
                press: () {},
              ),
              SizedBox(width: 20),
              SpecialOfferCard(
                category: "Fashion\n",
                image: "assets/images/Image Banner 3.png",
                numOfBrands: 24,
                press: () {},
              ),
              SizedBox(width: 20),
              SpecialOfferCard(
                category: "Smart Phone\n",
                image: "assets/images/Image Banner 2.png",
                numOfBrands: 24,
                press: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key key,
    this.category,
    this.image,
    this.numOfBrands,
    this.press,
  }) : super(key: key);
  final String category, image;
  final int numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionScreenWidth(180),
      height: getProportionScreenHeight(100),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Image.asset(image, fit: BoxFit.cover),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Color(0xFF343434).withOpacity(0.4),
                  Color(0xFF343434).withOpacity(0.15),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionScreenWidth(15),
                  vertical: getProportionScreenHeight(10)
                  ),
              child: Text.rich(
                  TextSpan(style: TextStyle(color: Colors.white), children: [
                TextSpan(
                  text: category,
                  style: TextStyle(
                    fontSize: getProportionScreenWidth(18),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(text: "$numOfBrands Brands"),
              ])),
            ),
          ],
        ),
      ),
    );
  }
}
