import 'package:ebook_app/widgets/two_side_rounded_button.dart';
import 'package:flutter/material.dart';

import '../consttants.dart';
import 'book_rating.dart';


class ReadingistWidget extends StatelessWidget {
  final String image;
  final String title;
  final String auth;
  final double rating;
  final Function pressDetails;
  final Function pressRead;

  const ReadingistWidget({
    Key key,
    this.image,
    this.title,
    this.auth,
    this.rating,
    this.pressDetails,
    this.pressRead,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 24, bottom: 40),
      height: 246,
      width: 185,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 260,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(29),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 33,
                        color: kShadowColor)
                  ]),
            ),
          ),
          Image.asset(image, width: 150),
          Positioned(
            top: 35,
            right: 10,
            child: Column(
              children: [
                IconButton(
                  icon: Icon(Icons.favorite_border),
                  onPressed: () {},
                ),
                BookRating(
                  score: rating,
                )
              ],
            ),
          ),
          Positioned(
            top: 160,
            child: Container(
              height: 85,
              width: 182,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 24),
                    child: RichText(
                      maxLines: 2,
                      text: TextSpan(
                          style: TextStyle(color: kBlackColor),
                          children: [
                            TextSpan(
                                text: "$title\n",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: auth,
                                style: TextStyle(color: kLightBlackColor))
                          ]),
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: pressDetails,
                        child: Container(
                          width: 101,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          alignment: Alignment.center,
                          child: Text("Details"),
                        ),
                      ),
                      Expanded(
                        child: TwoSideRoundedButton(
                          radius: 29,
                          text: "Read",
                          press: pressRead,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
