import 'package:e_commerce/screens/splash/splash.dart';
import 'package:e_commerce/utils/routes.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

//16m47s
//https://www.youtube.com/watch?v=iZqxIvlzXVw
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
