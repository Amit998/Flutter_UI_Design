import 'package:flutter/material.dart';

class NoConnection extends StatefulWidget {
  @override
  _NoConnectionState createState() => _NoConnectionState();
}

class _NoConnectionState extends State<NoConnection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/error.gif",
                height: 200,
                width: double.infinity,
              )
            ],
          ),
        ),
    );
  }
}
