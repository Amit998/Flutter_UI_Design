import 'package:e_commerce_ui/components/default_button.dart';
import 'package:e_commerce_ui/constants.dart';
import 'package:e_commerce_ui/size_config.dart';
import 'package:flutter/material.dart';
import './otp_form.dart';


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
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              Text(
                "OTP Verificatrion ",
                style: headingStyle,
              ),
              Text("We Sent You Your Code +91 747815****"),
              buildTimer(),
              SizedBox(height: SizeConfig.screenHeight * 0.15),
              OTPForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.01),
              GestureDetector(
                onTap: (){},
                child: Text("Resent OTP Code",style: TextStyle(decoration: TextDecoration.underline),),

              ),
              
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("This Code Will BE Expired in "),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0),
          duration: Duration(seconds: 30),
          builder: (context, value, child) => Text(
            "${value.toInt()}",
            style: TextStyle(color: kPrimaryColor),
          ),
          onEnd: () {},
        ),
      ],
    );
  }
}
