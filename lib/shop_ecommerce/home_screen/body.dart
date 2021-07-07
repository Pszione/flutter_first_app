import 'package:flutter/material.dart';
import 'package:flutter_first_app/shop_ecommerce/components/icon_btn_with_notification.dart';
import 'package:flutter_first_app/shop_ecommerce/components/search_bar_field.dart';
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
              buildHomeSearchHeader(_sizes),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildHomeSearchHeader(SizeConfig _sizes) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: _sizes.getProportionateScreenWidth(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          SearchBarField(),
          IconBtnWithNotificationDot(
            svgPath: 'assets/icons/Cart Icon.svg',
            onPress: () {},
          ),
          IconBtnWithNotificationDot(
            svgPath: 'assets/icons/Bell.svg',
            numCounter: 3,
            onPress: () {},
          ),
        ],
      ),
    );
  }
}
