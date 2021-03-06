import 'package:e_commerce/components/custom_suffix_icon.dart';
import 'package:e_commerce/components/default_button.dart';
import 'package:e_commerce/components/form_error.dart';
import 'package:e_commerce/screens/forgot_password/forgot_password.dart';
import 'package:e_commerce/screens/login_success/login_success.dart';
import 'package:e_commerce/utils/constants.dart';
import 'package:e_commerce/utils/size_config.dart';
import 'package:e_commerce/utils/validator.dart';
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

  void addError({String error}) {
    if (!errors.contains(error)) setState(() => errors.add(error));
  }

  void removeError({String error}) {
    if (errors.contains(error)) setState(() => errors.remove(error));
  }

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
                  setState(() => remember = value);
                },
              ),
              Text('Remember me'),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, ForgotPasswordScreen.routeName),
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

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) => {
        email = value,
        Validator(
          validation: value.isNotEmpty && emailValidatorRegExp.hasMatch(value),
          success: () => {
            setState(() => errors.clear()),
            _formKey.currentState.validate()
          },
          fail: () => value.isEmpty
              ? addError(error: kEmailNullError)
              : {
            removeError(error: kEmailNullError),
            addError(error: kInvalidEmailError)
          },
        ),
      },
      validator: (value) {
        Validator(
          validation: value.isNotEmpty && emailValidatorRegExp.hasMatch(value),
          success: () => setState(() => errors.clear()),
          fail: () => value.isEmpty
              ? addError(error: kEmailNullError)
              : addError(error: kInvalidEmailError),
        );
        return errors.length > 0 ? '' : null;
      },
      decoration: InputDecoration(
        errorStyle: TextStyle(height: 0),
        labelText: 'Email',
        hintText: 'Enter your email',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/Mail.svg'),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      textInputAction: TextInputAction.done,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) => {
        password = value,
        Validator(
          validation: value.isNotEmpty && value.length > 7,
          success: () => {
            setState(() => errors.clear()),
            _formKey.currentState.validate()
          },
          fail: () => value.isEmpty
              ? addError(error: kPassNullError)
              : {
            removeError(error: kPassNullError),
            addError(error: kShortPassError)
          },
        ),
      },
      validator: (value) {
        Validator(
          validation: value.isNotEmpty && value.length > 7,
          success: () => setState(() => errors.clear()),
          fail: () => value.isEmpty
              ? addError(error: kPassNullError)
              : addError(error: kShortPassError),
        );
        return errors.length > 0 ? '' : null;
      },
      decoration: InputDecoration(
        errorStyle: TextStyle(height: 0),
        labelText: 'Password',
        hintText: 'Enter your password',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/Lock.svg'),
      ),
    );
  }
}
