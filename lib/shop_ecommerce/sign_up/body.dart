import 'package:flutter/material.dart';

import '../../constants_shop.dart';
import '../../size_config.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SizeConfig _sizes = SizeConfig().init(context);
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Text(
            'Register Account',
            style: tHeadingStyle,
          ),
          Text(
            'Complete your details or continue \nwith social media',
            textAlign: TextAlign.center,
          ),
          SizedBox(height: _sizes.getProportionateScreenWidth(20)),
          SignUpForms(),
        ],
      ),
    );
  }
}

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

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[],
      ),
    );
  }
}
