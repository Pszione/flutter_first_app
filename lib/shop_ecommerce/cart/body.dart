import 'package:flutter/material.dart';
import 'package:flutter_first_app/shop_ecommerce/constants_shop.dart';
import 'package:flutter_first_app/shop_ecommerce/models/cart.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../size_config.dart';
import 'cart_item_card.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final SizeConfig _sizes = SizeConfig().init(context);
    return Padding(
      padding: kAppSafeBorder,
      child: ListView.builder(
        itemCount: demoCarts.length,
        itemBuilder: (BuildContext context, int index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
            key: Key(demoCarts[index].product.id.toString()), // id
            direction: DismissDirection.endToStart,
            //
            background: DismissBackground(
              color: Color(0xFFFFE6E6),
              iconPath: 'assets/icons/Trash.svg',
            ),
            child: CartItemCard(
              sizes: _sizes,
              cart: demoCarts[index],
            ),
            onDismissed: (DismissDirection direction) {
              setState(() {
                demoCarts.removeAt(index);
              });
            },
          ),
        ),
      ),
    );
  }
}

class DismissBackground extends StatelessWidget {
  const DismissBackground({
    Key key,
    @required this.color,
    this.iconPath,
  }) : super(key: key);

  final Color color;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: kAppSafeBorderAs),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: <Widget>[
          Spacer(),
          if (iconPath != null) SvgPicture.asset(iconPath),
        ],
      ),
    );
  }
}
