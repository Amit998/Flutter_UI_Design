import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';




class ItemCard extends StatelessWidget {
  final String title;
  final String shopName;
  final String svgPicture;
  final Function press;

  const ItemCard({
    Key key,
    this.title,
    this.shopName,
    this.svgPicture,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 10, right: 15, top: 20, bottom: 20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 20,
                  color: Color(0xFFB0CCE1).withOpacity(0.32),
                )
              ]
            ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: press,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 15),
                      padding: EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        color: kPrimaryColor.withOpacity(0.13),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        svgPicture,
                        width: size.width * 0.13,
                      ),
                    ),
                    Text(title),
                    SizedBox(height: 10),
                    Text(
                      shopName,
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
