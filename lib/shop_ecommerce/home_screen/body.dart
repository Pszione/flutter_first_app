import 'package:flutter/material.dart';
import 'package:flutter_first_app/shop_ecommerce/cart/shop_cart_screen.dart';
import 'package:flutter_first_app/shop_ecommerce/components/icon_btn_with_notification.dart';
import 'package:flutter_first_app/shop_ecommerce/components/search_bar_field.dart';
import 'package:flutter_first_app/shop_ecommerce/constants_shop.dart';
import 'package:flutter_first_app/shop_ecommerce/home_screen/cashback_home_banner.dart';
import 'package:flutter_first_app/shop_ecommerce/home_screen/categories_section.dart';
import 'package:flutter_first_app/shop_ecommerce/home_screen/popular_products_section.dart';
import 'package:flutter_first_app/shop_ecommerce/home_screen/special_offers_section.dart';
import 'package:flutter_first_app/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SizeConfig _sizes = SizeConfig().init(context);
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              Padding(
                padding: kAppSafeBorder,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SearchBarField(),
                    IconBtnWithNotificationDot(
                      svgPath: 'assets/icons/Cart Icon.svg',
                      onPress: () => Navigator.pushNamed(
                          context, ShopCartScreen.routeName),
                    ),
                    IconBtnWithNotificationDot(
                      svgPath: 'assets/icons/Bell.svg',
                      numCounter: 3,
                      onPress: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              CashbackBanner(
                sizes: _sizes,
                bgColor: Color(0xFF4A3298),
                onPress: () {},
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              Categories(),
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              SpecialOffersSection(sizes: _sizes),
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              PopularProductsSection(sizes: _sizes)
            ],
          ),
        ),
      ),
    );
  }
}
