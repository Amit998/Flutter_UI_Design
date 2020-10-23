import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../size_config.dart';



class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/Flash Icon.svg", "text": "Flash Deal"},
      {"icon": "assets/icons/Bill Icon.svg", "text": "Bill"},
      {"icon": "assets/icons/Game Icon.svg", "text": "Game"},
      {"icon": "assets/icons/Gift Icon.svg", "text": "Daily Gift"},
      {"icon": "assets/icons/Discover.svg", "text": "More"},
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List.generate(categories.length, (index) => CateroriesCard( icon: categories[index]["icon"],text: categories[index]["text"],press: () {
            
          }, ))
        ],
      ),
    );
  }
}

class CateroriesCard extends StatelessWidget {
  const CateroriesCard({
    Key key,
    this.icon, this.text, this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionScreenWidth(55),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                padding: EdgeInsets.all(getProportionScreenWidth(15)),
                decoration: BoxDecoration(
                  color: Color(0xFFFFFECDF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset(icon),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "$text",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
