import 'package:flutter/material.dart';
import '../size_config.dart';
import '../constants.dart';
import '../screens/forgot_Password/forgot_password.dart';

class NotAccountText extends StatelessWidget {
  const NotAccountText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't Have an Account? ",
          style: TextStyle(fontSize: getProportionScreenHeight(16)),
        ),
        GestureDetector(
          onTap: () {

          },  
          child: Text(
            "Sign In",
            style: TextStyle(
                fontSize: getProportionScreenHeight(16), color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
