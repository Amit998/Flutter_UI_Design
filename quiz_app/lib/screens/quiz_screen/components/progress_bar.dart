import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/screens/controllers/qustion_controller.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../../constants.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 30,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF3F4768), width: 3),
        borderRadius: BorderRadius.circular(50),
      ),
      child: GetBuilder<QuestionController>(
          init: QuestionController(),
          builder: (controller) {
            // print(controller.animation.value);
            // print("object");
            return Stack(
              children: [
                LayoutBuilder(
                  builder: (context, constraints) => Container(
                    width: constraints.maxWidth * controller.animation.value,
                    // width: 1 * 0.5,
                    // width: constraints.maxWidth ,
                    decoration: BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ),
                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultPadding / 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${(controller.animation.value * 60).round()} Sec"
                            // "12"
                            ),
                        WebsafeSvg.asset("assets/icons/clock.svg")
                      ],
                    ),
                  ),
                )
              ],
            );
          }),
    );
  }
}
