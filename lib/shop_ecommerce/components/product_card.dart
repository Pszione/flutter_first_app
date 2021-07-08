import 'package:flutter/material.dart';
import 'package:flutter_first_app/shop_ecommerce/models/product.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants_shop.dart';
import '../../size_config.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key key,
    @required SizeConfig sizes,
    this.width = 140,
    this.imageAspectRatio = 1.02,
    @required this.product,
    @required this.productLink,
  })  : _sizes = sizes,
        super(key: key);

  final SizeConfig _sizes;
  final double width, imageAspectRatio;
  final Product product;
  final String productLink;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: kAppSafeBorderAs),
      child: SizedBox(
        width: _sizes.getProportionateScreenWidth(140),
        child: Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.02,
              child: Container(
                padding: EdgeInsets.all(kAppSafeBorderAs),
                decoration: BoxDecoration(
                  color: kSecondaryColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset(product.images[0]),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              '${product.title}\n',
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.black),
              maxLines: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  '\$${product.price}',
                  style: TextStyle(
                    fontSize: _sizes.getProportionateScreenWidth(18),
                    fontWeight: FontWeight.w600,
                    color: kPrimaryColor,
                  ),
                ),
                InkWell(
                  onTap: () {}, // UNDONE
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    padding:
                        EdgeInsets.all(_sizes.getProportionateScreenWidth(7)),
                    width: _sizes.getProportionateScreenWidth(28),
                    height: _sizes.getProportionateScreenWidth(28),
                    decoration: BoxDecoration(
                      color: product.isFavorite
                          ? kPrimaryColor.withOpacity(0.2)
                          : kSecondaryColor.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/Heart Icon_2.svg',
                      color: product.isFavorite
                          ? Colors.red.shade400
                          : Color(0xFFDBDEE4),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
