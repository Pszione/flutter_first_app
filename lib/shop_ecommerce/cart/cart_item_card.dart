import 'package:flutter/material.dart';
import 'package:flutter_first_app/shop_ecommerce/models/cart.dart';

import '../../size_config.dart';
import '../constants_shop.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    Key key,
    @required SizeConfig sizes,
    @required this.cart,
  })  : _sizes = sizes,
        super(key: key);

  final SizeConfig _sizes;
  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: _sizes.getProportionateScreenWidth(88),
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(cart.product.images[0]),
            ),
          ),
        ),
        SizedBox(
          width: kAppSafeBorderAs,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              cart.product.title,
              style: TextStyle(fontSize: 16, color: Colors.black),
              maxLines: 2,
            ),
            const SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: '\$${cart.product.price}',
                style: TextStyle(
                  fontSize: _sizes.getProportionateScreenWidth(16),
                  color: kPrimaryColor,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: ' x${cart.numOfItems}',
                    style: TextStyle(
                      color: kTextGrayColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
