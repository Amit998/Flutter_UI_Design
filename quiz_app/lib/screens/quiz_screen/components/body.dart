import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/screens/controllers/qustion_controller.dart';
import 'package:quiz_app/screens/quiz_screen/components/progress_bar.dart';
import 'package:quiz_app/screens/quiz_screen/components/qustion_card.dart';
import 'package:websafe_svg/websafe_svg.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _qustionController = Get.put(QuestionController());

    return Stack(
      children: [
        WebsafeSvg.asset("assets/icons/bg.svg",
            fit: BoxFit.fill, width: double.infinity),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: ProgressBar(),
              ),
              SizedBox(height: kDefaultPadding),
              Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Obx(
                    () => Text.rich(TextSpan(
                        text: "Qustion ${_qustionController.questionNumber}",
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            .copyWith(color: kSecondaryColor),
                        children: [
                          TextSpan(
                            text: "/${_qustionController.qusttions.length}",
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                .copyWith(color: kSecondaryColor),
                          )
                        ])),
                  )),
              Divider(thickness: 1.5),
              SizedBox(
                height: kDefaultPadding,
              ),
              Expanded(
                child: PageView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _qustionController.pageController,
                  onPageChanged: _qustionController.updateTheNum,
                  itemCount: _qustionController.qusttions.length,
                  itemBuilder: (context, index) => QustionCard(
                    question: _qustionController.qusttions[index],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
