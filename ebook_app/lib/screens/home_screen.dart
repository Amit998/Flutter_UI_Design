import 'package:ebook_app/consttants.dart';
import 'package:ebook_app/screens/details_screen.dart';
import 'package:ebook_app/widgets/book_rating.dart';
import 'package:ebook_app/widgets/reading_card_list.dart';
import 'package:ebook_app/widgets/two_side_rounded_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/main_page_bg.png"),
                    alignment: Alignment.topCenter,
                    fit: BoxFit.fitWidth)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.1,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: RichText(
                    text: TextSpan(
                        style: Theme.of(context).textTheme.display1,
                        children: [
                          TextSpan(text: "What are \nreading "),
                          TextSpan(
                              text: "today?",
                              style: TextStyle(fontWeight: FontWeight.bold))
                        ]),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ReadingistWidget(
                        image: "assets/images/book-1.png",
                        title: "Crusing and Influence",
                        auth: "Gary venchuk",
                        pressDetails: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return DetailsScreen();
                          }));
                        },
                        pressRead: () {},
                        rating: 4.9,
                      ),
                      ReadingistWidget(
                        image: "assets/images/book-2.png",
                        title: "Top Ten Business Hacks",
                        auth: "Harmen Joel",
                        pressDetails: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return DetailsScreen();
                            }));
                          },
                        pressRead: () {},
                        rating: 4.2,
                      ),
                      SizedBox(width: 30),
                    ],
                  ),
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
                              TextSpan(text: "Best Of The "),
                              TextSpan(
                                text: "Day",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            ]),
                      ),
                      buildContainer(size, context),
                      RichText(
                        text: TextSpan(
                            style: Theme.of(context).textTheme.display1,
                            children: [
                              TextSpan(text: "Continue"),
                              TextSpan(
                                  text: "Reading...",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ]),
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 80,
                        width: double.infinity,
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
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(38.5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 20, right: 20),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Top Ten Business Hacks",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text("Garry Hopper",
                                                style: TextStyle(
                                                    color: kLightBlackColor)),
                                            SizedBox(height: 20),
                                            Align(
                                              alignment: Alignment.bottomRight,
                                              child: Text(
                                                "Chapter 7 of 10",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: kLightBlackColor),
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                          ],
                                        ),
                                      ),
                                      Image.asset("assets/images/book-2.png",
                                          width: 55)
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 7,
                                width: size.width * .65,
                                decoration: BoxDecoration(
                                  color: kProgressIndicator,
                                  borderRadius: BorderRadius.circular(7),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      )
                      // RichText()
                    ],
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Container buildContainer(Size size, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      height: 245,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding:
                  EdgeInsets.only(left: 24, top: 24, right: size.width * .35),
              height: 230,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFEAEAEA).withOpacity(.45),
                borderRadius: BorderRadius.circular(29),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "New York Time Best for 11th March 2020",
                    style: TextStyle(fontSize: 12.0, color: kLightBlackColor),
                  ),
                  SizedBox(height: 3),
                  Text("How to Win \nFriends & Influence",
                      style: Theme.of(context).textTheme.title),
                  Text(
                    "Gary Venchuk",
                    style: TextStyle(color: kBlackColor),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      BookRating(score: 4.9),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "When the earth was flat and everyone wanted to win You Have To Earn your value at your own",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style:
                              TextStyle(fontSize: 10, color: kLightBlackColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Image.asset("assets/images/book-3.png",
                width: size.width * .37),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: SizedBox(
              height: 40,
              width: size.width * .3,
              child: TwoSideRoundedButton(
                text: "Read",
                radius: 24,
                press: () => print("object"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
