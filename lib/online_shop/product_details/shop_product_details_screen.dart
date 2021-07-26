import 'package:flutter/material.dart';
import 'package:flutter_first_app/online_shop/constants_online_shop.dart';
import 'package:flutter_first_app/online_shop/models/product.dart';
import 'package:flutter_first_app/online_shop/product_details/body.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen(
      {Key key, @required this.product, this.iconsColor = Colors.white})
      : super(key: key);

  final Product product;
  final Color iconsColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // each product has it's own color
      backgroundColor: product.color,
      appBar: buildAppBarWithSearch(context),
      body: Body(product: product),
    );
  }

  AppBar buildAppBarWithSearch(BuildContext context) {
    return AppBar(
      backgroundColor: product.color,
      elevation: 0,
      leading: Padding(
        padding: EdgeInsets.only(left: kAppSafeBorderAs),
        child: IconButton(
          padding: EdgeInsets.zero,
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: iconsColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            'assets/icons/search.svg',
            color: iconsColor,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset(
            'assets/icons/cart.svg',
            color: iconsColor,
          ),
          onPressed: () {},
        ),
        SizedBox(width: kAppSafeBorderAs),
      ],
    );
  }
}
