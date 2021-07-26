import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_app/online_shop/constants_online_shop.dart';
import 'package:flutter_first_app/online_shop/models/product.dart';
import 'package:flutter_first_app/online_shop/product_details/product_title_with_image.dart';

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
                      Row(
                        children: [
                          Column(
                            children: <Widget>[
                              Text('Pedro Santos Lindão'),
                              Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  // Border
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Color(0xFF356C95),
                                  ),
                                ),
                                // Fill
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: Color(0xFF356C95),
                                      shape: BoxShape.circle),
                                ),
                              ),
                            ],
                          )
                        ], // Color
                      )
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
