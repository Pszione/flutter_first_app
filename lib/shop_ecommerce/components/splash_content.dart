import 'package:flutter/material.dart';

import '../../constants_shop.dart';
import '../../size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key key,
    @required SizeConfig sizes,
    @required this.subtitle,
    @required this.image,
  })  : _sizes = sizes,
        super(key: key);

  final SizeConfig _sizes;
  final String subtitle, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Text(
          'ECOMMERCE',
          style: TextStyle(
            fontSize: _sizes.getProportionateScreenWidth(36),
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          subtitle,
          textAlign: TextAlign.center,
        ),
        Spacer(
          flex: 2,
        ),
        Image.asset(
          image,
          width: _sizes.getProportionateScreenWidth(235),
          height: _sizes.getProportionateScreenHeight(265),
        ),
      ],
    );
  }
}
