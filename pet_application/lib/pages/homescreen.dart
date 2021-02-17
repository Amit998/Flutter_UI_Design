import 'package:flutter/material.dart';
import 'package:pet_application/configuration.dart';
import 'package:pet_application/pages/screen2.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor)
        ..rotateY(isDrawerOpen ? -0.5 : 0),
      duration: Duration(milliseconds: 250),
      // color: Colors.grey[200],
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            Container(
              // margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isDrawerOpen
                      ? IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          onPressed: () {
                            setState(() {
                              xOffset = 0;
                              yOffset = 0;
                              scaleFactor = 1;
                              isDrawerOpen = false;
                            });
                          },
                        )
                      : IconButton(
                          icon: Icon(Icons.menu),
                          onPressed: () {
                            setState(() {
                              xOffset = 250;
                              yOffset = 160;
                              scaleFactor = 0.6;
                              isDrawerOpen = true;
                            });
                          },
                        ),
                  Column(
                    children: [
                      Text("Location"),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: primaryGreen,
                          ),
                          Text("Ukarane"),
                        ],
                      ),
                    ],
                  ),
                  CircleAvatar()
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              margin: EdgeInsets.symmetric(vertical: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.search),
                  Text("Search pet to adopt"),
                  Icon(Icons.settings),
                ],
              ),
            ),
            Container(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(left: 20),
                          child: Image.asset(
                            categories[index]['iconPath'],
                            width: 50,
                            color: Colors.grey[700],
                          ),
                          decoration: BoxDecoration(
                              boxShadow: shadowList,
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        Text(categories[index]['name'])
                      ],
                    ),
                  );
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Screen2(),
                    ));
              },
              child: Container(
                height: 240,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 40),
                            decoration: BoxDecoration(
                                color: Colors.blueGrey[300],
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          Align(
                            child: Hero(
                                tag: 1,
                                child:
                                    Image.asset("assets/images/pet-cat1.png")),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 55, bottom: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20),
                                topRight: Radius.circular(20)),
                            boxShadow: shadowList),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 240,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 40),
                          decoration: BoxDecoration(
                              color: Colors.orange[300],
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        Align(
                          child: Image.asset("assets/images/pet-cat1.png"),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 55, bottom: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          boxShadow: shadowList),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
}
