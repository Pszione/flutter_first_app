import 'package:flutter/material.dart';
import 'package:flutter_first_app/shop_ecommerce/constants_shop.dart';
import 'package:flutter_first_app/shop_ecommerce/models/cart.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
            padding: EdgeInsets.symmetric(horizontal: kAppSafeBorderAs),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
            ), // 0xFFFFE6E6
            child: Row(
              children: <Widget>[
                Spacer(),
                SvgPicture.asset('assets/icons/Trash.svg'),
              ],
            ),
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
