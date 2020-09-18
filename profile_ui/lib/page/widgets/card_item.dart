import 'package:flutter/material.dart';
class CardItem extends StatelessWidget {
  const CardItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
       child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 21.0,
            
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              IconButton(
                padding: new EdgeInsets.all(0.0),
                icon:Icon(
                  
                Icons.access_time,
                size: 35.0,
                color: Colors.red,
                ),
                onPressed: (){},
              ),
              SizedBox(width: 24.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text("Joind Date",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    ),
                  ),
                  
                  SizedBox(height: 4.0),
                  Text("21 Augest 2020",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10.0,
                    color: Colors.grey[800]
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

