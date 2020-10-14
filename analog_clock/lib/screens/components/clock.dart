import 'dart:async';
import 'dart:math';

import 'package:analog_clock/screens/components/clock_pointer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants.dart';
import '../../size_config.dart';

class Clock extends StatefulWidget {
  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  DateTime _dateTime = DateTime.now();
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _dateTime = DateTime.now();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 0),
                      color: kShadowColor.withOpacity(0.14),
                      blurRadius: 64,
                    )
                  ]),
              child: Transform.rotate(
                angle: -pi / 2,
                child: CustomPaint(
                  painter: ClockPointer(context, _dateTime),
                ),
              ),
            ),
          ),
        ),
        Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: SvgPicture.asset("assets/icons/Sun.svg",height: 24,width: 24,color: Theme.of(context).primaryColor,),
            ),
      ],
    );
  }
}
