import 'package:flutter/material.dart';

import '../../size_config.dart';
import '../constants_shop.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key key,
    @required SizeConfig sizes,
    @required this.text,
    @required this.onPressMore,
  })  : _sizes = sizes,
        super(key: key);

  final SizeConfig _sizes;
  final String text;
  final GestureTapCallback onPressMore;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kAppSafeBorder,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(
                fontSize: _sizes.getProportionateScreenWidth(18),
                color: Colors.black),
          ),
          GestureDetector(
            onTap: onPressMore,
            child: Text('See more'),
          ),
        ],
      ),
    );
  }
}
