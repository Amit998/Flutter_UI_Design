import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ordering/constants.dart';
import 'package:food_ordering/screens/details/components/title_price_rating.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import 'OrderButton.dart';

class ItemInfo extends StatelessWidget {
  const ItemInfo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      child: SingleChildScrollView(
      child: Column(
          children: [
            shopName(name: "MacDonalds"),
            TitlePriceRating(
              size: size,
              name: "Chease Burger",
              numOfReview: 24,
              price: 14,
              rating: 4,
              onRatingChange: (rating) {
              },
            ),
            Text(
              "As shown in the above figure, each point in the graphic represents using (x,y) coordinate. x represents a horizontal axis and y represents the vertical axis. The drawing path starts from the top-left corner and it is (0,0).",
              style: TextStyle(
                height: 1.5,
                letterSpacing: 1.2
              ),
            ),
            SizedBox(height: size.height * 0.030),
            OrderButton(size: size),
            SizedBox(height: size.height * 0.040),

          ],
        ),
      ),
    );
  }

  Row shopName({String name}) {
    return Row(
      children: [
        Icon(Icons.location_on, color: ksecondaryColor),
        SizedBox(width: 10),
        Text(name),
      ],
    );
  }
}
