import 'package:flutter/material.dart';
import 'package:flutter_first_app/shop_ecommerce/forgot_password/body.dart';

class ShopForgotPasswordScreen extends StatelessWidget {
  const ShopForgotPasswordScreen({Key key}) : super(key: key);
  static String routeName = '/forgot_password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Forgot Password',
          textAlign: TextAlign.center,
        ),
      ),
      body: Body(),
    );
  }
}
