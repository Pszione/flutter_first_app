import 'package:flutter/material.dart';
import 'package:flutter_first_app/shop_ecommerce/login_success/body.dart';

class ShopLoginSuccessScreen extends StatelessWidget {
  const ShopLoginSuccessScreen({Key key}) : super(key: key);
  static String routeName = '/login_success';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
      ),
      body: Body(),
    );
  }
}
