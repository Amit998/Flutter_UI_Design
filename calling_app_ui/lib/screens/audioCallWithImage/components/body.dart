import 'package:calling_app_ui/components/roundButton.dart';
import 'package:calling_app_ui/constants.dart';
import 'package:calling_app_ui/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          "assets/images/full_image.png",
          fit: BoxFit.cover,
        ),
        DecoratedBox(
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.3)),
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Amit \nDutta",
                    style: Theme.of(context)
                        .textTheme
                        .headline3
                        .copyWith(color: Colors.white)),
                VerticalSpacing(of: 10),
                Text(
                  "Incoming 00:03".toUpperCase(),
                  style: TextStyle(color: Colors.white60),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RoundButton(
                      iconImgSrc: "assets/icons/Icon Mic.svg",
                      press: () {},
                      color: Colors.white,
                      iconColor: Colors.black,
                    ),
                    RoundButton(
                      iconImgSrc: "assets/icons/call_end.svg",
                      press: () {},
                      color: Colors.red,
                      iconColor: Colors.white,
                    ),
                    RoundButton(
                      iconImgSrc: "assets/icons/Icon Volume.svg",
                      press: () {},
                      color: Colors.white,
                      iconColor: Colors.black,
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
