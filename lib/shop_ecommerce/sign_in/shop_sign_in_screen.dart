import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_app/shop_ecommerce/sign_in/body.dart';

import '../../size_config.dart';

class ShopSignInScreen extends StatelessWidget {
  const ShopSignInScreen({Key key}) : super(key: key);
  static String routeName = '/sign_in';
  @override
  Widget build(BuildContext context) {
    // Call init on your start screen
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign In',
          textAlign: TextAlign.center,
        ),
      ),
      body: Body(),
    );
  }
}
