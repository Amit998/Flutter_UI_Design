import 'package:calling_app_ui/size_config.dart';

import 'components/body.dart';
import 'package:calling_app_ui/constants.dart';
import 'package:flutter/material.dart';

class DailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kBackgoundColor,
      body: Body(),
    );
  }
}
