import 'package:e_commerce/screens/sign_in/components/body.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {

  static String routeName = "/sign_in";

        //17m44s
        //https://www.youtube.com/watch?v=0Z-IgS267xw&t=325s
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Body(),
    );
  }
}
