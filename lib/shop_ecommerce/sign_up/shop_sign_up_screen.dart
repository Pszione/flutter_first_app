import 'package:flutter/material.dart';
import 'package:flutter_first_app/shop_ecommerce/sign_up/body.dart';

class ShopSignUpScreen extends StatelessWidget {
  const ShopSignUpScreen({Key key}) : super(key: key);
  static String routeName = '/sign_up';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Body(),
    );
  }
}
