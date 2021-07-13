import 'package:flutter/material.dart';
import 'package:flutter_first_app/shop_ecommerce/components/bottom_nav_bar_app.dart';
import 'package:flutter_first_app/shop_ecommerce/profile/body.dart';

import '../enums.dart';

class ShopProfileScreen extends StatelessWidget {
  const ShopProfileScreen({Key key}) : super(key: key);
  static String routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Body(),
      bottomNavigationBar: BottomNavBarApp(
        selectedMenu: MenuState.profile,
      ),
    );
  }
}
