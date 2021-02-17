import 'package:connectivity/connectivity.dart';
import 'package:covid_19_app/homepage.dart';
import 'package:covid_19_app/pages/noInternetConnection.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  bool flag = false;
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return flag
        ? Container(
            child: CircularProgressIndicator(),
          )
        : status
            ? NoConnection()
            : HomePage();
  }

  checkInternetConnetion() async {
    var result = await Connectivity().checkConnectivity();
    // print(ConnectivityResult.values);
    // print(result);
    if (result == ConnectivityResult.none) {
      setState(() {
        flag = false;
        status = true;
      });
    } else {
      flag = false;
      status = false;
    }
  }
}
