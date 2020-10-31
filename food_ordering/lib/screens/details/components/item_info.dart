import 'package:flutter/material.dart';
import 'package:food_ordering/constants.dart';


class ItemInfo extends StatelessWidget {
  const ItemInfo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )
        ),
        child: Column(
          children: [
              shopName(name:"MacDonalds")
          ],
        ),
      );
  }

  Row shopName({String name }) {
    return 
    Row(
        children: [
          Icon(Icons.location_on,color: ksecondaryColor),
          SizedBox(width: 10),
          Text(name),
        ],
      );
  }
}


