import 'package:e_commerce_ui/screens/cart/cart_screen.dart';
import 'package:e_commerce_ui/screens/complete_profile_page/complete_profile_screen.dart';
import 'package:e_commerce_ui/screens/details/details_screen.dart';
import 'package:e_commerce_ui/screens/forgot_Password/forgot_password.dart';
import 'package:e_commerce_ui/screens/home/home_screen.dart';
import 'package:e_commerce_ui/screens/login_success/login_success_screen.dart';
import 'package:e_commerce_ui/screens/otp/otp_screen.dart';
import 'package:e_commerce_ui/screens/sign_in/sign_in_screen.dart';
import 'package:e_commerce_ui/screens/sign_up/sign_up_screen.dart';
import 'package:e_commerce_ui/screens/spalsh/splash_screen.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName:(context) => HomeScreen(),
  DetailScreen.routeName:(context) => DetailScreen(),
  CartScreen.routeName:(context) => CartScreen(),

};
