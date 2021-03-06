import 'package:e_commerce_ui/components/default_button.dart';
import 'package:e_commerce_ui/screens/home/home_screen.dart';
import 'package:e_commerce_ui/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight * 0.04),
          Image.asset(
            "assets/images/success.png",
            // height: SizeConfig.screenHeight * 0.4,
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.08),
          Text(
            "Login Success",
            style: TextStyle(
              fontSize: getProportionScreenWidth(30),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: getProportionScreenHeight(40)),
          SizedBox(
            width: SizeConfig.screenWidth * 0.6,
            child: DefaultButton(
              text: "Back To Home",
              press: () => Navigator.pushNamed(context, HomeScreen.routeName),
            ),
          ),
        ],
      ),
    );
  }
}
