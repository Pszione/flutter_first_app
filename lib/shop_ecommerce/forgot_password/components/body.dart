import 'package:flutter/material.dart';

import '../../../size_config.dart';

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
            'Forgot your Password',
            style: TextStyle(
              fontSize: _sizes.getProportionateScreenWidth(28),
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Please enter your email and we will send \nyou a link to return to your account',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
