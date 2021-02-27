import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_ui/models/hotel_model.dart';
import '../models/destination_model.dart';

class HotelCarsouel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Exclusive Hotels",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              GestureDetector(
                onTap: () => print("object"),
                child: Text(
                  "See All",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 300,
          // color: Colors.blue,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: hotels.length,
            itemBuilder: (BuildContext context, int index) {
              Hotel hotel = hotels[index];
              return Container(
                margin: EdgeInsets.all(10),
                width: 300,
                // color: Colors.red,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      bottom: 25.0,
                      child: Container(
                        width: 300,
                        height: 120,
                        // color: Colors.white,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(width: 0.1),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${hotel.name}",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    "\$${hotel.price} /night",
                                    style: TextStyle(color: Colors.black87),
                                  ),
                                  SizedBox(height: 1),
                                  Text(
                                    "${hotel.address}",
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 16,
                                      // fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 10),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${hotel.reviews.length} Reviews",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      // fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Text(
                                    "${hotel.totalRatings} Total Ratings",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      // fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  // SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Text(
                                        "Rating ",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          // fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      RatingBar.builder(
                                        itemSize: 14,
                                        initialRating: hotel.rating,
                                        minRating: 1,
                                        maxRating: 5,
                                        allowHalfRating: true,
                                        direction: Axis.horizontal,
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                        ),
                                        onRatingUpdate: (ratiing) {
                                          print("object");
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              // SizedBox(width: 10),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0.8, 2.0),
                                blurRadius: 6.0)
                          ]),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image(
                              height: 180,
                              width: 260,
                              image: AssetImage(hotel.imageUrl),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
