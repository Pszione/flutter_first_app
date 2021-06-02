import 'package:flutter/widgets.dart';
import 'package:flutter_first_app/shop_ecommerce/homepage_shop_splashscreen.dart';

// All our app pages routes will be available here
final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  ShopSplashScreen.routeName: (BuildContext context) => ShopSplashScreen(),
};
