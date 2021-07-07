import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants_shop.dart';
import '../../size_config.dart';

class Categories extends StatelessWidget {
  const Categories({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SizeConfig _sizes = SizeConfig().init(context);
    final List<Map<String, String>> categories = [
      {'icon': 'assets/icons/Flash Icon.svg', 'text': 'Super Deals'},
      {'icon': 'assets/icons/Bill Icon.svg', 'text': 'Bill'},
      {'icon': 'assets/icons/Game Icon.svg', 'text': 'Game'},
      {'icon': 'assets/icons/Gift Icon.svg', 'text': 'Daily Gifts'},
      {'icon': 'assets/icons/Discover.svg', 'text': 'More...'},
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
              onPress: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key,
    @required this.iconPath,
    @required this.text,
    @required this.onPress,
  }) : super(key: key);

  //final List<Map<String, String>> categories;
  final String iconPath, text;
  final GestureTapCallback onPress;

  @override
  Widget build(BuildContext context) {
    final SizeConfig _sizes = SizeConfig().init(context);
    return GestureDetector(
      onTap: onPress,
      child: SizedBox(
        width: _sizes.getProportionateScreenWidth(55),
        child: Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                padding: EdgeInsets.all(_sizes.getProportionateScreenWidth(15)),
                decoration: BoxDecoration(
                  color: kSecondaryLightColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: SvgPicture.asset(iconPath),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              text,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
