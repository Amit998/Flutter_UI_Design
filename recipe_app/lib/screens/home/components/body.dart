import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipeBundle.dart';
import 'package:recipe_app/size_config.dart';

import 'RecipeBundleCard.dart';
import 'categories.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Categories(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize),
              child: GridView.builder(
                itemCount: recipeBundle.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      SizeConfig.orientation == Orientation.landscape ? 2 : 1,
                  mainAxisSpacing: 20,
                  crossAxisSpacing:
                      SizeConfig.orientation == Orientation.landscape
                          ? SizeConfig.defaultSize * 2
                          : 0,
                  childAspectRatio: 1.65,
                ),
                itemBuilder: (context, index) => RecipeBundleCard(
                  recipeBundle: recipeBundle[index],
                  press: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
