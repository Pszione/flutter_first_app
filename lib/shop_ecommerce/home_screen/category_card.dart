import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants_shop.dart';
import '../../size_config.dart';

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
