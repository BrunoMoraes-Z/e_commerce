import 'package:e_commerce/screens/splash/splash.dart';
import 'package:e_commerce/utils/routes.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

//10m10s
//https://www.youtube.com/watch?v=iZqxIvlzXVw&t=79s
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      // home: SplashScreen(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
