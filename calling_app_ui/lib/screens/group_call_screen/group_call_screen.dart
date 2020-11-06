import 'package:calling_app_ui/components/roundButton.dart';
import 'package:calling_app_ui/constants.dart';
import 'package:calling_app_ui/screens/group_call_screen/components/body.dart';
import 'package:calling_app_ui/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GroupCallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
      backgroundColor: kBackgoundColor,
      bottomNavigationBar: buildBottomNavBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/Icon Back.svg"),
        onPressed: () {},
      ),
      actions: [
        IconButton(
            icon: SvgPicture.asset("assets/icons/Icon User.svg",height: 24,),
            onPressed: () {}
        ),
      ],
    );
  }

  Container buildBottomNavBar() {
    return Container(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Row(
            children: [
              RoundButton(
                size: 48,
                iconImgSrc: "assets/icons/Icon Close.svg",
                color: kRedColor,
                iconColor: Colors.white,
                press: () {},
              ),
              Spacer(flex: 3),
              RoundButton(
                size: 48,
                iconImgSrc: "assets/icons/Icon Mic.svg",
                color: Color(0xFF2C384D),
                iconColor: Colors.white,
                press: () {},
              ),
              Spacer(),
              RoundButton(
                size: 48,
                iconImgSrc: "assets/icons/Icon Video.svg",
                color: Color(0xFF2C384D),
                iconColor: Colors.white,
                press: () {},
              ),
              Spacer(),
              RoundButton(
                size: 48,
                iconImgSrc: "assets/icons/Icon Volume.svg",
                color: Color(0xFF2C384D),
                iconColor: Colors.white,
                press: () {},
              ),
              Spacer(),
              RoundButton(
                size: 48,
                iconImgSrc: "assets/icons/Icon Mic.svg",
                color: Color(0xFF2C384D),
                iconColor: Colors.white,
                press: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
