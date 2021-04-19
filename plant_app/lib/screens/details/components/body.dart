import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/screens/details/components/doublebutton.dart';
import 'package:plant_app/screens/details/components/icon_card.dart';
import 'package:plant_app/screens/details/components/imageAndIcons.dart';
import 'package:plant_app/screens/details/components/titlewithPrice.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          ImageAndIcons(),
          TitleWithPrice(
            price: 400,
            name: "Anglica",
            country: "Russia",
          ),
          SizedBox(
            height: 10,
          ),
          DoubleButton(size: size),
          SizedBox(
            height: kDefaultPadding,
          )
        ],
      ),
    );
  }
}
