import 'package:flutter/material.dart';
import 'package:shopping_ui_demo/pages/details_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Image.asset(
                "assets/pic4.jpeg",
                fit: BoxFit.cover,
                height: 400,
              ),
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    Text(
                      "Louis W. & A.P.C",
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 40.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w200),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Drop a Chic Selection of Outerwear",
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w200),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      "for 2019 Spring/Summer",
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w200),
                    ),
                    SizedBox(
                      height: 135,
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext contex) =>
                                    DetailsInfo()));
                      },
                      mini: true,
                      elevation: 0.0,
                      backgroundColor: Colors.white,
                      child: Center(
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Stack(
            children: [
              Image.asset(
                "assets/pic5.jpeg",
                fit: BoxFit.cover,
                height: 400,
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 90,
                    ),
                    Text(
                      "New Visuals",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Quicksand',
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "For \"P.O.W.A\" ",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Quicksand',
                          color: Colors.white),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
