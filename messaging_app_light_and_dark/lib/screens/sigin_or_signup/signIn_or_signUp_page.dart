import 'package:flutter/material.dart';
import 'package:messaging_app_light_and_dark/components/primary_button.dart';
import 'package:messaging_app_light_and_dark/constants.dart';

class SignIn_or_SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            children: [
              Spacer(),
              Image.asset(
                MediaQuery.of(context).platformBrightness == Brightness.light
                    ? "assets/images/Logo_light.png"
                    : "assets/images/Logo_dark.png",
                height: 146,
              ),
              Spacer(),
              PrimaryButton(text: "Sign In", press: () {}),
              SizedBox(
                height: 10,
              ),
              SizedBox(height: 10),
              PrimaryButton(
                text: "Sign Up",
                press: () {},
                color: Theme.of(context).colorScheme.secondary,
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
