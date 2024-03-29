import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:travel_ui_app_2/constants/color_constant.dart';
import 'package:travel_ui_app_2/constants/style_constant.dart';
import 'package:travel_ui_app_2/models/carousel_model.dart';
import 'package:travel_ui_app_2/screens/BottomNavigationTravelApp.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];

    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mBackgroundColor,
        title: SvgPicture.asset("assets/svg/travelkuy_logo.svg"),
        elevation: 0,
      ),
      backgroundColor: mBackgroundColor,
      bottomNavigationBar: BottomNavigationTravelApp(),
      body: Container(
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16, bottom: 16),
              child: Text(
                "Hi Franklin This Promos for you!",
                style: mTitleStyle,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 16, right: 16),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 190,
                    child: Swiper(
                      onIndexChanged: (index) {
                        setState(() {
                          _current = index;
                        });
                      },
                      autoplay: true,
                      layout: SwiperLayout.DEFAULT,
                      itemCount: carousels.length,
                      itemBuilder: (BuildContext context, index) {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image: AssetImage(
                                    carousels[index].image,
                                  ),
                                  fit: BoxFit.cover)),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                          children: map(carousels, (index, image) {
                        return Container(
                          alignment: Alignment.centerLeft,
                          height: 6,
                          width: 6,
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  _current == index ? mBlueColor : mGreyColor),
                        );
                      })),
                      Text(
                        "More...",
                        style: mMoreDiscountStyle,
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, bottom: 24),
              child: Text("Let\'s Booking", style: mTitleStyle),
            ),
            Container(
              height: 144,
              margin: EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 8),
                    padding: EdgeInsets.only(left: 16),
                    height: 64,
                    decoration: BoxDecoration(
                      color: mFillColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: mBorderColor,
                        width: 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/svg/service_flight_icon.svg",
                          fit: BoxFit.contain,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Flight",
                                style: mServiceSubtitleStyle,
                              ),
                              Text(
                                "Feel Feedom",
                                style: mServiceSubtitleStyle,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 8),
                    padding: EdgeInsets.only(left: 16),
                    height: 64,
                    decoration: BoxDecoration(
                      color: mFillColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: mBorderColor,
                        width: 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/svg/service_flight_icon.svg",
                          fit: BoxFit.contain,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Flight",
                                style: mServiceSubtitleStyle,
                              ),
                              Text(
                                "Feel Feedom",
                                style: mServiceSubtitleStyle,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
