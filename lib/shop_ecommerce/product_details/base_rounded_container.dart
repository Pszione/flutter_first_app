import 'package:flutter/material.dart';

import '../../size_config.dart';
import '../constants_shop.dart';

class BaseRoundedContainer extends StatelessWidget {
  const BaseRoundedContainer({
    Key key,
    @required SizeConfig sizes,
    @required this.child,
    @required this.color,
  })  : _sizes = sizes,
        super(key: key);

  final SizeConfig _sizes;
  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: kAppSafeBorderAs),
      padding: EdgeInsets.only(top: kAppSafeBorderAs),
      width: double.infinity,
      // height: 300,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      child: child,
    );
  }
}
