import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';




class DiscountCard extends StatelessWidget {
  const DiscountCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Offers & Discounts",style: TextStyle(fontWeight: FontWeight.bold,color: kTextColor),
          ),
          Container(
            width: double.infinity,
            height: 166,
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage("assets/images/beyond-meat-mcdonalds.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                colors: [
                  Color(0xFFFF961F).withOpacity(0.7),
                  kPrimaryColor.withOpacity(0.7)
                ]
              )
            ),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                children: [
                  Expanded(
                    child: SvgPicture.asset("assets/icons/macdonalds.svg"),
                  ),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Get Discount of \n",
                            style: TextStyle(fontSize: 16),
                          ),
                          TextSpan(
                            text: "30% \n",
                            style: TextStyle(fontSize: 36,fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: "at MacDonald's on your first order & Instant Cashback",
                            style: TextStyle(fontSize: 10),
                          )
                        ],
                        
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ),


          )
        ],
      ),
    );
  }
}
