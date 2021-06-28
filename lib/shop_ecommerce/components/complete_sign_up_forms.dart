import 'package:flutter/material.dart';
import 'package:flutter_first_app/components/custom_suffix_icon.dart';
import 'package:flutter_first_app/components/form_error.dart';
import 'package:flutter_first_app/helper/keyboard_util.dart';

import '../../constants_shop.dart';
import '../../size_config.dart';
import 'default_big_button.dart';

class CompleteSignUpProfile extends StatefulWidget {
  const CompleteSignUpProfile({Key key}) : super(key: key);

  @override
  _CompleteSignUpProfileState createState() => _CompleteSignUpProfileState();
}

class _CompleteSignUpProfileState extends State<CompleteSignUpProfile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<String> errors = <String>[];
  String firstName;
  String lastName;
  String phoneNumber;
  String address;

  void addError({String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String error}) {
    if (error.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final SizeConfig _sizes = SizeConfig().init(context);
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          buildFirstNameFormField(_sizes),
          SizedBox(height: _sizes.getProportionateScreenHeight(20)),
          buildLastNameFormField(_sizes),
          SizedBox(height: _sizes.getProportionateScreenHeight(20)),
          buildPhoneNumberFormField(_sizes),
          SizedBox(height: _sizes.getProportionateScreenHeight(20)),
          buildAddressFormField(_sizes),
          SizedBox(height: _sizes.getProportionateScreenHeight(30)),
          FormErrorChecker(sizes: _sizes, errors: errors),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          DefaultBigButton(
            sizes: _sizes,
            text: 'Continue!',
            onPress: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                // Go to OTP screen
                KeyboardUtil.hideKeyboard(context);
                //Navigator.pushNamed(context, ShopLoginSuccessScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildFirstNameFormField(SizeConfig _sizes) {
    return TextFormField(
      onSaved: (String newValue) => firstName = newValue,
      onChanged: (String fieldValue) {
        if (fieldValue.isNotEmpty) {
          removeError(error: kNameNullError);
        }
        _formKey.currentState.validate();
        return null;
      },
      //
      validator: (String fieldValue) {
        if (fieldValue.isEmpty) {
          addError(error: kNameNullError);
          return '';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'First Name',
        hintText: 'Enter your first name',
        //floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          sizes: _sizes,
          svgIcon: 'assets/icons/User.svg',
        ),
      ),
    );
  }

  TextFormField buildLastNameFormField(SizeConfig _sizes) {
    return TextFormField(
      onSaved: (String newValue) => lastName = newValue,
      decoration: InputDecoration(
        labelText: 'First Name',
        hintText: 'Enter your first name',
        //floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          sizes: _sizes,
          svgIcon: 'assets/icons/User.svg',
        ),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField(SizeConfig _sizes) {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (String newValue) => phoneNumber = newValue,
      onChanged: (String fieldValue) {
        if (fieldValue.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        _formKey.currentState.validate();
        return null;
      },
      //
      validator: (String fieldValue) {
        if (fieldValue.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return '';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Phone Number',
        hintText: 'Enter your phone number',
        //floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          sizes: _sizes,
          svgIcon: 'assets/icons/Phone.svg',
        ),
      ),
    );
  }

  TextFormField buildAddressFormField(SizeConfig _sizes) {
    return TextFormField(
      onSaved: (String newValue) => address = newValue,
      onChanged: (String fieldValue) {
        if (fieldValue.isNotEmpty) {
          removeError(error: kAddressNullError);
        }
        _formKey.currentState.validate();
        return null;
      },
      //
      validator: (String fieldValue) {
        if (fieldValue.isEmpty) {
          addError(error: kAddressNullError);
          return '';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Address',
        hintText: 'Enter your address',
        //floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          sizes: _sizes,
          svgIcon: 'assets/icons/Location point.svg',
        ),
      ),
    );
  }
}
