import 'package:flutter/material.dart';
import 'package:quiz_app/models/Questions.dart';
import 'package:quiz_app/screens/quiz_screen/components/option.dart';

import '../../../constants.dart';

class QustionCard extends StatelessWidget {
  const QustionCard({
    Key key,
    @required this.question,
  }) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            question.question,
            style: Theme.of(context).textTheme.headline6.copyWith(
                  color: kBlackColor,
                ),
          ),
          SizedBox(height: kDefaultPadding / 2),
          ...List.generate(
              question.question.length,
              (index) => Option(
                    index: index,
                    text: question.options[index],
                    press: () {},
                  ))
        ],
      ),
    );
  }
}
