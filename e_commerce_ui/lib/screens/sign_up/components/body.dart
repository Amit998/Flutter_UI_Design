
import 'package:e_commerce_ui/components/social_card.dart';
import 'package:e_commerce_ui/size_config.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import './sign_up_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.03),
              Text(
                "Register Account",
                style: headingStyle,
              ),
              Text(
                "Complete Your Details continue \nwith Social Media",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.07),
              SignUpForm(),

              SizedBox(height: SizeConfig.screenHeight * 0.07),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialCard(
                      icon: "assets/icons/google-icon.svg", press: () {}),
                  SocialCard(
                      icon: "assets/icons/facebook-2.svg", press: () {}),
                  SocialCard(icon: "assets/icons/twitter.svg", press: () {}),
                ],
              ),
              SizedBox(height: getProportionScreenHeight(20),),
              Text("By Continuing Your Confirm That You Agree \nwith Our Term and Condition",
              textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.07),

            ],  
          ),
        ),
      ),
    );
  }
}
