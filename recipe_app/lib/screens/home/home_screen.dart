

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/components/my_bottom_nav_bar.dart';
import 'package:recipe_app/screens/home/components/body.dart';
import 'package:recipe_app/size_config.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
      bottomNavigationBar: MyBottomNavBar(),



    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/menu.svg"),
        onPressed: () {},
      ),
      centerTitle: true,
      title: SvgPicture.asset("assets/icons/logo.svg"),
      actions: [
        IconButton(
          icon: SvgPicture.asset("assets/icons/search.svg"),
          onPressed: () {},
        ),
        SizedBox(width: SizeConfig.defaultSize * 0.5),
      ],
    );
  }
}


