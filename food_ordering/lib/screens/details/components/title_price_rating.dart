import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../../../constants.dart';

class TitlePriceRating extends StatelessWidget {
  const TitlePriceRating({
    Key key,
    @required this.size,
    this.price,
    this.numOfReview,
    this.rating,
    this.onRatingChange, this.name,
  }) : super(key: key);
  final String name;
  final int price, numOfReview;
  final double rating;
  final RatingChangeCallback onRatingChange;

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
       
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      fontSize: 25,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold),
                ),
                
                SizedBox(height: 10),
                Row(
                  children: [
                    SmoothStarRating(
                      borderColor: kPrimaryColor,
                      rating: rating,
                      color: kPrimaryColor,
                      onRated: onRatingChange,
                    ),
                    SizedBox(width: 10),
                    Text("$numOfReview Reviews")
                  ],
                ),
                
  

              ],
            ),
            
          ),
          priceTag(price: this.price),
          
        ],
      ),
    );
  }

  ClipPath priceTag({int price}) {
    return ClipPath(
      clipper: PricerClipper(),
      child: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.symmetric(vertical: 15),
        height: size.height * 0.10,
        width: size.width * 0.20,
        color: kPrimaryColor,
        child: Text(
          " \$ $price ",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
    );
  }
}

class PricerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    print(size.height);
    print(size.width);
    Path path = Path();

    double ignoreHeight = 20;
    path.lineTo(0, size.height - ignoreHeight);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, size.height - ignoreHeight);
    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
