import 'package:connectivity/connectivity.dart';
import 'package:covid_19_app/datasource.dart';
import 'package:covid_19_app/homepage.dart';
import 'package:covid_19_app/pages/internetConnection.dart';
import 'package:covid_19_app/pages/noInternetConnection.dart';
import 'package:covid_19_app/panels/wrapper.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var result = Connectivity().checkConnectivity();

  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      data: (brightness) {
        return ThemeData(
            primaryColor: primaryColor,
            fontFamily: 'Circle',
            brightness: brightness == Brightness.light
                ? Brightness.light
                : Brightness.dark,
            scaffoldBackgroundColor: brightness == Brightness.dark
                ? Colors.grey[900]
                : Colors.white);
      },
      themedWidgetBuilder: (context, theme) {
        return MaterialApp(
            debugShowCheckedModeBanner: false, theme: theme, home: Wrapper());

        // home: statusCheck() == true ? NoConnection() : HomePage());
        // home: status == false ? NoConnection() : HomePage()
        // _checkInternetConnetion() == 'none' ? HomePage() : NoConnection(),
        // home: NoConnection(),
      },
    );
  }

  statusCheck() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      print('true');
      return true;
    } else {
      print('false');
      return false;
    }
  }

  Future checkInternetConnetion() async {
    var result = await Connectivity().checkConnectivity();
    // print(ConnectivityResult.values);
    // print(result);
    if (result == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }
}
