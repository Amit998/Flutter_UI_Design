import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:layout_basic/app/common_widgets/custom_raised_button.dart';

class SocialSignInButton extends CustomRaisedButton {
  SocialSignInButton({
    String assetName,
    String text,
    Color color,
    Color textColor,
    VoidCallback onPressed,
  }) : super(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.asset(assetName),
              Text(
                text,
                style: TextStyle(color: textColor,fontSize: 15.0
                ),
              ),
              Opacity(
                child: Image.asset(assetName),
                opacity: 0.0,
            ),
        ],
      ),
    color: color,
    onPressed: onPressed,
  );
}
