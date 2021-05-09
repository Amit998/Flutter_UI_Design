import 'package:dashboard_ui/constants.dart';
import 'package:flutter/material.dart';

class ProgressLine extends StatelessWidget {
  const ProgressLine({
    Key? key,
    @required this.color = primaryColor,
    @required this.percentage,
  }) : super(key: key);

  final Color? color;
  final int? percentage;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) => Container(
              // width: 200,

              width: 200 * (percentage! / 100),
              height: 5,
              decoration: BoxDecoration(
                  color: color!,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ));
  }
}
