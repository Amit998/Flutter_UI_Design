import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:social_media_app/pages/home_page.dart';
import 'package:social_media_app/theme/colors.dart';

import 'dart:math' as math;

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int activeTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: getFooter(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: getFloatingButton(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: activeTab,
      children: [
        Center(
          child: HomePage()
        ),
        Center(
          child: Text("Chat"),
        ),
        Center(
          child: Text("Upload"),
        ),
        Center(
          child: Text("Save"),
        ),
        Center(
          child: Text("Profile"),
        ),
      ],
    );
  }

  Widget getFloatingButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          activeTab = 2;
        });
      },
      child: Transform.rotate(
        angle: -math.pi / 4,
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 15,
                offset: Offset(0, 1))
          ], color: black, borderRadius: BorderRadius.circular(23)),
          child: Transform.rotate(
            angle: -math.pi / 4,
            child: Center(
              child: Icon(
                Ionicons.md_add_circle_outline,
                color: white,
                size: 26,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getFooter() {
    return Container(
      width: double.infinity,
      height: 90,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 20,
            offset: Offset(0, 1),
          )
        ],
        borderRadius: BorderRadius.circular(20),
        color: white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  activeTab = 0;
                });
              },
              child: Icon(
                Feather.home,
                size: 25,
                color: activeTab == 0 ? primary : black,
              ),
            ),
            SizedBox(
              width: 30,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  activeTab = 1;
                });
              },
              child: Icon(
                MaterialIcons.chat_bubble_outline,
                size: 25,
                color: activeTab == 1 ? primary : black,
              ),
            ),
            SizedBox(
              width: 30,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  activeTab = 3;
                });
              },
              child: Icon(
                Feather.heart,
                size: 25,
                color: activeTab == 3 ? primary : black,
              ),
            ),
            SizedBox(
              width: 40,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  activeTab = 4;
                });
              },
              child: Icon(
                MaterialIcons.account_circle,
                size: 25,
                color: activeTab == 4 ? primary : black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
