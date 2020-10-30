import 'package:flutter/material.dart';

import 'package:food_ordering/screens/components/search_box.dart';


import 'components/category_list.dart';
import 'components/food_list.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchBox(
          onChanged: (value) {},
        ),
        CategoryList(),
        FoodList(),
        
      ],
    );
  }
}
