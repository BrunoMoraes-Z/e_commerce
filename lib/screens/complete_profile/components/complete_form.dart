import 'package:e_commerce/components/custom_suffix_icon.dart';
import 'package:e_commerce/components/default_button.dart';
import 'package:e_commerce/components/form_error.dart';
import 'package:e_commerce/screens/otp/otp_screen.dart';
import 'package:e_commerce/utils/constants.dart';
import 'package:e_commerce/utils/size_config.dart';
import 'package:e_commerce/utils/validator.dart';
import 'package:flutter/material.dart';

class CompleteProfileForm extends StatefulWidget {
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String firstName = '', lastName = '', phone = '', address = '';

  void addError({String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildFirstNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildLastNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAddressFormField(),
          SizedBox(height: errors.length == 0 ? 0 : 8),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: 'Continue',
            press: () {
              if (_formKey.currentState.validate()) {
                Navigator.pushNamed(context, OtpScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      textInputAction: TextInputAction.next,
      onSaved: (newValue) => firstName = newValue,
      onChanged: (value) => {
        firstName = value,
        Validator(
          validation: firstName.isNotEmpty,
          success: () => {setState(() => errors.clear()), _formKey.currentState.validate()},
          fail: () => value.isEmpty ? addError(error: kNamelNullError) : null
        )
      },
      validator: (value) {
        Validator(
            validation: firstName.isNotEmpty,
            success: () => setState(() => errors.clear()),
            fail: () => value.isEmpty ? addError(error: kNamelNullError) : null
        );
        return errors.length > 0 ? '' : null;
      },
      decoration: InputDecoration(
        errorStyle: TextStyle(height: 0),
        labelText: 'First Name',
        hintText: 'Enter your first name',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/User.svg'),
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      textInputAction: TextInputAction.next,
      onSaved: (newValue) => lastName = newValue,
      onChanged: (value) => {
        lastName = value,
        Validator(
            validation: lastName.isNotEmpty,
            success: () => {setState(() => errors.clear()), _formKey.currentState.validate()},
            fail: () => value.isEmpty ? addError(error: kNamelNullError) : null
        )
      },
      validator: (value) {
        Validator(
            validation: lastName.isNotEmpty,
            success: () => setState(() => errors.clear()),
            fail: () => value.isEmpty ? addError(error: kNamelNullError) : null
        );
        return errors.length > 0 ? '' : null;
      },
      decoration: InputDecoration(
        errorStyle: TextStyle(height: 0),
        labelText: 'Last Name',
        hintText: 'Enter your last name',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/User.svg'),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      onSaved: (newValue) => phone = newValue,
      onChanged: (value) => {
        phone = value,
        Validator(
            validation: phone.isNotEmpty,
            success: () => {setState(() => errors.clear()), _formKey.currentState.validate()},
            fail: () => value.isEmpty ? addError(error: kPhoneNumberNullError) : null
        )
      },
      validator: (value) {
        Validator(
            validation: phone.isNotEmpty,
            success: () => setState(() => errors.clear()),
            fail: () => value.isEmpty ? addError(error: kPhoneNumberNullError) : null
        );
        return errors.length > 0 ? '' : null;
      },
      decoration: InputDecoration(
        errorStyle: TextStyle(height: 0),
        labelText: 'Phone Number',
        hintText: 'Enter your phone number',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/Phone.svg'),
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      textInputAction: TextInputAction.done,
      onSaved: (newValue) => address = newValue,
      onChanged: (value) => {
        address = value,
        Validator(
            validation: address.isNotEmpty,
            success: () => {setState(() => errors.clear()), _formKey.currentState.validate()},
            fail: () => value.isEmpty ? addError(error: kAddressNullError) : null
        )
      },
      validator: (value) {
        Validator(
            validation: address.isNotEmpty,
            success: () => setState(() => errors.clear()),
            fail: () => value.isEmpty ? addError(error: kAddressNullError) : null
        );
        return errors.length > 0 ? '' : null;
      },
      decoration: InputDecoration(
        errorStyle: TextStyle(height: 0),
        labelText: 'Address',
        hintText: 'Enter your Address',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSuffixIcon(svgIcon: 'assets/icons/Location point.svg'),
      ),
    );
  }
}
