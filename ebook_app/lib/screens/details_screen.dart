import 'package:ebook_app/consttants.dart';
import 'package:ebook_app/widgets/book_rating.dart';
import 'package:ebook_app/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: size.height * .4,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/bg.png"),
                        fit: BoxFit.fitWidth,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      )),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        SizedBox(height: size.height * 0.1),
                        BookInfo()
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * .4 - 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ChaptercCard(
                        size: size,
                        name: "Money",
                        chapterNumber: 1,
                        press: () {},
                        tag: "Life is about to change",
                      ),
                      ChaptercCard(
                        size: size,
                        name: "Money",
                        chapterNumber: 2,
                        press: () {},
                        tag: "Life is about to change",
                      ),
                      ChaptercCard(
                        size: size,
                        name: "Money",
                        chapterNumber: 3,
                        press: () {},
                        tag: "Life is about to change",
                      ),
                      ChaptercCard(
                        size: size,
                        name: "Money",
                        chapterNumber: 4,
                        press: () {},
                        tag: "Life is about to change",
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.display1,
                      children: [
                        TextSpan(
                          text: "You might also",
                        ),
                        TextSpan(
                          text: "Like...",
                          style: TextStyle(fontWeight: FontWeight.bold)
                        )
                      ]
                    ),
                  ),
                  SizedBox(height: 20),
                  Stack(
                    children: [
                      Container(
                        height: 180,
                        width: double.infinity,
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.only(left: 24,top: 24,right: 150),
                          height: 160,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(29),
                            color: Color(0xFFFFF8F9),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(color: kBlackColor),
                                  children: [
                                    TextSpan(
                                      text: "How To Win \nFriends & Influnce",
                                      style: TextStyle(
                                        fontSize: 20,
                                      )
                                    ),
                                    TextSpan(
                                      text: "Gary Venchuk",
                                      style: TextStyle(color: kLightBlackColor),
                                    ),
                                  ]
                                ),
                              ),
                              Row(
                                children: [
                                  BookRating(
                                    score: 4.9,
                                  ),
                                  SizedBox(width: 20),
                                  Expanded(
                                    child: RoundedButton(
                                      text: "Read",
                                      verticalPadding: 10,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Image.asset("assets/images/book-3.png",width: 150),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}

class ChaptercCard extends StatelessWidget {
  final String name;
  final String tag;
  final int chapterNumber;
  final Function press;
  const ChaptercCard({
    Key key,
    @required this.size,
    this.name,
    this.tag,
    this.chapterNumber,
    this.press,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      margin: EdgeInsets.only(bottom: 16),
      width: size.width - 48,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(38.5),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 33,
              color: Color(0xFFD3D3D3).withOpacity(.84),
            ),
          ]),
      child: Row(
        children: [
          RichText(
            text: TextSpan(children: [
              TextSpan(
                text: "Chapter $chapterNumber : $name \n",
                style: TextStyle(
                    fontSize: 16,
                    color: kBlackColor,
                    fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: "$tag",
                style: TextStyle(fontSize: 16, color: kLightBlackColor),
              ),
            ]),
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.arrow_forward_ios, size: 10),
            onPressed: press,
          )
        ],
      ),
    );
  }
}

class BookInfo extends StatelessWidget {
  const BookInfo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Crusing &",
                style: Theme.of(context).textTheme.display1,
              ),
              Text(
                "Influnce",
                style: Theme.of(context)
                    .textTheme
                    .display1
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                            "If these are the basic ingredients that make up a book review, it’s the tone and style with which the book reviewer writes that brings the extra panache..",
                            maxLines: 5,
                            style: TextStyle(
                                fontSize: 10, color: kLightBlackColor)),
                        SizedBox(height: 5),
                        RoundedButton(text: "Read", verticalPadding: 10),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(Icons.favorite_border),
                        onPressed: () {},
                      ),
                      BookRating(
                        score: 4.9,
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        Image.asset("assets/images/book-1.png", height: 100)
      ],
    );
  }
}
