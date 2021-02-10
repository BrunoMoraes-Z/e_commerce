import 'package:e_commerce/screens/splash/components/body.dart';
import 'package:e_commerce/utils/size_config.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {

  static String routeName = '/splash';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
