import 'package:flutter/material.dart';
import 'package:flutter_first_app/shop_ecommerce/models/product.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../size_config.dart';
import '../constants_shop.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key key,
    @required this.product,
    @required SizeConfig sizes,
    @required this.heartSpacing,
    @required this.onPressMore,
  })  : _sizes = sizes,
        super(key: key);

  final Product product;
  final SizeConfig _sizes;
  final double heartSpacing;
  final GestureTapCallback onPressMore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: kAppSafeBorder,
          child: Text(
            product.title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        const SizedBox(height: 8),
        buildHeartBanner(),
        Padding(
          padding: EdgeInsets.only(
            left: kAppSafeBorderAs,
            right: _sizes.getProportionateScreenWidth(heartSpacing),
          ),
          child: Text(
            product.description,
            maxLines: 3,
          ),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: kAppSafeBorderAs, vertical: 10),
          child: GestureDetector(
            onTap: onPressMore,
            child: Row(
              children: const <Widget>[
                Text(
                  'See more detail',
                  style: TextStyle(
                      color: kPrimaryColor, fontWeight: FontWeight.w600),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: kPrimaryColor,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Align buildHeartBanner() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.all(_sizes.getProportionateScreenWidth(15)),
        width: _sizes.getProportionateScreenWidth(heartSpacing),
        decoration: BoxDecoration(
            color: product.isFavorite
                ? kPrimaryColor.withOpacity(0.2)
                : kSecondaryColor.withOpacity(0.1),
            // color: Color(0xFFFFE6E6),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            )),
        child: SvgPicture.asset(
          'assets/icons/Heart Icon_2.svg',
          color: product.isFavorite
              ? Colors.red.shade400
              : Colors.black38, // 0xFFDBDEE4
        ),
      ),
    );
  }
}
