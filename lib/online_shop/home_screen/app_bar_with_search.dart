import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants_online_shop.dart';

class AppBarWithSearch extends PreferredSize {
  const AppBarWithSearch({this.iconsColor = kTextColor});

  final Color iconsColor;

  @override
  //Size get preferredSize => super.preferredSize;
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Padding(
        padding: EdgeInsets.only(left: kAppSafeBorderAs),
        child: SizedBox(
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: iconsColor,
            ),
            //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            onPressed: () {},
          ),
        ),
      ),
      // onPressed: () {},
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            'assets/icons/search.svg',
            color: iconsColor,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset(
            'assets/icons/cart.svg',
            color: iconsColor,
          ),
          onPressed: () {},
        ),
        SizedBox(width: kAppSafeBorderAs),
      ],
    );
  }
}
