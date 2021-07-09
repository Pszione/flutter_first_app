import 'package:flutter/material.dart';
import 'package:flutter_first_app/shop_ecommerce/product_details/body.dart';

class ShopProductDetailsScreen extends StatelessWidget {
  const ShopProductDetailsScreen({Key key}) : super(key: key);
  static String routeName = '/product_details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Body(),
    );
  }
}
