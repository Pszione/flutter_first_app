import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_app/shop_ecommerce/cart/body.dart';
import 'package:flutter_first_app/shop_ecommerce/components/default_big_button.dart';
import 'package:flutter_first_app/shop_ecommerce/constants_shop.dart';
import 'package:flutter_first_app/shop_ecommerce/models/cart.dart';
import 'package:flutter_first_app/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShopCartScreen extends StatelessWidget {
  const ShopCartScreen({Key key}) : super(key: key);
  static String routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: CheckOutCart(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: <Widget>[
          Text(
            'Your Cart',
            style: TextStyle(color: Colors.black),
          ),
          Text(
            '${demoCarts.length} items',
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}

class CheckOutCart extends StatelessWidget {
  const CheckOutCart({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SizeConfig _sizes = SizeConfig().init(context);
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: _sizes.getProportionateScreenWidth(30),
          vertical: _sizes.getProportionateScreenWidth(15)),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: Offset(0, -12),
            blurRadius: 20,
            color: Colors.grey.withOpacity(0.3),
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min, // important
          children: <Widget>[
            buildVoucherRow(_sizes),
            SizedBox(height: _sizes.getProportionateScreenWidth(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text.rich(
                  TextSpan(
                    text: 'Total:\n',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    children: <TextSpan>[
                      TextSpan(
                        text:
                            '\$${getDemoCartTotalPrice().floorToDouble()}', // backslash to cancel $ var function
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: _sizes.getProportionateScreenWidth(190),
              child: DefaultBigButton(
                sizes: _sizes,
                text: 'Check Out!',
                onPress: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row buildVoucherRow(SizeConfig _sizes) {
    return Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          width: _sizes.getProportionateScreenWidth(44),
          height: _sizes.getProportionateScreenWidth(44),
          decoration: BoxDecoration(
            // color: Color(0xFFEEEEEE),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(width: 1.4, color: kTextGrayColor),
          ),
          child: SvgPicture.asset('assets/icons/receipt.svg'),
        ),
        Spacer(),
        Text(
          'Add voucher code',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        const SizedBox(width: 10),
        Icon(Icons.arrow_forward_ios, size: 12, color: kTextGrayColor),
      ],
    );
  }
}
