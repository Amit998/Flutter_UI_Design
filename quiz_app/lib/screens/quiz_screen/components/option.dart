import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/screens/controllers/qustion_controller.dart';
import '../../../constants.dart';

class Option extends StatelessWidget {
  const Option({
    Key key,
    this.index,
    this.text,
    this.press,
  }) : super(key: key);
  final int index;
  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    // print(text);
    return GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (qnController) {
          Color getTheRightColor() {
            if (qnController.isAnswered) {
              if (index == qnController.correctAns) {
                return kGreenColor;
              } else if (index == qnController.selectedAnd &&
                  qnController.selectedAnd != qnController.correctAns) {
                return kRedColor;
              }
            }
            return kGrayColor;
          }

          IconData getRightIcon() {
            return getTheRightColor() == kRedColor ? Icons.close : Icons.done;
          }

          return InkWell(
            onTap: press,
            child: Container(
              margin: EdgeInsets.only(top: kDefaultPadding),
              padding: EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                border: Border.all(color: getTheRightColor()),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${index + 1} ${text}",
                    style: TextStyle(color: getTheRightColor(), fontSize: 16),
                  ),
                  Container(
                    height: 22,
                    width: 22,
                    decoration: BoxDecoration(
                        color: getTheRightColor() == kGrayColor
                            ? Colors.transparent
                            : getTheRightColor(),
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: getTheRightColor())),
                    child: getTheRightColor() == kGrayColor
                    ? null
                    :Icon(getRightIcon(), size: 16),
                  )
                ],
              ),
            ),
          );
        });
  }
}
