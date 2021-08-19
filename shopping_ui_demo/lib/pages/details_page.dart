import 'package:flutter/material.dart';

class DetailsInfo extends StatefulWidget {
  @override
  _DetailsInfoState createState() => _DetailsInfoState();
}

class _DetailsInfoState extends State<DetailsInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: EdgeInsets.only(top: 40),
      children: [
        Stack(children: [
          Container(
            height: 250,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(
                "assets/pic4.jpeg",
              ),
              fit: BoxFit.cover,
            )),
          ),
          Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              )),
          Align(
            alignment: Alignment.topRight,
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.white,
              child: Center(
                child: Icon(
                  Icons.shopping_bag,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0, top: 100),
            child: Text(
              "Women",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                  fontSize: 37,
                  fontWeight: FontWeight.bold),
            ),
          )
        ]),
        SizedBox(
          height: 25,
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: Text(
            'Cutting-edge items to stay in style, perfect for all of your moments.',
            style: TextStyle(
                fontFamily: 'Quicksand', fontSize: 17.0, color: Colors.black),
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Container(
          height: 100,
          child: ListView(
            padding: EdgeInsets.only(left: 15.0),
            scrollDirection: Axis.horizontal,
            children: [
              ListViewItemList(
                text: "New In",
                icon: "assets/pic1.jpeg",
              ),
              ListViewItemList(
                text: "New In",
                icon: "assets/pic2.jpeg",
              ),
              ListViewItemList(
                text: "New In",
                icon: "assets/pic3.jpeg",
              ),
              ListViewItemList(
                text: "New In",
                icon: "assets/pic4.jpeg",
              ),
              ListViewItemList(
                text: "New In",
                icon: "assets/pic5.jpeg",
              ),
            ],
          ),
        )
      ],
    ));
  }
}

class ListViewItemList extends StatelessWidget {
  final String text;
  final String icon;

  const ListViewItemList({
    @required this.icon,
    @required this.text,
    Key key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          image: DecorationImage(
              image: AssetImage("assets/pic3.jpeg"), fit: BoxFit.cover)),
      height: 100,
      width: 100,
      child: Center(
        child: Text(
          "New In",
          style: TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
