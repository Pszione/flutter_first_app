import 'package:flutter/material.dart';
import 'package:flutter_first_app/shop_ecommerce/home_screen/body.dart';

class ShopHomeScreen extends StatelessWidget {
  const ShopHomeScreen({Key key}) : super(key: key);
  static String routeName = '/home_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Home Screen'),
      // ),
      body: Body(),
    );
  }
}
