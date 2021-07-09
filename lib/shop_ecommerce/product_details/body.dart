import 'package:flutter/material.dart';
import 'package:flutter_first_app/shop_ecommerce/models/product.dart';

class Body extends StatelessWidget {
  const Body({Key key, @required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
      ),
    );
  }
}
