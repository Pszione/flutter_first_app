import 'package:flutter/material.dart';
import 'package:flutter_first_app/shop_ecommerce/profile/shop_profile_screen.dart';

import '../constants_shop.dart';
import 'category_card.dart';

class Categories extends StatelessWidget {
  const Categories({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> categories = [
      <String, String>{
        'icon': 'assets/icons/Flash Icon.svg',
        'text': 'Super Deals'
      },
      <String, String>{'icon': 'assets/icons/Bill Icon.svg', 'text': 'Bill'},
      <String, String>{'icon': 'assets/icons/Game Icon.svg', 'text': 'Game'},
      <String, String>{
        'icon': 'assets/icons/Gift Icon.svg',
        'text': 'Daily Gifts'
      },
      <String, String>{'icon': 'assets/icons/Discover.svg', 'text': 'More...'},
    ];
    return Padding(
      padding: kAppSafeBorder,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // cross axis is vertical/top/bottom
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // what is this 3 dots?
          ...List<CategoryCard>.generate(
            categories.length,
            (int index) => CategoryCard(
              iconPath: categories[index]['icon'],
              text: categories[index]['text'],
              onPress: () =>
                  Navigator.pushNamed(context, ShopProfileScreen.routeName),
            ),
          ),
        ],
      ),
    );
  }
}
