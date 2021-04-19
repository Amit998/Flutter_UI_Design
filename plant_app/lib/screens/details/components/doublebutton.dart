import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';




class DoubleButton extends StatelessWidget {
  const DoubleButton({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: size.width / 2,
          height: 82,
          child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(20))),
              color: kPrimaryColor,
              onPressed: () {},
              child: Text(
                "Buy",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )),
        ),
        SizedBox(
          width: size.width / 2,
          height: 82,
          child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(20))),
              color: Colors.white,
              onPressed: () {},
              child: Text(
                "Details",
                style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )),
        ),
      ],
    );
  }
}
