import 'package:ebook_app/screens/home_screen.dart';
import 'package:ebook_app/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

import 'consttants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: Theme.of(context).textTheme.apply(
              displayColor: kBlackColor,
            ),
      ),
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/Bitmap.png"), fit: BoxFit.fill),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                  style: Theme.of(context).textTheme.display3,
                  children: [
                    TextSpan(
                      text: "Flamin",
                    ),
                    TextSpan(
                        text: "go",
                        style: TextStyle(fontWeight: FontWeight.bold))
                  ]),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.45,
              child: RoundedButton(
                press: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return HomeScreen();
                    },
                  ));
                },
                text: "Start Reading...",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
