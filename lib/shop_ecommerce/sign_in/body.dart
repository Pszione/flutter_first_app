import 'package:flutter/material.dart';
import 'package:flutter_first_app/components/custom_suffix_icon.dart';
import 'package:flutter_first_app/components/form_error.dart';

import 'package:flutter_first_app/constants_shop.dart';
import 'package:flutter_first_app/shop_ecommerce/components/default_big_button.dart';
import 'package:flutter_first_app/shop_ecommerce/forgot_password/forgot_password_screen.dart';
import 'package:flutter_first_app/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SizeConfig _sizes = SizeConfig().init(context);
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: _sizes.getProportionateScreenWidth(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text(
                  'Welcome Back',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: _sizes.getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Sign in with your email and password \nor continue with social media',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.1),
                SignForms(),
                SizedBox(height: SizeConfig.screenHeight * 0.1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignForms extends StatefulWidget {
  const SignForms({Key key}) : super(key: key);

  @override
  _SignFormsState createState() => _SignFormsState();
}

class _SignFormsState extends State<SignForms> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<String> errors = <String>['Any error'];
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
          SizedBox(height: _sizes.getProportionateScreenHeight(30)),
          FormErrorChecker(sizes: _sizes, errors: errors),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          DefaultBigButton(
            sizes: _sizes,
            text: 'Sign in!',
            onPress: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
              }
            },
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
        ],
      ),
    );
  }

  TextFormField buildEmailFormField(SizeConfig _sizes) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: (String fieldValue) {
        if ((fieldValue.isEmpty || fieldValue.length <= 3) &&
            !errors.contains(kEmailNullError)) {
          setState(() {
            errors.add(kEmailNullError);
          });
        } else if (!kEmailValidatorRegex.hasMatch(fieldValue) &&
            !errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.add(kInvalidEmailError);
          });
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
}

TextFormField buildPasswordFormField(SizeConfig _sizes) {
  return TextFormField(
    obscureText: true,
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
