import 'dart:math';

import 'package:flutter/material.dart';

class ClockPointer extends CustomPainter {
  final BuildContext context;
  final DateTime dateTime;

  ClockPointer(this.context, this.dateTime);
  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    Offset center = Offset(centerX, centerY);

    // Hour Calculation

    double hourX = centerX +
        size.width *
            0.3 *
            cos((dateTime.hour * 30 + dateTime.hour * 0.5) * pi / 180);

    double hourY = centerY +
        size.width *
            0.3 *
            sin((dateTime.hour * 30 + dateTime.hour * 0.5) * pi / 180);

    // Second Calculation
    double secondX =
        centerX + size.width * 0.4 * cos((dateTime.second * 6) * pi / 180);

    double secondY =
        centerY + size.width * 0.4 * sin((dateTime.second * 6) * pi / 180);

    // Minute Calculation

    double minuteX =
        centerX + size.width * 0.35 * cos((dateTime.minute * 6) * pi / 180);

    double minuteY =
        centerY + size.width * 0.35 * sin((dateTime.minute * 6) * pi / 180);

    // Minutes Line

    canvas.drawLine(
        center,
        Offset(minuteX, minuteY),
        Paint()
          ..color = Theme.of(context).accentColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = 10);

    // For Seconds Line

    canvas.drawLine(
        center,
        Offset(secondX, secondY),
        Paint()
          ..color = Theme.of(context).primaryColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1);

    // For Hour Lines

    canvas.drawLine(
        center,
        Offset(hourX, hourY),
        Paint()
          ..color = Theme.of(context).primaryColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = 18);

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
