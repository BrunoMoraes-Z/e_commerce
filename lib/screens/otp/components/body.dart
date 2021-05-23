import 'package:e_commerce/utils/constants.dart';
import 'package:e_commerce/utils/size_config.dart';
import 'package:flutter/material.dart';

import 'otp_form.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool valid = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.05),
                Text('OTP Verification', style: headingStyle),
                Text('We sent your code to +1 898 860 ***'),
                buildTimer(),
                SizedBox(height: SizeConfig.screenHeight * 0.15),
                OtpForm(isValid: valid),
                SizedBox(height: SizeConfig.screenHeight * 0.1),
                GestureDetector(
                  key: ValueKey('btn_resend'),
                  onTap: () {
                    //resend the code
                  },
                  child: Text(
                    'Resend OTP Code',
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('This code will expires in '),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0),
          duration: Duration(seconds: 30), // becase we allow user 30s
          builder: (context, value, child) => Text(
            '00:${value.toInt() > 9 ? value.toInt() : "0${value.toInt()}"}',
            style: TextStyle(color: kPrimaryColor),
          ),
          onEnd: () {
            setState(() {
              valid = false;
            });
          },
        )
      ],
    );
  }
}
