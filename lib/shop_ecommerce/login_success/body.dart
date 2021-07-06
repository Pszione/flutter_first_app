import 'package:flutter/material.dart';
import 'package:flutter_first_app/shop_ecommerce/components/default_big_button.dart';
import 'package:flutter_first_app/shop_ecommerce/home_screen/shop_home_screen.dart';
import 'package:flutter_first_app/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SizeConfig _sizes = SizeConfig().init(context);
    return Column(
      children: <Widget>[
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Image.asset(
          'assets/images/success.png',
          height: SizeConfig.screenHeight * 0.4, // 40%
        ),
        SizedBox(height: _sizes.getProportionateScreenWidth(20)),
        Text(
          'Login Success!',
          style: TextStyle(
              fontSize: _sizes.getProportionateScreenWidth(30),
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
        SizedBox(height: _sizes.getProportionateScreenWidth(50)),
        SizedBox(
          width: SizeConfig.screenWidth * 0.7,
          child: DefaultBigButton(
            sizes: _sizes,
            text: 'Continue!',
            onPress: () {
              Navigator.pushNamed(context, ShopHomeScreen.routeName);
            },
          ),
        ),
      ],
    );
  }
}
