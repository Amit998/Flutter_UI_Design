import 'package:flutter/material.dart';
import 'package:yaari_app/widgets/header.dart';


class TimeLine extends StatefulWidget {
  @override
  _TimeLineState createState() => _TimeLineState();
}

class _TimeLineState extends State<TimeLine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context,isAppTitle: true,titleText:"YaariApp"),
      body: Text('Text Timeline'),
      
    );
  }
}