import 'package:e_commerce/screens/forgot_password/forgot_password.dart';
import 'package:e_commerce/screens/login_success/login_success.dart';
import 'package:e_commerce/screens/sign_in/sign_in.dart';
import 'package:e_commerce/screens/splash/splash.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {

  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),

};