import 'package:e_commerce/components/custom_suffix_icon.dart';
import 'package:e_commerce/components/default_button.dart';
import 'package:e_commerce/components/form_error.dart';
import 'package:e_commerce/components/no_account_text.dart';
import 'package:e_commerce/utils/constants.dart';
import 'package:e_commerce/utils/size_config.dart';
import 'package:e_commerce/utils/validator.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.1),
                Text(
                  'Forgot Password',
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(24),
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Please enter your email and we will\n you a link to return to your account',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.1),
                ForgotPassForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ForgotPassForm extends StatefulWidget {
  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String email;

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
          SizedBox(
              height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          SizedBox(
              height: errors.length == 0
                  ? SizeConfig.screenHeight * 0.1
                  : SizeConfig.screenHeight * 0.075),
          DefaultButton(
            text: 'Continue',
            press: () {
              if (_formKey.currentState.validate()) {
                // _formKey.currentState.save();
              }
            },
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          NoAccountText()
        ],
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
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
              ? {
                  removeError(error: kInvalidEmailError),
                  addError(error: kEmailNullError)
                }
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
        suffixIcon: CustomSuffixIcon(
          svgIcon: 'assets/icons/Mail.svg',
        ),
      ),
    );
  }
}
