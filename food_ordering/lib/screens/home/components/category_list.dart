

import 'package:flutter/material.dart';

import 'categoris_item.dart';


class CategoryList extends StatelessWidget {
  const CategoryList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategortItem(
            title: 'Combo Meal',
            isActive: true,
            press: () {},
          ),

          CategortItem(
            title: 'Chicken',
            isActive: false,
            press: () {},
          ),

          CategortItem(
            title: 'Bevarages',
            isActive: false,
            press: () {},
          ),
          CategortItem(
            title: 'Snaks And Sides',
            isActive: false,
            press: () {},
          ),
        ],
      ),
    );
  }
}
