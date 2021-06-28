import 'package:flutter/material.dart';
import 'package:flutter_first_app/constants_shop.dart';

import '../../size_config.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SizeConfig _sizes = SizeConfig().init(context);
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: _sizes.getProportionateScreenWidth(20),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              Text(
                'OTP Verification',
                style: tHeadingStyle,
              ),
              Text(
                'We sent your code to +55 898 860 ***',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
            ],
          ),
        ),
      ),
    );
  }
}
