import 'package:e_commerce_ui/constants.dart';
import 'package:e_commerce_ui/screens/sign_in/sign_in_screen.dart';
// import 'package:e_commerce_ui/screens/spalsh/splash_screen.dart';
import 'package:e_commerce_ui/size_config.dart';
import 'package:flutter/material.dart';
import './splash_content.dart';
// import '../../components/default_button.dart';
import '../../../components/default_button.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "image": "assets/images/splash_1.png",
      "text": "Welcome Tokoto Let's Start To Shop"
    },
    {
      "text":
          "We Help People connect With Store \naround United State Of America",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "We Show The Wasy Way To Shop \nJust Stay Home With Us",
      "image": "assets/images/splash_3.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: splashData.length,
                  itemBuilder: (context, index) => SplashContent(
                    image: splashData[index]["image"],
                    text: splashData[index]["text"],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionScreenWidth(20)),
                  child: Column(
                    children: [
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            splashData.length, (index) => buildDot(index: index)),
                      ),
                      Spacer(),
                      DefaultButton(
                          text: "Continue",
                          press: () {
                            Navigator.pushNamed(context, SignInScreen.routeName);
                          }),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
