import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants_shop.dart';
import '../../size_config.dart';

class IconBtnWithNotificationDot extends StatelessWidget {
  const IconBtnWithNotificationDot({
    Key key,
    @required this.svgPath,
    this.numCounter = 0,
    @required this.onPress,
  }) : super(key: key);

  final String svgPath;
  final int numCounter;
  final GestureTapCallback onPress;

  @override
  Widget build(BuildContext context) {
    final SizeConfig _sizes = SizeConfig().init(context);
    return InkWell(
      // InkWell makes it clickable in a special way
      onTap: onPress,
      borderRadius: BorderRadius.circular(50),
      child: Stack(
        // Sobrepor two widgets
        clipBehavior: Clip.none, // Overflow.visible
        children: <Widget>[
          Container(
            width: _sizes.getProportionateScreenWidth(46),
            height: _sizes.getProportionateScreenWidth(46),
            padding: EdgeInsets.all(_sizes.getProportionateScreenWidth(11)),
            decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(svgPath),
          ),
          if (numCounter != 0) buildNotificationDot(_sizes),
        ],
      ),
    );
  }

  Positioned buildNotificationDot(SizeConfig _sizes) {
    return Positioned(
      top: -3,
      right: 0, // positioned made it work
      child: Container(
        width: _sizes.getProportionateScreenWidth(16),
        height: _sizes.getProportionateScreenWidth(16),
        decoration: BoxDecoration(
          color: Color(0xFFFF4848),
          shape: BoxShape.circle,
          border: Border.all(width: 1.5, color: Colors.white),
        ),
        child: Center(
          child: Text(
            '$numCounter',
            style: TextStyle(
              fontSize: _sizes.getProportionateScreenWidth(10),
              height: 1,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
