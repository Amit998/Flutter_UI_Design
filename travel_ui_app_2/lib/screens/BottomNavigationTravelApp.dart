import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_ui_app_2/constants/color_constant.dart';

class BottomNavigationTravelApp extends StatefulWidget {
  @override
  _BottomNavigationTravelAppState createState() =>
      _BottomNavigationTravelAppState();
}

class _BottomNavigationTravelAppState extends State<BottomNavigationTravelApp> {
  int _selectedIndex = 0;

  var bottomTextStyle = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  void _onItemTappped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
          color: mFillColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 15,
              offset: Offset(0, 5),
            )
          ],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24))),
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              title: Text(
                "Home",
                style: bottomTextStyle,
              ),
              icon: _selectedIndex == 0
                  ? new SvgPicture.asset("assets/icons/home_colored.svg")
                  : new SvgPicture.asset("assets/icons/home.svg")),
          BottomNavigationBarItem(
              title: Text(
                "Home",
                style: bottomTextStyle,
              ),
              icon: _selectedIndex == 1
                  ? new SvgPicture.asset("assets/icons/watch_colored.svg")
                  : new SvgPicture.asset("assets/icons/watch.svg")),
          BottomNavigationBarItem(
              title: Text(
                "Home",
                style: bottomTextStyle,
              ),
              icon: _selectedIndex == 2
                  ? new SvgPicture.asset("assets/icons/order_colored.svg")
                  : new SvgPicture.asset("assets/icons/order.svg")),
          BottomNavigationBarItem(
              title: Text(
                "Home",
                style: bottomTextStyle,
              ),
              icon: _selectedIndex == 4
                  ? new SvgPicture.asset("assets/icons/account_colored.svg")
                  : new SvgPicture.asset("assets/icons/account.svg"))
        ],
        
        currentIndex: _selectedIndex,
        selectedItemColor: mBlueColor,
        unselectedItemColor: mSubtitleColor,
        onTap: _onItemTappped,
        backgroundColor: Colors.transparent,
        selectedFontSize: 12,
        showSelectedLabels: true,
        
        elevation: 0,
      ),
    );
  }
}
