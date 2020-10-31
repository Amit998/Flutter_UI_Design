import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ordering/constants.dart';

import 'package:food_ordering/screens/components/search_box.dart';


import 'components/category_list.dart';
import 'components/discount_card.dart';
import 'components/food_list.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
        children: [
          SearchBox(
            onChanged: (value) {},
          ),
          CategoryList(),
          FoodList(),
          DiscountCard(),
        ],
      ),
    );
  }
}
