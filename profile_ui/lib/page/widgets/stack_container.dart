import 'package:flutter/material.dart';
import './top_bar.dart';
import '../../utilities/custom_clipper.dart';



class StackContainer extends StatelessWidget {
  const StackContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      child: Stack(
        children: <Widget>[
          Container(),
          ClipPath(
            clipper: MyCustomClipper(),
            child: Container(
              height: 300.0,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage("https://picsum.photos/200"),
                fit: BoxFit.cover
                ),
              ),
            ),
          ),
          Align
          (
            alignment: Alignment(0,1),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircleAvatar(
                
                  radius: 50,
                  backgroundImage: AssetImage('images/avatar.png'),
                ),
                SizedBox(height: 4.0),

                Text("Amit Dutta",
                style: TextStyle(
                  fontSize: 21.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
                ),
                Text("App Developer",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey
                ),
                )
              ],
            ),
          ),
          TopBar(),
        ],
      ),
    );
  }
}


