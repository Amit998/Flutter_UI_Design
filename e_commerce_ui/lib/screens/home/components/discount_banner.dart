import 'package:flutter/material.dart';

import '../../../size_config.dart';


class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin: EdgeInsets.symmetric(horizontal: getProportionScreenWidth(20)),
      padding: EdgeInsets.symmetric(horizontal: getProportionScreenWidth(20),vertical: getProportionScreenHeight(20)),
      width: double.infinity,
      height: 90,
      decoration: BoxDecoration(
        color: Color(0xFF4A3298),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text.rich(
        TextSpan(
          text: "A Summer Surprice \n",
          style: TextStyle(color: Colors.white),
          children: [
          TextSpan(
            text: "Cashback 20%",
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)

            )
          ]
        )
      ),
      
    );
  }
}
