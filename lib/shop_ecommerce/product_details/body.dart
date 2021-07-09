import 'package:flutter/material.dart';
import 'package:flutter_first_app/shop_ecommerce/models/product.dart';
import 'package:flutter_first_app/shop_ecommerce/product_details/product_images_carousel.dart';
import 'package:flutter_first_app/size_config.dart';

import '../constants_shop.dart';

class Body extends StatelessWidget {
  const Body({Key key, @required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    final SizeConfig _sizes = SizeConfig().init(context);
    return ProductImages(sizes: _sizes, product: product);
  }
}
