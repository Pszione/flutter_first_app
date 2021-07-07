import 'package:flutter/material.dart';

import '../../constants_shop.dart';
import '../../size_config.dart';

class SearchBarField extends StatelessWidget {
  const SearchBarField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SizeConfig _sizes = SizeConfig().init(context);
    return Container(
      width: SizeConfig.screenWidth * 0.6, // 60%
      // height: 60,
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        onChanged: (String value) {
          // search by string
        },
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: 'Search Product',
          prefixIcon: Icon(Icons.search),
          contentPadding: EdgeInsets.symmetric(
            horizontal: _sizes.getProportionateScreenWidth(20),
            vertical: _sizes.getProportionateScreenWidth(9),
          ),
        ),
      ),
    );
  }
}
