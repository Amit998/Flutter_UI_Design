import 'package:e_commerce_ui/components/custom_surfix_icon.dart';
import 'package:e_commerce_ui/components/default_button.dart';
import 'package:e_commerce_ui/components/form_error.dart';
import 'package:e_commerce_ui/constants.dart';
import 'package:e_commerce_ui/size_config.dart';
import 'package:flutter/material.dart';
import 'complete_profile_form.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight * 0.05,),
            Text(
              "Complete Profile",
              style: headingStyle,
            ),
            Text(
              "Complete Your Details or Coontinue \nWith Social Media",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.05,),
            CompleteProfileForm(),
            SizedBox(height: getProportionScreenHeight(20),),

            Text("By Continuing Your Confirm That You Agree \nwith our Term and Condition",textAlign: TextAlign.center,),
          ],
        ),
      ),
    );
  }
}
