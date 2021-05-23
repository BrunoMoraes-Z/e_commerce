import 'package:e_commerce/components/custom_suffix_icon.dart';
import 'package:e_commerce/components/default_button.dart';
import 'package:e_commerce/components/form_error.dart';
import 'package:e_commerce/screens/complete_profile/complete_profile.dart';
import 'package:e_commerce/utils/constants.dart';
import 'package:e_commerce/utils/size_config.dart';
import 'package:e_commerce/utils/validator.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String email, password, confirm_password;
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
          buildConfPasswordFormField(),
          SizedBox(height: errors.length == 0 ? 0 : 8),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            key: ValueKey('btn_continue'),
            text: 'Continue',
            press: () {
              if (_formKey.currentState.validate()) {
                Navigator.pushNamed(context, CompleteProfileScreen.routeName);
              }
            },
          )
        ],
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      key: ValueKey('input_email'),
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
      key: ValueKey('input_password'),
      obscureText: true,
      textInputAction: TextInputAction.next,
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

  TextFormField buildConfPasswordFormField() {
    return TextFormField(
      key: ValueKey('input_confirm_password'),
      obscureText: true,
      textInputAction: TextInputAction.done,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) => {
        confirm_password = value,
        Validator(
          validation: value.isNotEmpty && password == confirm_password,
          success: () => {
            setState(() => errors.clear()),
            _formKey.currentState.validate()
          },
          fail: () => value.isEmpty
              ? addError(error: kPassNullError)
              : {
                  removeError(error: kPassNullError),
                  addError(error: kMatchPassError)
                },
        )
      },
      validator: (value) {
        Validator(
          validation: value.isNotEmpty && password == confirm_password,
          success: () => setState(() => errors.clear()),
          fail: () => value.isEmpty
              ? addError(error: kPassNullError)
              : addError(error: kMatchPassError),
        );
        return errors.length > 0 ? '' : null;
      },
      decoration: InputDecoration(
        errorStyle: TextStyle(height: 0),
        labelText: 'Confirm Password',
        hintText: 'Re-enter your password',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/Lock.svg'),
      ),
    );
  }
}
