import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.0),
        Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 45.0,
                width: 45.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Color(0xFFFD4F99)),
                child: Center(
                  child: Icon(
                    Icons.filter_list,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                "Home",
                style: GoogleFonts.montserrat(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    textStyle: TextStyle(color: Colors.white)),
              ),
              Container(
                height: 45.0,
                width: 45.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Color(0xFF353535)),
                child: Center(
                  child: Icon(
                    Icons.bookmark_border,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Container(
          height: MediaQuery.of(context).size.height - 170,
          child: ListView(
            children: [
              _buildListItem(
                  "assets/japan.jpg", "Japan", "Explore The Land of the river"),
              _buildListItem("assets/canada.jpg", "Canada",
                  "Explore The Land of the river"),
              _buildListItem(
                  "assets/kyoto.jpg", "Kyoto", "Explore The Land of the river"),
            ],
          ),
        )
      ],
    );
  }

  _buildListItem(String imagePath, String country, String description) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Stack(
        children: [
          Container(
            height: 300,
          ),
          Container(
            height: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.6), BlendMode.darken))),
          ),
          Container(
            height: 300,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    country,
                    style: GoogleFonts.montserrat(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        textStyle: TextStyle(color: Colors.white)),
                  ),
                  Text(
                    description,
                    style: GoogleFonts.montserrat(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        textStyle: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(6),
                        height: 50,
                        width: 135,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Center(
                          child: Text(
                            "Explore Now",
                            style: GoogleFonts.montserrat(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                textStyle: TextStyle(color: Color(0xFFFD4F99))),
                          ),
                        ),
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
