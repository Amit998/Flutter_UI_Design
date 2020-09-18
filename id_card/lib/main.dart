import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CardId(),
    ));

class CardId extends StatefulWidget {
  @override
  _CardIdState createState() => _CardIdState();
}

class _CardIdState extends State<CardId> {
  int level = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text("ID Card"),
        backgroundColor: Colors.grey[850],
        elevation: 10.0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         
          setState(() {
             level=1+level;
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.grey[800],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/avatar.png'),
                radius: 40.0,
              ),
            ),
            Divider(
              height: 60.0,
              color: Colors.grey[800],
            ),
            Text(
              "Name",
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              "Amit Dutta",
              style: TextStyle(
                  color: Colors.amberAccent[200],
                  letterSpacing: 2.0,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              "Current Skill Level",
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              '$level',
              style: TextStyle(
                  color: Colors.amberAccent[200],
                  letterSpacing: 2.0,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.mail,
                      color: Colors.grey,
                    )
                  ],
                ),
                SizedBox(width: 10.0),
                Column(
                  children: [
                    Text(
                      "damitlucky998@gmail.com",
                      style: TextStyle(
                        color: Colors.amberAccent[200],
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                        fontSize: 14.0,
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
