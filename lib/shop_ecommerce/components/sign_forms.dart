import 'package:flutter/material.dart';
import 'package:flutter_first_app/components/custom_suffix_icon.dart';
import 'package:flutter_first_app/components/form_error.dart';
import 'package:flutter_first_app/shop_ecommerce/forgot_password/forgot_password_screen.dart';
import 'package:flutter_first_app/shop_ecommerce/login_success/shop_login_success_screen.dart';

import '../../constants_shop.dart';
import '../../size_config.dart';
import 'default_big_button.dart';
import 'no_account_sign_up.dart';

class SignForms extends StatefulWidget {
  const SignForms({Key key}) : super(key: key);

  @override
  _SignFormsState createState() => _SignFormsState();
}

class _SignFormsState extends State<SignForms> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<String> errors = <String>[];
  String email;
  String password;
  bool rememberMe = false;

  void addError({String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String eWrror}) {
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
          SizedBox(height: _sizes.getProportionateScreenHeight(10)),
          Row(
            children: <Widget>[
              Checkbox(
                value: rememberMe,
                activeColor: kPrimaryColor,
                onChanged: (bool value) {
                  setState(() {
                    rememberMe = value;
                  });
                },
              ),
              Text('Remember me'),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ShopForgotPasswordScreen.routeName),
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
          FormErrorChecker(sizes: _sizes, errors: errors),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          DefaultBigButton(
            sizes: _sizes,
            text: 'Sign in!',
            onPress: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                // if all are valid then go to success screen
                Navigator.pushNamed(context, ShopLoginSuccessScreen.routeName);
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
}
