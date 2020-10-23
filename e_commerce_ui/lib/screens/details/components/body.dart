import 'package:e_commerce_ui/models/Product.dart';
import 'package:e_commerce_ui/screens/details/components/product_image.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ProductImage(product: product);
  }
}
