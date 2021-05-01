import 'package:e_commerce/screens/splash/splash.dart';
import 'package:e_commerce/utils/routes.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

//https://www.youtube.com/watch?v=sOVgPx8ljaE
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
