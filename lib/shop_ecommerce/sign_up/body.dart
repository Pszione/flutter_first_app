import 'package:flutter/material.dart';

import '../../constants_shop.dart';
import '../../size_config.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SizeConfig _sizes = SizeConfig().init(context);
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Text(
            'Register Account',
            style: tHeadingStyle,
          ),
        ],
      ),
    );
  }
}
