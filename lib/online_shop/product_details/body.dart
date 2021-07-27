import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_app/online_shop/constants_online_shop.dart';
import 'package:flutter_first_app/online_shop/models/product.dart';
import 'package:flutter_first_app/online_shop/product_details/product_color_and_size.dart';
import 'package:flutter_first_app/online_shop/product_details/product_description.dart';
import 'package:flutter_first_app/online_shop/product_details/product_title_with_image.dart';

import 'add_to_cart.dart';
import 'cart_counter.dart';

class Body extends StatelessWidget {
  const Body({Key key, @required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3), // 30%
                  padding: EdgeInsets.only(
                      top: size.height * 0.12,
                      left: kAppSafeBorderAs,
                      right: kAppSafeBorderAs),
                  //height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      ProductColorAndSize(product: product),
                      SizedBox(height: kAppSafeBorderAs / 2),
                      ProductDescription(product: product),
                      SizedBox(height: kAppSafeBorderAs / 2),
                      ProductCounterWithFavorite(),
                      SizedBox(height: kAppSafeBorderAs / 2),
                      AddToCart(product: product)
                    ],
                  ),
                ),
                ProductTitleWithImage(product: product)
              ],
            ),
          )
        ],
      ),
    );
  }
}
