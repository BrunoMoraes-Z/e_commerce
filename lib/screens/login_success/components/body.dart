import 'package:e_commerce/components/default_button.dart';
import 'package:e_commerce/utils/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.08), // without app bar
        Container(
          width: double.infinity,
          child: Image.asset(
            'assets/images/success.png',
            height: SizeConfig.screenHeight * 0.5,
            fit: BoxFit.fitWidth,
          ),
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Text(
          'Login Success',
          style: TextStyle(
              fontSize: getProportionateScreenWidth(30),
              fontWeight: FontWeight.bold,
              color: Colors.black,),
        ),
        Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text: 'Back to home',
            press: () {},
          ),
        ),
        Spacer(),
      ],
    );
  }
}
