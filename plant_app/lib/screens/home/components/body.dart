import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/screens/home/components/featurePlants.dart';
import 'package:plant_app/screens/home/components/header_with_searchbox.dart';
import 'package:plant_app/screens/home/components/recomended_plant.dart';
import 'package:plant_app/screens/home/components/title_with_button.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderWithSearchBox(size: size),
          TitleWithMoreButton(
            buttonTitle: "More",
            title: "Recomended",
            press: () {},
          ),
          RecomendedPlants(),
          TitleWithMoreButton(
            title: "Featured Plants",
            press: () {},
          ),
          FeaturePlants(),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
    
  }
}
