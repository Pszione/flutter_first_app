import 'package:flutter/material.dart';
import 'package:flutter_first_app/online_shop/home_screen/app_bar_with_search.dart';
import 'package:flutter_first_app/online_shop/home_screen/body.dart';

import '../../size_config.dart';

class ShopHomeScreen extends StatelessWidget {
  const ShopHomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SizeConfig _sizes = SizeConfig().init(context);
    return Scaffold(
      appBar: AppBarWithSearch(),
      body: Body(),
    );
  }
}
