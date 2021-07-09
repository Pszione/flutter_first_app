import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../size_config.dart';
import '../constants_shop.dart';

class AppBarWithRating extends PreferredSize {
  const AppBarWithRating({@required this.rating});
  final double rating;

  @override
  //Size get preferredSize => super.preferredSize;
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    final SizeConfig _sizes = SizeConfig().init(context);
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: kAppSafeBorderAs),
        child: Padding(
          padding: kAppSafeBorder,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RoundedIconBtn(
                sizes: _sizes,
                icon: Icons.arrow_back_ios_new,
                onPress: () => Navigator.pop(context),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 17, vertical: 7),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$rating',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.black),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    SvgPicture.asset('assets/icons/Star Icon.svg'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RoundedIconBtn extends StatelessWidget {
  const RoundedIconBtn({
    Key key,
    @required SizeConfig sizes,
    @required this.icon,
    @required this.onPress,
  })  : _sizes = sizes,
        super(key: key);

  final SizeConfig _sizes;
  final IconData icon;
  final GestureTapCallback onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _sizes.getProportionateScreenWidth(40),
      height: _sizes.getProportionateScreenWidth(40),
      child: FlatButton(
        onPressed: onPress,
        padding: EdgeInsets.zero,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: Icon(icon),
      ),
    );
  }
}
