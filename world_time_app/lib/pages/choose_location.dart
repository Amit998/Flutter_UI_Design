import 'package:flutter/material.dart';
import 'dart:async';
class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation>{
  void getData () async{
    await Future.delayed(Duration(seconds: 3), () {
      print('Amit');
    });
    print('lol');
  }

  @override
  void initState() {
    super.initState();
    // print('initState function ran');
    getData();
  }

  @override
  Widget build(BuildContext context) {
    print('build function ran');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.amber[900],
        centerTitle: true,
        title: Text('Choose The Location'),
        elevation: 0.0,
      ),
      body: Text("Choose Location Screen"),
    );
  }
}
