import 'package:flutter/material.dart';


class TopBar extends StatelessWidget {
  const TopBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(icon: Icon(Icons.arrow_back,color: Colors.white),
          onPressed: () {}
          ),
          IconButton(icon: Icon(Icons.menu,color: Colors.white),
          onPressed: () {}
          ),
        ],
      ),
    );
  }
}
