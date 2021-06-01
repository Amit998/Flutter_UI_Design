

import 'package:food_the_way/models/food.dart';
import 'package:food_the_way/models/restaurant.dart';

class Order {
  final Restaurant restaurant;
  final Food food;
  final String date;
  final int quantity;

  Order({
    this.date,
    this.restaurant,
    this.food,
    this.quantity,
  });
}
