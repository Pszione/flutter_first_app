import 'package:flutter/material.dart';
import 'package:flutter_first_app/shop_ecommerce/models/product.dart';
import 'package:flutter_first_app/shop_ecommerce/product_details/body.dart';

import 'app_bar_with_rating.dart';

// This is a bit different because
// we need a product specific route arguments
class ProductDetailsArguments {
  ProductDetailsArguments({@required this.product});
  final Product product;
}

class ShopProductDetailsScreen extends StatelessWidget {
  const ShopProductDetailsScreen({Key key}) : super(key: key);
  static String routeName = '/product_details';

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments routeArguments =
        ModalRoute.of(context).settings.arguments as ProductDetailsArguments;
    return Scaffold(
      backgroundColor: Color(0xFFE3E5E8), // 0xFFF5F6F9 // white kinda gray
      appBar: AppBarWithRating(rating: routeArguments.product.rating),
      body: Body(product: routeArguments.product),
    );
  }
}
