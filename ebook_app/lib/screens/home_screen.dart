import 'package:ebook_app/consttants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/main_page_bg.png"),
            alignment: Alignment.topCenter,
            fit: BoxFit.fitWidth
          )
        ),
        child: Column(
          children: [
            SizedBox(
              height: size.height * .1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.display1,
                  children: [
                    TextSpan(
                      text: "What are \nreading"
                    ),
                    TextSpan(
                      text: "today?",style: TextStyle(fontWeight: FontWeight.bold)
                    )
                  ]
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Positioned(
              height: 0,
              left: 0,
              right: 0,
            child: Container(
                height: 245,
                width: 202,
                child: Stack(
                  children: [
                    Container(
                      height: 221,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(29),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0,10),
                            blurRadius: 33,
                            color: kShadowColor
                          )
                        ]
                      ),
                    ),
                  Image.asset("assets/images/book-1.png",width: 150),
                  Positioned(
                    top: 35,
                    right: 10,
                    child: Column(
                      children: [
                        IconButton(
                          icon: Icon(Icons.favorite_border),
                          onPressed: (){},
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 8,horizontal: 6),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                             BoxShadow(
                                offset: Offset(3, 7),
                                blurRadius: 20,
                                color: Color(0xFD3D3D3).withOpacity(.5)
                             ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Icon(Icons.star,color: kIconColor,size: 15),
                              SizedBox(height: 10),
                              Text(
                                "4.9",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold
                                    
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}