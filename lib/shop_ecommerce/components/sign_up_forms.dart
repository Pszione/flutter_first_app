import 'package:flutter/material.dart';
import 'package:flutter_first_app/components/custom_suffix_icon.dart';
import 'package:flutter_first_app/components/form_error.dart';
import 'package:flutter_first_app/helper/keyboard_util.dart';
import 'package:flutter_first_app/shop_ecommerce/complete_profile/shop_complete_sign_up_profile_screen.dart';

import '../../constants_shop.dart';
import '../../size_config.dart';
import 'default_big_button.dart';

class SignUpForms extends StatefulWidget {
  const SignUpForms({Key key}) : super(key: key);

  @override
  _SignUpFormsState createState() => _SignUpFormsState();
}

class _SignUpFormsState extends State<SignUpForms> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<String> errors = <String>[];
  String email;
  String password;
  String passwordConfirmation;

  void addError({String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String error}) {
    // there's something wrong here
    if (errors.contains(error)) {
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
          buildEmailFormField(_sizes),
          SizedBox(height: _sizes.getProportionateScreenHeight(20)),
          buildPasswordFormField(_sizes),
          SizedBox(height: _sizes.getProportionateScreenHeight(20)),
          buildPasswordConfirmationFormField(_sizes),
          SizedBox(height: _sizes.getProportionateScreenHeight(10)),
          FormErrorChecker(sizes: _sizes, errors: errors),
          SizedBox(height: _sizes.getProportionateScreenHeight(50)),
          DefaultBigButton(
            sizes: _sizes,
            text: 'Continue!',
            onPress: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                // if all are valid then go to complete profile screen
                KeyboardUtil.hideKeyboard(context);
                Navigator.pushNamed(
                    context, ShopCompleteSignUpProfileScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildEmailFormField(SizeConfig _sizes) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (String newValue) => email = newValue,
      onChanged: (String fieldValue) {
        if (fieldValue.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (kEmailValidatorRegex.hasMatch(fieldValue)) {
          removeError(error: kInvalidEmailError);
        }
        _formKey.currentState.validate();
        return null;
      },
      //
      validator: (String fieldValue) {
        if (fieldValue.isEmpty) {
          addError(error: kEmailNullError);
          return '';
        } else if (!kEmailValidatorRegex.hasMatch(fieldValue)) {
          addError(error: kInvalidEmailError);
          return '';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'Enter your email',
        //floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          sizes: _sizes,
          svgIcon: 'assets/icons/Mail.svg',
        ),
      ),
    );
  }

  TextFormField buildPasswordFormField(SizeConfig _sizes) {
    return TextFormField(
      obscureText: true,
      onSaved: (String newValue) => password = newValue,
      onChanged: (String fieldValue) {
        password = fieldValue;
        if (fieldValue.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (fieldValue.length >= 6) {
          removeError(error: kShortPassError);
        }
        _formKey.currentState.validate();
        return null;
      },
      //
      validator: (String fieldValue) {
        if (fieldValue.isEmpty) {
          addError(error: kPassNullError);
          return '';
        } else if (fieldValue.length < 6) {
          addError(error: kShortPassError);
          return '';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your password',
        //floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          sizes: _sizes,
          svgIcon: 'assets/icons/Lock.svg',
        ),
      ),
    );
  }

  TextFormField buildPasswordConfirmationFormField(SizeConfig _sizes) {
    return TextFormField(
      obscureText: true,
      onSaved: (String newValue) => passwordConfirmation = newValue,
      onChanged: (String fieldValue) {
        passwordConfirmation = fieldValue;
        if (password == passwordConfirmation) {
          removeError(error: kMatchPassError);
        }
        _formKey.currentState.validate();
        return null;
      },
      //
      validator: (String fieldValue) {
        if (fieldValue.isEmpty) {
          return '';
        } else if (password != passwordConfirmation) {
          // != fieldValue
          addError(error: kMatchPassError);
          return '';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Confirm Password',
        hintText: 'Repeat your password',
        //floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          sizes: _sizes,
          svgIcon: 'assets/icons/Lock.svg',
        ),
      ),
    );
  }
}
