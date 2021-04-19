import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';

class TitleWithPrice extends StatelessWidget {
  const TitleWithPrice({
    Key key,
    @required this.price,
    @required this.name,
    @required this.country,
  }) : super(key: key);
  final int price;
  final String name, country;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        children: [
          RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: "${name}\n",
                  style: Theme.of(context).textTheme.headline4.copyWith(
                      color: kTextColor, fontWeight: FontWeight.bold)),
              TextSpan(
                  text: "${country}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: kPrimaryColor.withOpacity(0.53)))
            ]),
          ),
          Spacer(),
          Text("\$${price}",
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(color: kPrimaryColor)),
        ],
      ),
    );
  }
}
