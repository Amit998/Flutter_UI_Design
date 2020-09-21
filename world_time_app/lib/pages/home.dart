import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;

    print(data);

    String bgImage = data['isDayTime'] ? 'day.png' : 'night.png';
    Color bgColor= data['isDayTime'] ? Colors.blue : Colors.indigo;
    Color fColor=data['isDayTime'] ? Colors.black : Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
              ),
          ),
            child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/location');
                  },
                  icon: Icon(Icons.edit_location,color: fColor),
                  label: Text("Edit Location",style: TextStyle(color: fColor),),
                
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      // 'lol',
                      data['location'],
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: fColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      // 'lol',
                      data['flag'],
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: fColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      // 'lol',
                      data['time'],
                      style: TextStyle(
                        color: fColor,
                        fontSize: 66.0,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
