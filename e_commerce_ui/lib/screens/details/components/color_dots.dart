import 'package:e_commerce_ui/components/roundButton.dart';
import 'package:e_commerce_ui/constants.dart';
import 'package:e_commerce_ui/models/Product.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';

class ColorDots extends StatelessWidget {
  const ColorDots({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;
  final selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionScreenWidth(20)),
      child: Row(
        children: [
          ...List.generate(
            product.colors.length,
            (index) => ColorDot(
              product: product,
              color: product.colors[index],
              isSeleceted: selectedColor == index,
              selectedColor: selectedColor,
            ),
          ),
          Spacer(),
          RoundIconButton(
            iconData: Icons.remove,
            press: () {},
          ),
          SizedBox(width: 20),
          RoundIconButton(
            iconData: Icons.add,
            press: () {},
          ),
        ],
      ),
    );
  }
}

class ColorDot extends StatefulWidget {
  const ColorDot({
    Key key,
    @required this.product,
    this.isSeleceted,
    this.color, this.selectedColor,
  }) : super(key: key);

  final Product product;
  final bool isSeleceted;
  final Color color;
  final int selectedColor;

  @override
  _ColorDotState createState() => _ColorDotState(this.selectedColor);
}

class _ColorDotState extends State<ColorDot> {
  _ColorDotState(int selectedColor);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          print();
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 3),
        padding: EdgeInsets.all(8),
        height: getProportionScreenWidth(40),
        width: getProportionScreenWidth(40),
        decoration: BoxDecoration(
          // color: product.colors[0],
          shape: BoxShape.circle,
          border: Border.all(
              color: widget.isSeleceted ? kPrimaryColor : Colors.white),
        ),
        child: DecoratedBox(
          decoration:
              BoxDecoration(color: widget.color, shape: BoxShape.circle),
        ),
      ),
    );
  }
}
