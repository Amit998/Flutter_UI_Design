import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/screens/details/details_screen.dart';

class RecomendedPlants extends StatelessWidget {
  const RecomendedPlants({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          RecomendedPlantCard(
            image: "assets/images/image_1.png",
            title: "Samantha",
            country: "Russia",
            press: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (contex) => DetailScreen()));
            },
            price: 440,
          ),
          RecomendedPlantCard(
            image: "assets/images/image_2.png",
            title: "Samantha",
            country: "Russia",
            press: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (contex) => DetailScreen()));
            },
            price: 440,
          ),
          RecomendedPlantCard(
            image: "assets/images/image_3.png",
            title: "Samantha",
            country: "Russia",
            press: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (contex) => DetailScreen()));
            },
            price: 440,
          ),
          RecomendedPlantCard(
            image: "assets/images/image_1.png",
            title: "Samantha",
            country: "Russia",
            press: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (contex) => DetailScreen()));
            },
            price: 440,
          ),
        ],
      ),
    );
  }
}

class RecomendedPlantCard extends StatelessWidget {
  const RecomendedPlantCard({
    Key key,
    this.image,
    this.title,
    this.country,
    this.price,
    this.press,
  }) : super(key: key);
  final String image, title, country;
  final int price;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
          left: kDefaultPadding / 2,
          bottom: kDefaultPadding * 2.5,
          top: kDefaultPadding),
      width: size.width * 0.4,
      child: Column(
        children: [
          Image.asset(image),
          GestureDetector(
            onTap: press,
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: kPrimaryColor.withOpacity(0.23))
                  ]),
              child: Row(
                children: [
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "${title}\n".toUpperCase(),
                        style: Theme.of(context).textTheme.button),
                    TextSpan(
                        text: country.toUpperCase(),
                        style:
                            TextStyle(color: kPrimaryColor.withOpacity(0.5))),
                  ])),
                  Spacer(),
                  Text(
                    "\$${price}.0",
                    maxLines: 1,
                    style: Theme.of(context)
                        .textTheme
                        .button
                        .copyWith(color: kPrimaryColor),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
