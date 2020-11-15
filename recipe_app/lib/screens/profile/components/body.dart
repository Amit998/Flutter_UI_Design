import 'package:flutter/material.dart';

import 'package:recipe_app/screens/profile/components/profile_menu_item.dart';
import 'package:recipe_app/size_config.dart';

import 'info.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return SingleChildScrollView(
      child: Column(
        children: [
          Info(
            name: "Jhon Doe",
            email: "JhonDoe@gmail.com",
            image: "assets/images/pic.png",
          ),
          SizedBox(height: defaultSize * 5),
          ProfileMenuItem(
            name: "Saved Recipies",
            press: (){},
            iconSrc: "assets/icons/bookmark_fill.svg"
          ),
          ProfileMenuItem(
            name: "Super Plan",
            press: (){},
            iconSrc: "assets/icons/chef_color.svg"
          ),
          ProfileMenuItem(
            name: "Change Language",
            press: (){},
            iconSrc: "assets/icons/language.svg"
          ),
          ProfileMenuItem(
            name: "Help",
            press: (){},
            iconSrc: "assets/icons/info.svg"
          ),
            
          
        ],
      ),
    );
  }
}
