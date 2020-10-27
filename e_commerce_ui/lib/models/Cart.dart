import 'package:flutter/material.dart';
import 'Product.dart';

class Cart {
  final Product product;
  final int nunOdItems;

  Cart({this.product, this.nunOdItems});
}

List<Cart> demoCarts = [
  Cart(product: demoProducts[0], nunOdItems: 3),
  Cart(product: demoProducts[1], nunOdItems: 1),
  Cart(product: demoProducts[2], nunOdItems: 10),
  Cart(product: demoProducts[3], nunOdItems: 2),
];
