import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Discovery",
          style: TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              color: Colors.grey, onPressed: () {}, icon: Icon(Icons.camera))
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 15, bottom: 15),
        children: [
          Container(
            height: 150.0,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(10),
              children: [
                listItem('assets/model1.jpeg', 'assets/chanellogo.jpg'),
                listItem('assets/model2.jpeg', 'assets/chloelogo.png'),
                listItem('assets/model3.jpeg', 'assets/chloelogo.png'),
                listItem('assets/model2.jpeg', 'assets/chanellogo.jpg'),
                listItem('assets/model3.jpeg', 'assets/chloelogo.png'),
                listItem('assets/model1.jpeg', 'assets/chanellogo.jpg'),
                listItem('assets/model2.jpeg', 'assets/chloelogo.png'),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Material(
              borderRadius: BorderRadius.circular(15),
              elevation: 4,
              child: Container(
                height: 450,
                width: double.infinity,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              image: DecorationImage(
                                  image: AssetImage(
                                    "assets/model1.jpeg",
                                  ),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 120,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Daisy",
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 2.0,
                                  ),
                                  Text(
                                    "24 mins ago",
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 12,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.more_vert,
                                  size: 28,
                                ),
                                color: Colors.grey,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "data",
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget listItem(String imgPath, String logo) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Stack(
            children: [
              Container(
                height: 75.0,
                width: 75.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(37.6),
                    image: DecorationImage(
                        image: AssetImage(imgPath), fit: BoxFit.cover)),
              ),
              Positioned(
                top: 50,
                left: 50,
                child: Container(
                  height: 25.0,
                  width: 25.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(37.6),
                      image: DecorationImage(
                          image: AssetImage(logo), fit: BoxFit.cover)),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          margin: EdgeInsets.only(left: 20),
          height: 30,
          width: 75,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xFF916144)),
          child: Center(
              child: Text(
            "Follow",
            style: TextStyle(fontFamily: 'Montserrat', color: Colors.white),
          )),
        )
      ],
    );
  }
}
