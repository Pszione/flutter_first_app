import 'package:flutter/material.dart';
import 'package:flutter_first_app/shop_ecommerce/models/product.dart';
import 'package:flutter_first_app/shop_ecommerce/product_details/body.dart';

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
      appBar: AppBar(
        title: Text(routeArguments.product.title),
      ),
      body: Body(product: routeArguments.product),
    );
  }
}
