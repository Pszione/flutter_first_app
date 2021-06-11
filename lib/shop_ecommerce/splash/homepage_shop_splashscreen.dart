import 'package:flutter/material.dart';
import 'package:flutter_first_app/shop_ecommerce/splash/body.dart';
import 'package:flutter_first_app/size_config.dart';

class ShopSplashScreen extends StatelessWidget {
  const ShopSplashScreen({Key key}) : super(key: key);
  static String routeName = '/splash';

  @override
  Widget build(BuildContext context) {
    // Call init on your start screen
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(),
      body: Body(),
    );
  }
}
