import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipe_app/models/recipeBundle.dart';

import '../../../size_config.dart';

class RecipeBundleCard extends StatelessWidget {
  final RecipeBundle recipeBundle;
  final press;

  const RecipeBundleCard({Key key, this.recipeBundle, this.press}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return GestureDetector(
      onTap: press,
      child: Container(
        child: AspectRatio(
          aspectRatio: 1.6,
          child: Container(
            decoration: BoxDecoration(
              color: recipeBundle.color,
              borderRadius: BorderRadius.circular(defaultSize * 1.8),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(defaultSize * 2),
                    child: Column(
                      children: [
                        Spacer(),
                        Text(
                          recipeBundle.title,
                          style: TextStyle(
                            fontSize: defaultSize * 2.2,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: defaultSize * 0.5),
                        Text(
                          recipeBundle.description,
                          style: TextStyle(color: Colors.white60),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Spacer(),
                        buildInfoRow(defaultSize,
                            iconSrc: "assets/icons/chef.svg",
                            text: "${recipeBundle.chefs} Chefs"),
                        SizedBox(height: defaultSize * 0.5),
                        buildInfoRow(defaultSize,
                            iconSrc: "assets/icons/pot.svg",
                            text: "${recipeBundle.recipes} Chefs"),
                        Spacer()
                      ],
                    ),
                  ),
                ),
                SizedBox(width: defaultSize * 0.5),
                AspectRatio(
                  aspectRatio: 0.71,
                  child: Image.asset(
                    recipeBundle.imgScr,
                    fit: BoxFit.cover,
                    alignment: Alignment.centerLeft,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row buildInfoRow(double defaultSize, {String iconSrc, text}) {
    return Row(
      children: [
        SvgPicture.asset(iconSrc),
        SizedBox(width: defaultSize),
        Text(
          text,
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
