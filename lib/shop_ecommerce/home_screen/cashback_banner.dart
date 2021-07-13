import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_app/shop_ecommerce/cart/body.dart';
import 'package:flutter_first_app/shop_ecommerce/constants_shop.dart';

import '../../size_config.dart';

class CashbackBanner extends StatelessWidget {
  const CashbackBanner({
    Key key,
    @required SizeConfig sizes,
    this.bgColor = Colors.deepPurple,
    this.textColor = Colors.white,
    @required this.subtitle,
    @required this.discount,
    @required this.onPress,
  })  : _sizes = sizes,
        super(key: key);

  final SizeConfig _sizes;
  final Color bgColor;
  final Color textColor;
  final String subtitle;
  final int discount;
  final GestureTapCallback onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: _sizes.getProportionateScreenWidth(20),
        ),
        child: Dismissible(
          key: Key('cashback $discount'),
          background: DismissBackground(
            color: Colors.grey.shade200,
            //iconPath: 'assets/icons/Trash.svg',
          ),
          child: InkWell(
            onTap: onPress,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: _sizes.getProportionateScreenWidth(20),
                  vertical: _sizes.getProportionateScreenWidth(15)),
              width: double.infinity,
              //height: 90,
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text.rich(
                TextSpan(
                  text: '$subtitle\n',
                  style: TextStyle(color: textColor),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Cashback $discount%',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
