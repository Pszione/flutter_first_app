import 'package:flutter/material.dart';

import 'package:flutter_first_app/constants_shop.dart';
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
          child: Column(
            children: [
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
              SignForms()
            ],
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
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Email',
              hintText: 'Enter our email',
              //
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 42, vertical: 20),
              //
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28),
                borderSide: BorderSide(color: kTextColor),
                gapPadding: 10,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28),
                borderSide: BorderSide(color: kTextColor),
                gapPadding: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
