import 'package:flutter/material.dart';
import 'package:flutter_first_app/shop_ecommerce/components/body.dart';
import 'package:flutter_first_app/size_config.dart';

class ShopSplashScreen extends StatelessWidget {
  const ShopSplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Call init on your start screen
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
