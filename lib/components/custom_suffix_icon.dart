import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../size_config.dart';

class CustomSuffixIcon extends StatelessWidget {
  const CustomSuffixIcon({
    Key key,
    @required SizeConfig sizes,
    @required this.svgIcon,
  })  : _sizes = sizes,
        super(key: key);

  final SizeConfig _sizes;
  final String svgIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        0,
        _sizes.getProportionateScreenWidth(20),
        _sizes.getProportionateScreenWidth(20),
        _sizes.getProportionateScreenWidth(20),
      ),
      child: SvgPicture.asset(
        svgIcon,
        height: _sizes.getProportionateScreenWidth(18),
      ),
    );
  }
}
