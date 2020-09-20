import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import '../services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'loading...';

  void setUpWorldTime() async{
    WorldTime worldTime =WorldTime(location: 'Berlin',flag: 'Berlin',url: 'Europe/Berlin/');
    await worldTime.getTime();
    print(worldTime.time);
    setState(() {
      time=worldTime.time;
    });

  }


  @override
  void initState() {
    super.initState();
    // print('initState function ran');
    setUpWorldTime();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: Text(time),
      ),
    );
  }
}
