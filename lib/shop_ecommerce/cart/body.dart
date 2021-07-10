import 'package:flutter/material.dart';
import 'package:flutter_first_app/shop_ecommerce/models/cart.dart';

import '../../size_config.dart';
import 'cart_item_card.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SizeConfig _sizes = SizeConfig().init(context);
    return Column(
      children: <Widget>[
        Dismissible(
          key: Key(demoCarts[0].product.id.toString()), // id
          background: Container(
            decoration: BoxDecoration(color: Colors.grey),
          ),
          child: CartItemCard(
            sizes: _sizes,
            cart: demoCarts[0],
          ),
        ),
      ],
    );
  }
}
