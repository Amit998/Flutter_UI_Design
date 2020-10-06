import 'package:e_commerce_ui/screens/complete_profile_page/components/body.dart';
import 'package:flutter/material.dart';


class CompleteProfileScreen extends StatelessWidget {
  static String routeName = "/complete_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Complete Your Profile"),
        centerTitle: true,
      ),
      body: Body(),
      
    );
  }
}