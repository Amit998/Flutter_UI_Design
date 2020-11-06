import 'package:calling_app_ui/components/roundButton.dart';

import 'package:calling_app_ui/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'dailUserPic.dart';
import 'dail_button.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Amit Dutta",
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(color: Colors.white),
            ),
            Text(
              "Calling...",
              style: TextStyle(color: Colors.white),
            ),
            VerticalSpacing(),
            DialUserPic(image: "assets/images/calling_face.png"),
            Spacer(),
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              children: [
                DailButton(
                  iconSrc: "assets/icons/Icon Mic.svg",
                  press: () {},
                  text: "Audio",
                ),
                DailButton(
                  iconSrc: "assets/icons/Icon Volume.svg",
                  press: () {},
                  text: "Volume",
                ),
                DailButton(
                  iconSrc: "assets/icons/Icon Video.svg",
                  press: () {},
                  text: "Video",
                ),
                DailButton(
                  iconSrc: "assets/icons/Icon Message.svg",
                  press: () {},
                  text: "Message",
                ),
                DailButton(
                  iconSrc: "assets/icons/Icon User.svg",
                  press: () {},
                  text: "User",
                ),
                DailButton(
                  iconSrc: "assets/icons/Icon Voicemail.svg",
                  press: () {},
                  text: "Voice Mail",
                ),
              ],
            ),
          VerticalSpacing(),
            RoundButton(
              color: Colors.red,
              iconImgSrc: "assets/icons/call_end.svg",
              iconColor: Colors.white,
              press: () {},
            )
          ],
        ),
      ),
    );
  }
}
