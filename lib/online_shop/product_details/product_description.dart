import 'package:flutter/material.dart';
import 'package:flutter_first_app/online_shop/models/product.dart';

import '../constants_online_shop.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: kAppSafeBorderAs),
      child: Text(
        product.description,
        style: TextStyle(height: 1.5),
        maxLines: 5,
      ),
    );
  }
}
