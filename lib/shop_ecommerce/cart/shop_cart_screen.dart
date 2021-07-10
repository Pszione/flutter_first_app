import 'package:flutter/material.dart';
import 'package:flutter_first_app/shop_ecommerce/cart/body.dart';
import 'package:flutter_first_app/shop_ecommerce/models/cart.dart';

class ShopCartScreen extends StatelessWidget {
  const ShopCartScreen({Key key}) : super(key: key);
  static String routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: <Widget>[
          Text(
            'Your Cart',
            style: TextStyle(color: Colors.black),
          ),
          Text(
            '${demoCarts.length} items',
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
