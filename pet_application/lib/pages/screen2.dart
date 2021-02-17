import 'package:flutter/material.dart';
import 'package:pet_application/configuration.dart';

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.blueGrey[300],
                  ),
                ),
                Expanded(
                  child: Container(),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 50),
            child: Align(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.share),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 40),
            child: Align(
              alignment: Alignment.topCenter,
              child: Hero(
                tag: '1',
                child: Image.asset('assets/images/pet-cat2.png')
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: shadowList),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 40),
                    height: 60,
                    width: 60,
                    child: Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: primaryGreen,
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Container(
                      height: 60,
                      width: 230,
                      // color: primaryGreen,
                      margin: EdgeInsets.only(right: 40),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: primaryGreen),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Adoption",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
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
