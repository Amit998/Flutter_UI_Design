import 'package:flutter/material.dart';
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
    return InkWell(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(top: kDefaultPadding),
        padding: EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
          border: Border.all(color: kGrayColor),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${index + 1} ${text}",
              style: TextStyle(color: kGrayColor, fontSize: 16),
            ),
            Container(
              height: 22,
              width: 22,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: kGrayColor)),
            )
          ],
        ),
      ),
    );
  }
}
