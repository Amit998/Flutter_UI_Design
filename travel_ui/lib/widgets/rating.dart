import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

Widget _buildRating(double star, {double itemSize = 14}) {
  return RatingBar.builder(
    itemSize: itemSize,
    initialRating: star,
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
  );
}
