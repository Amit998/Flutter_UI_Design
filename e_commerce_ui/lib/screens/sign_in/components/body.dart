import 'package:e_commerce_ui/components/default_button.dart';
import 'package:e_commerce_ui/constants.dart';
import 'package:e_commerce_ui/screens/forgot_Password/forgot_password.dart';
import 'package:e_commerce_ui/size_config.dart';
import 'package:flutter/material.dart';

import '../components/sign_in_form.dart';
import '../../../components/social_card.dart';
import '../../../components/no_account.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Sign In With Your Email and Password \nor continue with social media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
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
                SizedBox(height: getProportionScreenHeight(20)),
                NotAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
