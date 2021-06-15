import 'package:flutter/material.dart';
import 'package:food_the_way/data/data.dart';
import 'package:food_the_way/models/restaurant.dart';
import 'package:food_the_way/screens/restaurants_screen.dart';
import 'package:food_the_way/widgets/rating_stars.dart';

class Nearby_Restaurants extends StatefulWidget {
  const Nearby_Restaurants({
    Key key,
  }) : super(key: key);

  @override
  _Nearby_RestaurantsState createState() => _Nearby_RestaurantsState();
}

class _Nearby_RestaurantsState extends State<Nearby_Restaurants> {
  Widget _buildRestaurants() {
    List<Widget> resturantList = [];

    restaurants.forEach((Restaurant restaurant) {
      resturantList.add(GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => RestaurantScreen(restaurant: restaurant)));
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(width: 1.0, color: Colors.grey[200])),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Hero(
                  tag: restaurant.imageUrl,
                  child: Image(
                      height: 150.0,
                      width: 150.0,
                      fit: BoxFit.cover,
                      image: AssetImage(restaurant.imageUrl)),
                ),
              ),
              Container(
                margin: EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      restaurant.name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    RatingStars(rating: restaurant.rating),
                    Text(
                      restaurant.address,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      "0.2 miles away",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ));
    });

    return Column(children: resturantList);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            "Nearby Restaurants",
            style: TextStyle(
                letterSpacing: 1.2,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 24),
          ),
        ),
        _buildRestaurants()
      ],
    );
  }
}
