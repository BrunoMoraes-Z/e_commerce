import 'package:e_commerce/components/custom_suffix_icon.dart';
import 'package:e_commerce/components/default_button.dart';
import 'package:e_commerce/components/form_error.dart';
import 'package:e_commerce/screens/forgot_password/forgot_password.dart';
import 'package:e_commerce/screens/login_success/login_success.dart';
import 'package:e_commerce/utils/constants.dart';
import 'package:e_commerce/utils/size_config.dart';
import 'package:flutter/material.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String email = '', password = '';
  bool remember = false;
  final List<String> errors = [];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              Text('Remember me'),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.popAndPushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: Text(
                  'Forgot Password',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: 'Continue',
            press: () {
              if (_formKey.currentState.validate()) {
                if (errors.length == 0) {
                  _formKey.currentState.save();
                  // if all are valid then go to success screen
                  Navigator.pushNamed(context, LoginSuccessScreen.routeName);
                }
              }
            },
          )
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          if (errors.contains(kPassNullError)) {
            setState(() => errors.remove(kPassNullError));
          }
          if (value.length > 5) {
            setState(() => errors.remove(kShortPassError));
          } else {
            if (!errors.contains(kShortPassError)) {
              setState(() => errors.add(kShortPassError));
              return '';
            }
          }
        } else {
          if (!errors.contains(kPassNullError)) {
            setState(() => errors.add(kPassNullError));
            return '';
          }
        }
        return null;
      },
      validator: (value) {
        if (value.isNotEmpty) {
          if (errors.contains(kPassNullError)) {
            setState(() => errors.remove(kPassNullError));
          }
          if (value.length > 5) {
            setState(() => errors.remove(kShortPassError));
          } else {
            if (!errors.contains(kShortPassError)) {
              setState(() => errors.add(kShortPassError));
              return '';
            }
          }
        } else {
          if (!errors.contains(kPassNullError)) {
            setState(() => errors.add(kPassNullError));
            return '';
          }
        }
        return null;
      },
      decoration: InputDecoration(
          errorStyle: TextStyle(height: 0),
          labelText: 'Password',
          hintText: 'Enter your password',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(
            svgIcon: 'assets/icons/Lock.svg',
          )),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          if (errors.contains(kEmailNullError)) {
            setState(() => errors.remove(kEmailNullError));
          }
          if (emailValidatorRegExp.hasMatch(value)) {
            setState(() => errors.remove(kInvalidEmailError));
          } else {
            if (!errors.contains(kInvalidEmailError)) {
              setState(() => errors.add(kInvalidEmailError));
              return '';
            }
          }
        } else {
          if (!errors.contains(kEmailNullError)) {
            setState(() => errors.add(kEmailNullError));
            return '';
          }
        }
        return null;
      },
      validator: (value) {
        if (value.isNotEmpty) {
          if (errors.contains(kEmailNullError)) {
            setState(() => errors.remove(kEmailNullError));
          }
          if (emailValidatorRegExp.hasMatch(value)) {
            setState(() => errors.remove(kInvalidEmailError));
          } else {
            if (!errors.contains(kInvalidEmailError)) {
              setState(() => errors.add(kInvalidEmailError));
              return '';
            }
          }
        } else {
          if (!errors.contains(kEmailNullError)) {
            setState(() => errors.add(kEmailNullError));
            return '';
          }
        }
        return null;
      },
      decoration: InputDecoration(
          errorStyle: TextStyle(height: 0),
          labelText: 'Email',
          hintText: 'Enter your email',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(
            svgIcon: 'assets/icons/Mail.svg',
          )),
    );
  }
}
