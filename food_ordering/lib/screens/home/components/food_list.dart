import 'package:flutter/material.dart';
import 'package:food_ordering/screens/details/details.dart';

import 'food_card.dart';

class FoodList extends StatelessWidget {
  const FoodList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ItemCard(
            title: "Burger & Beer",
            shopName: "MacDonald's",
            svgPicture: "assets/icons/burger_beer.svg",
            press: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DetailsScreen()));
            },
          ),
          ItemCard(
            title: "Burger & Beer",
            shopName: "MacDonald's",
            svgPicture: "assets/icons/burger_beer.svg",
            press: () {},
          ),
          ItemCard(
            title: "Burger & Beer",
            shopName: "MacDonald's",
            svgPicture: "assets/icons/burger_beer.svg",
            press: () {},
          ),
          ItemCard(
            title: "Burger & Beer",
            shopName: "MacDonald's",
            svgPicture: "assets/icons/burger_beer.svg",
            press: () {},
          ),
        ],
      ),
    );
  }
}
