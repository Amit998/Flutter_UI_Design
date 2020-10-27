import 'package:e_commerce_ui/components/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';
import '../../../size_config.dart';





class CheckOutCart extends StatelessWidget {
  const CheckOutCart({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionScreenWidth(15),
        horizontal: getProportionScreenWidth(30)
      ),
      height: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            offset: Offset(0,-15),
            color: Color(0xFFDADADA).withOpacity(0.15),
            blurRadius: 20
          )
        ]
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  height: getProportionScreenWidth(40),
                  width: getProportionScreenWidth(40),
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F6f9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset("assets/icons/receipt.svg"),
                ),
                Spacer(),
                Text("Add Voucher Code"),
                SizedBox(width: 10),
                Icon(Icons.arrow_forward,size: 12,color: kTextColor),

              ],
            ),
            SizedBox(height: getProportionScreenWidth(20)),
            Row(
              children: [
                Text.rich(
                  TextSpan(
                    text: "Total:\n",
                    children: [
                      TextSpan(
                        text: "\$33.15",
                        style: TextStyle(fontSize: 16,color: Colors.black)
                      )
                    ]
                  )
                ),
                Spacer(),
                SizedBox(
                  width: getProportionScreenWidth(200),
                  child: DefaultButton(
                  text: "Check Out",
                  press: (){},
                ),
               ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
