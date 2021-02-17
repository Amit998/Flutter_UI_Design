import 'package:flutter/material.dart';
import 'package:pet_application/configuration.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryGreen,
      padding: EdgeInsets.only(top: 50, left: 20, bottom: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("UserName",
                      style: TextStyle(
                          color: Colors.white,
                          // fontSize: 20,
                          
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 5,
                  ),
                  Text("Active Status",
                      style: TextStyle(color: Colors.grey[100]))
                ],
              )
            ],
          ),
          Column(
              children: drawerItems
                  .map((element) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              element['icon'],
                              color: Colors.white,
                              size: 30,
                            ),
                            SizedBox(width: 10),
                            Text(
                              element['title'],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            )
                          ],
                        ),
                      ))
                  .toList()),
          Row(
            children: [
              Icon(
                Icons.settings,
                color: Colors.white,
              ),
              SizedBox(width: 4),
              Text(
                "Settings",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(width: 4),
              Container(
                width: 2,
                height: 20,
                color: Colors.white,
              ),
              SizedBox(width: 4),
              Text("Log out",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white))
            ],
          )
        ],
      ),
    );
  }
}
