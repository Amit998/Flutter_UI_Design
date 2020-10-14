import 'dart:async';
import 'dart:math';

import 'package:analog_clock/constants.dart';
import 'package:analog_clock/screens/components/clock.dart';
import 'package:analog_clock/screens/components/time_in_hour_and_minute.dart';
import 'package:analog_clock/size_config.dart';

import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Text("Kolkata | IND | IST",
                style: Theme.of(context).textTheme.bodyText1),
            TimeHourAndMinute(),
            Clock(),
          ],
        ),
      ),
    );
  }
}
