import 'package:flutter/material.dart';
import 'package:layout_basic/app/sign_in/social_sign_in_button.dart';
import '../common_widgets/custom_raised_button.dart';
import '../sign_in/sign_in_button.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Time Tracker'),
        elevation: 10.0,
      ),
      body: _buildContainer(),
      backgroundColor: Colors.grey[200],
    );
  }

  Container _buildContainer() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            "Sign In",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26.0,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 48.0),

          CustomRaisedButton(
            child: SocialSignInButton(
            assetName: 'images/fb.png',
            text: 'Login With Faceook',
            textColor: Colors.white,
            color: Colors.blue[900],
            onPressed: (){},
          ),
          ),
          SizedBox(height: 48.0),

        

          CustomRaisedButton(
            child: SocialSignInButton(
            assetName: 'images/google.png',
            text: 'Login With Google',
            textColor: Colors.black,
            color: Colors.white,
            onPressed: (){},
          )),




          SizedBox(height: 8.0),
          // SignInButton(
          //   text: 'Sign in with Facebook',
          //   textColor: Colors.white,
          //   color: Colors.blue[900],
          //   onPressed: () {},
          // ),
          SizedBox(height: 8.0),
          SignInButton(
            text: 'Sign in with Email',
            textColor: Colors.white,
            color: Colors.green[800],
            onPressed: () {},
          ),
          SizedBox(height: 8.0),

          Text(
            "OR",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 8.0),
          SignInButton(
            text: 'Go Annoymous',
            textColor: Colors.black,
            color: Colors.lime[300],
            onPressed: () {},
          ),

          // CustomRaisedButton()
        ],
      ),
    );
  }
}
