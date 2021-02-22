import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shoe_shop_app/core/flutter_icons.dart';
import 'package:shoe_shop_app/models/shoe_model.dart';
import 'package:shoe_shop_app/widgets/app_clipper.dart';

import 'dart:math' as math;

class DetailPage extends StatefulWidget {
  final ShoeModel shoeModel;

  DetailPage(this.shoeModel);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.shoeModel.color,
      appBar: AppBar(
        backgroundColor: widget.shoeModel.color,
        elevation: 0,
        title: Text("CATEGORIES"),
        leading: IconButton(
          icon: Icon(FlutterIcons.left_open_1),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Body(widget: widget),
      // bottomNavigationBar: BottamNavBar(widget: widget),
    );
  }
}

class BottamNavBar extends StatelessWidget {
  const BottamNavBar({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final DetailPage widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 32),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 10)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "PRICE",
                style: TextStyle(color: Colors.black26, fontSize: 24),
              ),
              Text(
                "\n${widget.shoeModel.price.toInt()}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 50),
            decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(50))),
            child: Text(
              "ADD CART",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final DetailPage widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.78,
              width: MediaQuery.of(context).size.width,
              child: ClipPath(
                clipper: AppClipper(
                    cornerSize: 50, diagonalHeight: 180, roundedBottom: false),
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.only(top: 210, left: 6, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 300,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "${widget.shoeModel.name}",
                          style: TextStyle(fontSize: 32),
                        ),
                      ),
                      SizedBox(height: 6),
                      _buildRating(),
                      SizedBox(height: 10),
                      Text(
                        "DETAILS",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16),
                      Text(
                        "${widget.shoeModel.desc}",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black45),
                      ),
                      SizedBox(height: 12),
                      Text(
                        "COLORS OPTIONS",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          _buildColoeOptions(Colors.blue),
                          _buildColoeOptions(Colors.red),
                          _buildColoeOptions(Colors.yellow),
                          _buildColoeOptions(Colors.orangeAccent),
                          _buildColoeOptions(Colors.greenAccent),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: BottamNavBar(widget: widget),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Hero(
              tag: "hero${widget.shoeModel.imgPath}",
              // tag: "H",
              child: Transform.rotate(
                angle: -math.pi / 7,
                child: Image(
                  width: MediaQuery.of(context).size.width * 0.9,
                  image: AssetImage("assets/${widget.shoeModel.imgPath}"),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container _buildColoeOptions(Color color) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 10),
      height: 40,
      width: 40,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(50)),
    );
  }

  Widget _buildRating() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              SizedBox(width: 10),
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 20,
                itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              SizedBox(width: 16),
              Text("134 Reviews")
            ],
          ),
        ),
      ],
    );
  }
}
