import 'package:flutter/material.dart';

class Product {
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  final bool isFavourite, isPopular;
 Product({
   @required This.images,
   @required This.colors,
   this.rating=0.0,
   this.isFavourite=false,
   this.isPopular=false,
   @required This.title,
   @required This.price,
   @required This.images,
   @required This.description,
   

 });
}
