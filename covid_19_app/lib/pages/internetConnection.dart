import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class InternetConnection extends StatefulWidget {
  @override
  _InternetConnectionState createState() => _InternetConnectionState();
}

class _InternetConnectionState extends State<InternetConnection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: RaisedButton(
          child: Text('Check'),
          onPressed: _checkInternetConnetion,
        ),
      ),
    );
  }

  _checkInternetConnetion() async {
    var result = await Connectivity().checkConnectivity();
    print(ConnectivityResult.values);
    // print(result);
    if (result == ConnectivityResult.none) {
      print('none');
    } else if (result == ConnectivityResult.mobile) {
      print('mobile');
    } else if (result == ConnectivityResult.wifi) {
      print('wif');
    }
  }
}
