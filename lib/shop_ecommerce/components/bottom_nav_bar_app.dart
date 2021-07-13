import 'package:flutter/material.dart';
import 'package:flutter_first_app/shop_ecommerce/home_screen/shop_home_screen.dart';
import 'package:flutter_first_app/shop_ecommerce/profile/shop_profile_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants_shop.dart';
import '../enums.dart';

class BottomNavBarApp extends StatelessWidget {
  const BottomNavBarApp({
    Key key,
    @required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inactiveColor = Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: Offset(0, -12),
            blurRadius: 15,
            color: Color(0xFFDADADA).withOpacity(0.55),
          )
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: SvgPicture.asset(
                'assets/icons/Shop Icon.svg',
                color: MenuState.home == selectedMenu
                    ? kPrimaryColor
                    : inactiveColor,
              ),
              onPressed: () =>
                  Navigator.pushNamed(context, ShopHomeScreen.routeName),
            ),
            IconButton(
              icon: SvgPicture.asset(
                'assets/icons/Heart Icon.svg',
                color: MenuState.favorite == selectedMenu
                    ? kPrimaryColor
                    : inactiveColor,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: SvgPicture.asset(
                'assets/icons/Chat bubble Icon.svg',
                color: MenuState.messages == selectedMenu
                    ? kPrimaryColor
                    : inactiveColor,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: SvgPicture.asset(
                'assets/icons/User Icon.svg',
                color: MenuState.profile == selectedMenu
                    ? kPrimaryColor
                    : inactiveColor,
              ),
              onPressed: () =>
                  Navigator.pushNamed(context, ShopProfileScreen.routeName),
            )
          ],
        ),
      ),
    );
  }
}
