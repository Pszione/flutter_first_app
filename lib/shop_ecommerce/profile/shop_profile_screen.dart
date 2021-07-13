import 'package:flutter/material.dart';
import 'package:flutter_first_app/shop_ecommerce/profile/body.dart';

class ShopProfileScreen extends StatelessWidget {
  const ShopProfileScreen({Key key}) : super(key: key);
  static String routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Body(),
    );
  }
}
