import 'package:flutter/widgets.dart';
import 'package:flutter_first_app/shop_ecommerce/complete_profile/shop_complete_sign_up_profile_screen.dart';
import 'package:flutter_first_app/shop_ecommerce/forgot_password/forgot_password_screen.dart';
import 'package:flutter_first_app/shop_ecommerce/login_success/shop_login_success_screen.dart';
import 'package:flutter_first_app/shop_ecommerce/sign_up/shop_sign_up_screen.dart';
import 'package:flutter_first_app/shop_ecommerce/splash/homepage_shop_splashscreen.dart';
import 'package:flutter_first_app/shop_ecommerce/sign_in/shop_sign_in_screen.dart';

// All our app pages routes will be available here
final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  ShopSplashScreen.routeName: (BuildContext context) => ShopSplashScreen(),
  ShopSignInScreen.routeName: (BuildContext context) => ShopSignInScreen(),
  ShopForgotPasswordScreen.routeName: (BuildContext context) =>
      ShopForgotPasswordScreen(),
  ShopLoginSuccessScreen.routeName: (BuildContext context) =>
      ShopLoginSuccessScreen(),
  ShopSignUpScreen.routeName: (BuildContext context) => ShopSignUpScreen(),
  ShopCompleteSignUpProfileScreen.routeName: (BuildContext context) =>
      ShopCompleteSignUpProfileScreen(),
};
