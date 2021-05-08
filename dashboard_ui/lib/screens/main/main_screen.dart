import 'package:dashboard_ui/screens/dashboard/dashboard_screens.dart';
import 'package:dashboard_ui/screens/main/components/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              // It take default flex 1
              child: SideMenu(),
            ),
            Expanded(
                // It Takes 5/6 part of the screen
                flex: 5,
                child: DashboardScreen())
          ],
        ),
      ),
    );
  }
}
