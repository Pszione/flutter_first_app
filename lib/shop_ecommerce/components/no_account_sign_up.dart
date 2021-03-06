import 'package:flutter/material.dart';
import 'package:flutter_first_app/shop_ecommerce/sign_up/shop_sign_up_screen.dart';

import '../../size_config.dart';
import '../constants_shop.dart';

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
          onTap: () => Navigator.pushNamed(context, ShopSignUpScreen.routeName),
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
