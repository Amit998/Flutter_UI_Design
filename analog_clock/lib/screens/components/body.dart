import 'dart:async';
import 'dart:math';

import 'package:analog_clock/constants.dart';
import 'package:analog_clock/screens/components/clock.dart';
import 'package:analog_clock/screens/components/time_in_hour_and_minute.dart';
import 'package:analog_clock/size_config.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'country_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Text("Kolkata | IND | IST",
                  style: Theme.of(context).textTheme.bodyText1),
              TimeHourAndMinute(),
              SizedBox(height: 20),
              Clock(),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                  CountryCard(
                    country: "New York , USA",
                    timezone: "+3 HRS | EST",
                    iconSrc: "assets/icons/Liberty.svg",
                    time: "9:20",
                    period: "AM",
                  ),
                  CountryCard(
                    country: "New York , USA",
                    timezone: "+3 HRS | EST",
                    iconSrc: "assets/icons/Liberty.svg",
                    time: "9:20",
                    period: "AM",
                  ),
                  CountryCard(
                    country: "New York , USA",
                    timezone: "+3 HRS | EST",
                    iconSrc: "assets/icons/Liberty.svg",
                    time: "9:20",
                    period: "AM",
                  ),
                ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
