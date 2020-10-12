import 'dart:async';

import 'package:analog_clock/constants.dart';
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

class Clock extends StatefulWidget {
  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
          child: CustomPaint(
            painter: ClockPointer(context),
          ),
        ),
      ),
    );
  }
}

class ClockPointer extends CustomPainter {
  final BuildContext context;

  ClockPointer(this.context);
  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    Offset center = Offset(centerX, centerY);

    // Minutes Line

     canvas.drawLine(center, Offset(40, 180),
        Paint()..color = Theme.of(context).accentColor..style=PaintingStyle.stroke..strokeWidth=5);

    // For Seconds Line

    canvas.drawLine(center, Offset(80, 150),
        Paint()..color = Theme.of(context).colorScheme.secondary..style=PaintingStyle.stroke..strokeWidth=10);

    // For Hour Lines

    canvas.drawLine(center, Offset(90, 200),
        Paint()..color = Theme.of(context).primaryColor);

    // For dots

    Paint dotPainter = Paint()
      ..color = Theme.of(context).primaryIconTheme.color;

    canvas.drawCircle(center, 24, dotPainter);
    canvas.drawCircle(
        center, 22, Paint()..color = Theme.of(context).backgroundColor);
    canvas.drawCircle(center, 10, dotPainter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
