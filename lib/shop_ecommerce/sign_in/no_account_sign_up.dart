import 'package:flutter/material.dart';
import 'package:flutter_first_app/shop_ecommerce/forgot_password/forgot_password_screen.dart';

import '../../constants_shop.dart';
import '../../size_config.dart';

class NoAccountSignUp extends StatelessWidget {
  const NoAccountSignUp({
    Key key,
    @required SizeConfig sizes,
  })  : _sizes = sizes,
        super(key: key);

  final SizeConfig _sizes;

  @override
  Widget build(BuildContext context) {
    return Row(
      // this is how to center
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Don't have an account?",
          style: TextStyle(fontSize: _sizes.getProportionateScreenWidth(16)),
        ),
        GestureDetector(
          // Wrong route name
          onTap: () => Navigator.popAndPushNamed(
              context, ShopForgotPasswordScreen.routeName),
          child: Text(
            ' Sign Up',
            style: TextStyle(
                fontSize: _sizes.getProportionateScreenWidth(16),
                color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
