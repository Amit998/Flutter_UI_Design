import 'package:e_commerce_ui/components/default_button.dart';
import 'package:e_commerce_ui/constants.dart';
import 'package:e_commerce_ui/models/Cart.dart';
import 'package:e_commerce_ui/screens/cart/components/body.dart';
import 'package:e_commerce_ui/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'components/check_out_cart.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: cartAppBar(context),
      body: Body(),
      bottomNavigationBar: CheckOutCart(),
    );
  }

  AppBar cartAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Column(
        children: [
          Text(
            "Your Cart",
            style: TextStyle(color: Colors.black, fontSize: 20.0),
          ),
          Text(
            " ${demoCarts.length } Items",
            style: Theme.of(context).textTheme.caption,
          ),

        ],
      ),
    );
  }
}
