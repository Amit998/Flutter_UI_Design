import 'package:flutter/material.dart';
import 'package:shoe_shop_app/models/shoe_model.dart';
import 'package:shoe_shop_app/pages/detail_page.dart';
import 'package:shoe_shop_app/widgets/app_clipper.dart';
import '../core/const.dart';
import '../core/flutter_icons.dart';
import 'dart:math' as math;

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ShoeModel> shoeList = ShoeModel.list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          FlutterIcons.menu,
          color: Colors.black,
        ),
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Categories",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
              IconButton(
                icon: Icon(
                  Icons.search,
                  size: 30,
                  color: Colors.black45,
                ),
                onPressed: () {},
              )
            ],
          ),
        ),
        Container(
          height: 350,
          child: ListView.builder(
              itemCount: shoeList.length,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.all(10),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    print(shoeList[index]);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => DetailPage(
                              shoeList[index],
                            )));
                  },
                  child: Container(
                    width: 230,
                    margin: EdgeInsets.only(right: 16),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: _buildBackGround(index, 230),
                        ),
                        Positioned(
                          bottom: 180,
                          right: 10,
                          child: Hero(
                            tag: "Hero${shoeList[index].imgPath}",
                            // tag: "H",
                            child: Transform.rotate(
                              angle: -math.pi / 7,
                              child: Image(
                                width: 200,
                                image: AssetImage(
                                    "assets/${shoeList[index].imgPath}"),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
        ),
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("JUST FOR YOU",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold)),
              Text(
                "VIEW ALL",
                style: TextStyle(color: AppColors.greenColor, fontSize: 12),
              )
            ],
          ),
        ),
        SizedBox(height: 10),
        ...shoeList.map((data) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => DetailPage(data),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.only(left: 16, right: 16, bottom: 10),
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12, blurRadius: 10, spreadRadius: 10)
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(24))),
              child: Row(
                children: [
                  Hero(
                    tag: "Hro${data.imgPath}",
                    child: Image(
                      image: AssetImage("assets/${data.imgPath}"),
                      width: 100,
                      height: 60,
                    ),
                  ),
                  SizedBox(width: 26),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * .4,
                          child: Text(
                            "${data.name}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          "${data.brand}",
                          style: TextStyle(color: Colors.black26, height: 1.6),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      "${data.price.toInt()}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          );
        })
      ]),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black26, spreadRadius: 1, blurRadius: 10)
            ]),
        child: BottomNavigationBar(
          selectedItemColor: AppColors.greenColor,
          unselectedItemColor: Colors.black38,
          currentIndex: 0,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Colors.transparent,
          items: [
            BottomNavigationBarItem(
                icon: Icon(FlutterIcons.compass), title: Text("data")),
            BottomNavigationBarItem(
                icon: Icon(FlutterIcons.list), title: Text("data")),
            BottomNavigationBarItem(
                icon: Icon(FlutterIcons.bag), title: Text("data")),
            BottomNavigationBarItem(
                icon: Icon(FlutterIcons.person_outline), title: Text("data")),
          ],
        ),
      ),
    );
  }

  Widget _buildBackGround(int index, double width) {
    return ClipPath(
      clipper: AppClipper(cornerSize: 25, diagonalHeight: 100),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          color: shoeList[index].color,
        ),
        width: width,
        margin: EdgeInsets.only(left: 10),
        // height: 300,
        // color: shoeList[index].color,
        // padding: EdgeInsets.all(16),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Icon(
                      shoeList[index].brand == 'Nike'
                          ? FlutterIcons.nike
                          : FlutterIcons.converse,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  Container(
                    width: 125,
                    child: Text(
                      "${shoeList[index].name}",
                      style: TextStyle(
                          color: Colors.white60, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "${shoeList[index].price}",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 16,
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.greenColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomRight: Radius.circular(30)),
                ),
                child: Center(
                  child: Icon(
                    FlutterIcons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
